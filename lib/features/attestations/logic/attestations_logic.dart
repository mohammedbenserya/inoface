import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import '../../../core/error/exceptions.dart';
import '../../../core/error/failures.dart';
import '../../../core/usecases/constants.dart';
import '../../../core/usecases/enums.dart';
import '../../../core/util/keys.dart';
import '../../../core/util/url_service.dart';
import '../../../main.dart';
import '../../login/models/input_login.dart';
import '../models/add_demandeattestation_model.dart';
import '../models/demande_attestations_model.dart';
import '../models/input_attestation.dart';
import 'attestations_state.dart';



class AttestationsLogic extends GetxController {
  static AttestationsLogic instance = Get.find();
  final state = AttestationsState();

  InputAttestation? getInputAttestation(int idPer) {
    InputLogin? login = authState.inputLogin;
    if (login != null) {
      return InputAttestation(
        id_personne: idPer,
        identifiant: login.identifiant,
        motdepasse: login.motdepasse,
        tokenmobile: login.tokenmobile,
        nombre_de_copies: 0,
      );
    } else {
      return null;
    }
  }

  Future<InputAttestation?> addDemandeAttestations(BuildContext context, int idPersonne) async {
    final TextEditingController controller = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          color: Colors.pink.shade700,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Text(
              'new_certificate'.tr,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        content: Form(
          key: formKey,
          child: TextFormField(
            autofocus: true,
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'number_copies'.tr,
              icon: Icon(MdiIcons.file),
            ),
            validator: utilsLogic.numberValidator,
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('ok'.tr),
            onPressed: () async {
              if (formKey.currentState?.validate() ?? false) {
                if (int.parse(controller.text.trim()) > 3) {
                  utilsLogic.showSnack(type: SnackBarType.warning, message: 'max_number'.tr);
                } else if (await utilsLogic.checkDateDemande(idPersonne)) {
                  InputLogin login = authState.inputLogin!;
                  final input = InputAttestation(
                    id_personne: idPersonne,
                    nombre_de_copies: int.parse(controller.text.trim()),
                    identifiant: login.identifiant,
                    motdepasse: login.motdepasse,
                    tokenmobile: login.tokenmobile,
                  );
                  Navigator.pop(context, input);
                } else {
                  Navigator.pop(context);
                  utilsLogic.showSnack(type: SnackBarType.warning, message: 'limit_note'.tr);
                }
              } else {
                return;
              }
            },
          ),
          TextButton(
            child: Text('cancel'.tr),
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),
    );
  }

  Future<Either<Failure, AddDemandeattestationModel>> demandeAttestations(InputAttestation input) async {
    if (networkState.isConnected) {
      try {
        AddDemandeattestationModel model = await addAttestations(input);
        if (!model.erreur) {
          await cacheAddAttestations(model, input.id_personne);
          DemandeAttestationsModel demandModel = await getConcreteAttestations(input);
          if (!model.erreur) {
            await cacheAttestations(demandModel, input.id_personne);
          }
        }
        return Right(model);
      } on ServerException catch (failure) {
        return Left(ServerFailure(
          message: failure.message,
          state: failure.state,
        ));
      }
    } else {
      try {
        DemandesAttestationMod attestationMod = DemandesAttestationMod(
          idEleveAttestationScolaire: utilsLogic.createUniqueId(),
          idPersonneParent: utilsLogic.createUniqueId(),
          nombreDeCopies: input.nombre_de_copies,
          idPersonneEleve: input.id_personne,
          dateDeLaDemande: DateTime.parse(DateFormat('yyyy-MM-dd').format(DateTime.now())),
          statut: 'Attestation(s) demandée - Mode hors-ligne',
          idstatut: 1,
          send: false,
        );

        await cacheAddAttestationsOffline(attestationMod);
        AddDemandeattestationModel model = AddDemandeattestationModel(
          erreur: false, message: 'offline_mode'.tr,
        );
        return Right(model);
      } on CacheException catch (failure) {
        return Left(CacheFailure(
          message: failure.message,
          state: failure.state,
        ));
      }
    }
  }

