import 'package:dartz/dartz.dart';
import 'package:inoface/core/usecases/constants.dart';
import 'package:inoface/core/usecases/enums.dart';
import 'package:http/http.dart' as http;
import '../../../core/error/failures.dart';
import '../../../core/util/keys.dart';
import '../../../main.dart';
import '../../login/models/input_login.dart';
import '../models/informations_model.dart';
import '../models/input_informations.dart';
import '../models/input_informations_by_id.dart';
import '../models/informations_model_by_id.dart';
import '../../../core/database/app_database.dart';
import '../../../core/error/exceptions.dart';
import '../../../core/util/url_service.dart';
import 'informations_state.dart';
import 'package:get/get.dart';
import 'dart:developer';



class InformationsLogic extends GetxController {
  static InformationsLogic instance = Get.find();
  final state = InformationsState();



  Future<InputInformations> getInputInformations(int idPpersonne) async {
    try {
      InputLogin login = authState.inputLogin!;
      List<Information> informations = await appDatabase.informationsDao.getAllInformation();
      var jsonInfo = informations.map((e) => e.toJson()).toList();
      return InputInformations(
        identifiant: login.identifiant,
        motdepasse: login.motdepasse,
        tokenmobile: login.tokenmobile,
        id_personne: idPpersonne,
        informations: jsonInfo.toString(),
      );
    } catch (e) {
      logger.e(e);
      throw CacheException(
        state: RequestState.cache,
        message: '$e',
      );
    }
  }


  Future<bool> getInformationById({
    required int idPer,
    required int id,
  }) async {
    try {
      final checkInfo = await appDatabase.informationsDao.getInformationByIdEveAndIdPer(idInfo: id, idPer: idPer);
      if (checkInfo != null) return true;
      InputLogin? login = authState.inputLogin;
      if (networkState.isConnected && login != null) {
        final input = InputInformationsById(
          id_information: id,
          id_personne: idPer,
          motdepasse: login.motdepasse,
          tokenmobile: login.tokenmobile,
          identifiant: login.identifiant,
        );

        final response = await utilsLogic.retryPost(
          url: utilsLogic.getUrl(UrlService.INFORMATIONS_BY_ID),
          body: {'inoface_ws': input.toStringModel()}
        );

        InformationsModelById modelById = informationsByIdModelFromJson(response.body);
        if (modelById.erreur) {
          utilsLogic.showSnack(type: SnackBarType.error, message: modelById.message);
          return false;
        }

        await appDatabase.informationsDao.insertInformation(modelById.informations!);
        await appDatabase.piecesjointesDao.insertAllPiecesjointe(modelById.informations!.piecesjointes);
        return true;
      } else {
        utilsLogic.showSnack(type: SnackBarType.unconnected);
        return false;
      }
    } catch (e) {
      logger.e(e);
      utilsLogic.showSnack(type: SnackBarType.error, message: '$e');
      return false;
    }
  }

  Future<void> viewInformationsById({required int idPer, required int idInfo}) async {
    try {
      final count = CountInformation(
        idInformation: idInfo,
        id_personne: idPer,
      );
      await appDatabase.countInformationsDao.insertCountInformation(count);
    } catch (e) {
      utilsLogic.showSnack(type: SnackBarType.error, message: '$e');
      logger.e('$e');
    }
  }

  Future<Information?> getInformationByIdEveAndIdPer({required int idInfo, required int idPer}) async {
    return await appDatabase.informationsDao.getInformationByIdEveAndIdPer(idInfo: idInfo, idPer: idPer);
  }

  Future<List<Information>> getAllInformationByIdPer(int idPersonne) async {
    return await appDatabase.informationsDao.getAllInformationByIdPer(idPersonne);
  }

  Future<Either<Failure, InformationsModel>> getInformations(InputInformations input) async {
    if (networkState.isConnected) {
      try {
        InformationsModel model = await getConcreteInformations(input);
        if (!model.erreur) {
          await cacheInformations(model, input.id_personne);
          await cachePiecesjointes(model, input.id_personne);
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
        InformationsModel model = await getLastResponse();
        return Right(model);
      } on CacheException catch (failure) {
        return Left(CacheFailure(
          message: failure.message,
          state: failure.state,
        ));
      }
    }
  }

  Future<InformationsModel> getConcreteInformations(InputInformations input) async {
    try {
      log("getConcreteInformations: inoface_ws: ${input.toString()}");
      final response = await http.post(Uri.parse(utilsLogic.getUrl(UrlService.INFORMATIONS)), body: {
        'inoface_ws': input.toString(),
      });
      logger.i("getConcreteInformations: ${response.body}");
      if (response.statusCode == 200) {
        await cacheInformationsResponse(response.body);
      }
      return informationsModelFromJson(response.body);
    } catch (e) {
      throw ServerFailure(
        state: RequestState.error,
        message: '$e',
      );
    }
  }

  Future<void> cacheInformationsResponse(String body) async {
    await prefs.setString(Keys.CACHED_INFORMATION, body);
  }

  Future<InformationsModel> getLastResponse() {
    final jsonString = prefs.getString(Keys.CACHED_INFORMATION);
    if (jsonString != null) {
      logger.i(jsonString);
      return Future.value(informationsModelFromJson(jsonString));
    } else {
      throw CacheException(
        state: RequestState.cache,
        message: 'no_data_failure'.tr,
      );
    }
  }

  Future<void> cacheInformations(InformationsModel model, int idPerson) async {
    try {
      // await appDatabase.deleteAllInformationsByIdPer(idPerson);
      await appDatabase.informationsDao.deleteAllByIdPersonne(id: idPerson);
      await appDatabase.informationsDao.insertAllInformation(model.informations);
    } catch(e) {
      throw CacheException(
        state: RequestState.error,
        message: '$e',
      );
    }
  }

  Future<void> cachePiecesjointes(InformationsModel model, int idPerson) async {
    try {
      List<Information> infos = await appDatabase.informationsDao.getAllInformationByIdPer(idPerson);
      for(Information info in infos) {
        // await appDatabase.deleteAllPiecesjointesByIdInfo(info.id_information);
        await appDatabase.piecesjointesDao.deleteAllByIdInformation(id: info.id_information);
      }
      for(var mod in model.informations) {
        await appDatabase.piecesjointesDao.insertAllPiecesjointe(mod.piecesjointes);
      }
    } catch(e) {
      throw CacheException(
        state: RequestState.error,
        message: '$e',
      );
    }
  }
}