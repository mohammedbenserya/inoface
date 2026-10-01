import 'package:cached_network_image/cached_network_image.dart';
import '../../../core/models/demandes_recuperation_model.dart';
import '../../../core/util/generateMaterialColor.dart';
import '../../../core/database/app_database.dart';
import '../../../core/usecases/constants.dart';
import '../../../core/util/url_service.dart';
import '../../../core/error/exceptions.dart';
import '../../login/models/input_login.dart';
import '../../../core/error/failures.dart';
import '../../../core/util/app_image.dart';
import '../../../core/usecases/enums.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../../../core/util/keys.dart';
import 'package:dartz/dartz.dart';
import 'recuperation_state.dart';
import 'package:get/get.dart';
import '../../../main.dart';
import 'dart:convert';



class RecuperationLogic extends GetxController {
  static RecuperationLogic instance = Get.find();
  final state = RecuperationState();


  Future<DemandesRecuperationModel> getLastResponse() {
    final jsonString = prefs.getString(Keys.CACHED_RECUPERATION);
    if (jsonString != null) {
      logger.i(jsonString);
      return Future.value(demandesRecuperationModelFromJson(jsonString));
    } else {
      throw CacheException(
        state: RequestState.cache,
        message: 'no_data_failure'.tr,
      );
    }
  }

  Future<void> cacheRecuperationModel(DemandesRecuperationModel model) async {
    await appDatabase.delete(appDatabase.recuperations).go();
    await prefs.setString(Keys.CACHED_RECUPERATION, demandesRecuperationModelToJson(model));
    await appDatabase.recuperationsDao.insertAllRecuperation(model.demandesRecuperation);
  }

  Future<DemandesRecuperationModel> getCurrentRecuperation(InputLogin input) async {
    try {
      logger.i("inoface_ws: ${input.toString()}");
      final response = await http.post(
          Uri.parse(utilsLogic.getUrl(UrlService.DEMANDE_RECUPERATION)), body: {
        'inoface_ws': input.toString(),
      });
      logger.i("getRecuperation: ${response.body}");
      return demandesRecuperationModelFromJson(response.body);
    } catch(e) {
      throw ServerException(
        state: RequestState.cache,
        message: '$e',
      );
    }
  }

  Future<Either<Failure, DemandesRecuperationModel>> getRecuperation(InputLogin input) async {
    if (networkState.isConnected) {
      try {
        DemandesRecuperationModel model = await getCurrentRecuperation(input);
        if (!model.erreur) {
          await cacheRecuperationModel(model);
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
        DemandesRecuperationModel model = await getLastResponse();
        return Right(model);
      } on CacheException catch (failure) {
        return Left(CacheFailure(
          message: failure.message,
          state: failure.state,
        ));
      }
    }
  }


  Future<void> addDemanderecuperation(InputLogin input) async {
    try {
      logger.v("inoface_ws: ${input.toString()}");
      final response = await http.post(Uri.parse(utilsLogic.getUrl(UrlService.ADD_DEMANDE_RECUPERATION)), body: {
        'inoface_ws': input.toString(),
      });
      final jsonResponse = json.decode(response.body);
      final hasError = jsonResponse['erreur'] ?? false;
      if (hasError ?? true) {
        utilsLogic.showSnack(type: SnackBarType.error, message: jsonResponse['message']);
      } else {
        DemandesRecuperationModel recuperationModel = await getCurrentRecuperation(input);
        if (!recuperationModel.erreur) {
          await cacheRecuperationModel(recuperationModel);
        }
        utilsLogic.showSnack(type: SnackBarType.success, title: jsonResponse['message']);
      }
    } catch (e) {
      logger.e(e);
    }
  }


  Future<bool> removeDemanderecuperationDialog({
    required BuildContext context,
    required Recuperation demande,
  }) async {
    try {
      return await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          titlePadding: const EdgeInsets.all(0),
          title: Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            color: Colors.pink,
            child: Text(
              'confirmation'.tr,
              textAlign: TextAlign.center,
              style: titleTextStyle.copyWith(
                color: Colors.white,
              ),
            ),
          ),
          content: Text('annuler_demande_recuperation'.tr),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text('no'.tr),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text('yes'.tr),
            ),
          ],
        ),
      ) ?? false;
    } catch (e) {
      logger.e(e);
    }
    return false;
  }

  Future<void> removeDemanderecuperation(InputLogin input, int id) async {
    try {
      final body = {
        'identifiant': input.identifiant.replaceAll(' ', ''),
        'motdepasse': input.motdepasse.replaceAll(' ', ''),
        'tokenmobile': input.tokenmobile?.replaceAll(' ', ''),
        'id_eleve_recuperations': id,
      };
      final response = await http.post(
          Uri.parse(utilsLogic.getUrl(UrlService.REMOVE_DEMANDE_RECUPERATION)), body: {
        'inoface_ws': json.encode(body),
      });

      final jsonResponse = json.decode(response.body);
      final hasError = jsonResponse['erreur'] ?? false;
      if (hasError ?? true) {
        utilsLogic.showSnack(type: SnackBarType.error, message: jsonResponse['message']);
      } else {

        final recuperationModel = await getCurrentRecuperation(input);
        if (!recuperationModel.erreur) {
          await appDatabase.delete(appDatabase.recuperations).go();
          await cacheRecuperationModel(recuperationModel);
        }
        utilsLogic.showSnack(type: SnackBarType.success, message: jsonResponse['message']);
      }
    } catch (e) {
      logger.e(e);
    }
  }

  Future<bool> addDemanderecuperationDialog({
    required BuildContext context,
    required List<Enfant> enfants
  }) async {
    try {
      return await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          titlePadding: const EdgeInsets.all(0),
          contentPadding: const EdgeInsets.all(2),
          title: Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            color: Colors.pink,
            child: Text(
              (enfants.length > 1) ? 'récupérer_enfants'.tr : 'récupérer_enfant'.tr,
              textAlign: TextAlign.center,
              style: titleTextStyle.copyWith(
                color: Colors.white,
              ),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: enfants
                .map((element) => Center(
              child: Card(
                elevation: 0,
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: CachedNetworkImage(
                            height: 45,
                            imageUrl: UrlService.rewriteInoserUri('${element.photo}'),
                            placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) => Center(
                              child: Image.asset(AppImage.defaultPhoto),
                            ),
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          element.prenom,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    )),
              ),
            ),
            ).toList(),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text('cancel'.tr),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text('yes'.tr),
            ),
          ],
        ),
      ) ?? false;
    } catch (e) {
      logger.e(e);
    }
    return false;
  }
}