  Future<Either<Failure, DemandeAttestationsModel>> getAttestations(InputAttestation input) async {
    if (networkState.isConnected) {
      try {
        DemandeAttestationsModel model = await getConcreteAttestations(input);
        if (!model.erreur) {
          await cacheAttestations(model, input.id_personne);
        }
        return Right(model);
      } on ServerException catch (failure) {
        return Left(ServerFailure(
          message: failure.message,
          state: failure.state,
        ));
      }
    } else {
      try {
        DemandeAttestationsModel model = await getLastAttestationsJson();
        return Right(model);
      } on CacheException catch (failure) {
        return Left(CacheFailure(
          message: failure.message,
          state: failure.state,
        ));
      }
    }
  }

  Future<void> cacheAttestationsJson(String body) async {
    await prefs.setString(Keys.ATTESTATION_RESPONSE, body);
  }

  Future<void> cacheAddAttestationsJson(String body) async {
    await prefs.setString(Keys.ADD_ATTESTATION_RESPONSE, body);
  }

  Future<DemandeAttestationsModel> getLastAttestationsJson() {
    final jsonString = prefs.getString(Keys.ATTESTATION_RESPONSE);
    if (jsonString != null) {
      logger.i(jsonString);
      return Future.value(demandeAttestationsModelFromJson(jsonString));
    } else {
      throw CacheException(
        state: RequestState.cache,
        message: 'no_data_failure'.tr,
      );
    }
  }

  Future<AddDemandeattestationModel> getLastAddAttestationsJson() {
    final jsonString = prefs.getString(Keys.ADD_ATTESTATION_RESPONSE);
    if (jsonString != null) {
      logger.i(jsonString);
      return Future.value(addDemandeattestationModelFromJson(jsonString));
    } else {
      throw CacheException(
        state: RequestState.cache,
        message: 'no_data_failure'.tr,
      );
    }
  }

  Future<void> cacheAttestations(DemandeAttestationsModel model, int idEleve) async {
    try {
      // await appDatabase.deleteAllEleveAttestationScolairesByIdEleve(idEleve);
      await appDatabase.eleveAttestationScolairesDao.deleteAllByIdPersonneEleve(id: idEleve);

      // await appDatabase.deleteAllDemandesAttestationsByIdEleve(idEleve);
      await appDatabase.demandesAttestationsDao.deleteAllByIdPersonneEleve(id: idEleve);

      await appDatabase.demandesAttestationsDao.insertAllDemandesAttestations(model.demandesAttestations);
    } catch(e) {
      throw CacheException(
        state: RequestState.error,
        message: '$e',
      );
    }
  }

  Future<void> cacheAddAttestations(AddDemandeattestationModel model, int idEleve) async {
    try {
      if (model.eleveAttestationScolaire != null) {
        await appDatabase.eleveAttestationScolairesDao.insertAttestationScolaire(model.eleveAttestationScolaire!);
      }
    } catch(e) {
      throw CacheException(
        state: RequestState.error,
        message: '$e',
      );
    }
  }

  Future<void> cacheAddAttestationsOffline(DemandesAttestationMod model) async {
    try {
      await appDatabase.demandesAttestationsDao.insertDemandesAttestations(model);
    } catch(e) {
      throw CacheException(
        state: RequestState.error,
        message: '$e',
      );
    }
  }

  Future<AddDemandeattestationModel> addAttestations(InputAttestation input) async {
    try {
      logger.i("addAttestations: inoface_ws: ${input.toString()}");
      final response = await http.post(
          Uri.parse(utilsLogic.getUrl(UrlService.ADD_DEMANDE_ATTESTATION)), body: {
        'inoface_ws': input.toString()}
      );

      logger.i("addAttestations body: ${response.body}");
      if (response.statusCode == 200) {
        cacheAddAttestationsJson(response.body);
      }
      return addDemandeattestationModelFromJson(response.body);
    } catch(e) {
      throw ServerException(
        state: RequestState.server,
        message: '$e',
      );
    }
  }

  Future<DemandeAttestationsModel> getConcreteAttestations(InputAttestation input) async {
    try {
      final response = await http.post(
          Uri.parse(utilsLogic.getUrl(UrlService.DEMANDE_ATTESTATION)), body: {
        'inoface_ws': input.toString()}
      );
      logger.i("getConcreteAttestations: ${response.statusCode}");
      log(response.body);
      if (response.statusCode == 200) {
        cacheAttestationsJson(response.body);
      }
      return demandeAttestationsModelFromJson(response.body);

    } catch(e) {
      throw ServerException(
        state: RequestState.server,
        message: '$e',
      );
    }
  }

}