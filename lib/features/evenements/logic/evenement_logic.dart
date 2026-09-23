import '../../../core/database/app_database.dart';
import '../models/input_evenements_by_id.dart';
import '../../../core/usecases/constants.dart';
import '../models/evenements_model_by_id.dart';
import '../../login/models/input_login.dart';
import '../../../core/error/exceptions.dart';
import '../../../core/util/url_service.dart';
import '../../../core/error/failures.dart';
import '../../../core/usecases/enums.dart';
import '../models/evenements_model.dart';
import '../models/input_evenements.dart';
import 'package:http/http.dart' as http;
import '../../../core/util/keys.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import '../../../main.dart';
import 'dart:developer';




class EvenementLogic extends GetxController {
  static EvenementLogic instance = Get.find();


  Future<List<Evenement>> getAllEvenementByIdPer(int idPersonne) async {
    return await appDatabase.evenementsDao.getAllEvenementByIdPer(idPersonne);
  }

  Future<InputEvenements> getInputEvenements(int idPpersonne) async {
    InputLogin login = authState.inputLogin!;
    List<Evenement> evenements = await appDatabase.evenementsDao.getAllEvenement();
    return InputEvenements(
      identifiant: login.identifiant,
      motdepasse: login.motdepasse,
      tokenmobile: login.tokenmobile,
      id_personne: idPpersonne,
      evenements: evenements,
    );
  }


  Future<bool> getEvenementById({required int id, required int idPer}) async {
    try {

      final checkEve = await appDatabase.evenementsDao.getEvenementByIdEveAndIdPer(idEve: id, idPer: idPer);
      if (checkEve != null) return true;
      final InputLogin? login = authState.inputLogin;
      if (networkState.isConnected && login != null) {
        final input = InputEvenementsById(
          id_evenement: id,
          id_personne: idPer,
          motdepasse: login.motdepasse,
          tokenmobile: login.tokenmobile,
          identifiant: login.identifiant,
        );

        final response = await utilsLogic.retryPost(
          url: utilsLogic.getUrl(UrlService.EVENEMENTS_BY_ID),
          body: {'inoface_ws': input.toString()}
        );

        EvenementsModelById modelById = evenementsByIdModelFromJson(response.body);
        if (modelById.erreur) {
          utilsLogic.showSnack(type: SnackBarType.error, message: modelById.message);
          return false;
        }
        await appDatabase.evenementsDao.insertEvenement(modelById.evenements!);
        await appDatabase.albumphotosDao.insertAllAlbumphoto(modelById.evenements!.albumphotos);
        await appDatabase.piecesjointesDao.insertAllPiecesjointe(modelById.evenements!.piecesjointes);
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

  Future<void> viewEvenementsById({required int idPer, required int idEven}) async {
    try {
      final count = CountEvenement(
        idEvenement: idEven,
        id_personne: idPer,
      );
      await appDatabase.countEvenementsDao.insertCountEvenement(count);
    } catch (e) {
      logger.e('e');
    }
  }

  Future<Evenement?> getEvenementByIdEveAndIdPer({required int idEve, required int idPer}) async {
    return await appDatabase.evenementsDao.getEvenementByIdEveAndIdPer(idEve: idEve, idPer: idPer);
  }

  Future<void> cacheEvenementsResponse(String body) async {
    await prefs.setString(Keys.CACHED_EVENEMENTS, body);
  }

  Future<EvenementsModel> getLastResponse() {
    final jsonString = prefs.getString(Keys.CACHED_EVENEMENTS);
    if (jsonString != null) {
      logger.i(jsonString);
      return Future.value(evenementsModelFromJson(jsonString));
    } else {
      throw CacheException(
        message: 'no_data_failure'.tr,
        state: RequestState.cache,
      );
    }
  }

  Future<void> cacheEvenements(EvenementsModel model, int idPersonne) async {
    try {
      // await appDatabase.deleteAllEvenementsByIdPer(idPersonne);
      await appDatabase.evenementsDao.deleteAllByIdPersonne(id: idPersonne);
      await appDatabase.evenementsDao.insertAllEvenement(model.evenements);
    } catch(e) {
      throw CacheException(
        state: RequestState.error,
        message: '$e',
      );
    }
  }

  Future<void> cacheAlbumphotos(EvenementsModel model, int idPersonne) async {
    try {
      List<Evenement> evens = await appDatabase.evenementsDao.getAllEvenementByIdPer(idPersonne);
      for (Evenement eve in evens) {
        // await appDatabase.deleteAllAlbumphotosByIdEve(eve.id_evenement);
        await appDatabase.albumphotosDao.deleteAllByIdEvenement(id: eve.id_evenement);
      }
      for(EvenementMod mod in model.evenements) {
        await appDatabase.albumphotosDao.insertAllAlbumphoto(mod.albumphotos);
      }
    } catch(e) {
      throw CacheException(
        state: RequestState.error,
        message: '$e',
      );
    }
  }

  Future<void> cachePiecesjointes(EvenementsModel model, int idPersonne) async {
    try {

      List<Evenement> evens = await appDatabase.evenementsDao.getAllEvenementByIdPer(idPersonne);
      for (Evenement eve in evens) {
        // await appDatabase.deleteAllPiecesjointesByIdEve(eve.id_evenement);
        await appDatabase.piecesjointesDao.deleteAllByIdEvenement(id: eve.id_evenement);
      }
      for(EvenementMod mod in model.evenements) {
        await appDatabase.piecesjointesDao.insertAllPiecesjointe(mod.piecesjointes);
      }
    } catch(e) {
      throw CacheException(
        state: RequestState.error,
        message: '$e',
      );
    }
  }

  Future<EvenementsModel> getConcreteEvenements(InputEvenements input) async {
    try {
      final response = await http.post(
        Uri.parse(utilsLogic.getUrl(UrlService.evenements)),
        body: {
          'inoface_ws': input.toString(),
        },
      );

      log("getConcreteEvenements: \n${response.body}");

      if (response.statusCode == 200) await cacheEvenementsResponse(response.body);
      return evenementsModelFromJson(response.body);
    } catch (e) {
      throw ServerException(
        state: RequestState.server,
        message: '$e',
      );
    }
  }

  Future<Either<Failure, EvenementsModel>> getEvenements(InputEvenements input) async {
    if (networkState.isConnected) {
      try {
        EvenementsModel model = await getConcreteEvenements(input);
        if (!model.erreur) {
          await cacheEvenements(model, input.id_personne);
          await cacheAlbumphotos(model, input.id_personne);
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
        EvenementsModel model = await getLastResponse();
        return Right(model);
      } on CacheException catch (failure) {
        return Left(CacheFailure(
          message: failure.message,
          state: failure.state,
        ));
      }
    }
  }

}