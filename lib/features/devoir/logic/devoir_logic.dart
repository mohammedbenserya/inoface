import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:date_format/date_format.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:inoface/core/usecases/enums.dart';
import '../../../core/error/exceptions.dart';
import '../../../core/error/failures.dart';
import '../../../core/usecases/constants.dart';
import '../../../core/util/keys.dart';
import '../../../core/util/url_service.dart';
import '../../../main.dart';
import '../../login/models/input_login.dart';
import '../models/devoir_model.dart';
import '../models/devoirs_dates_model.dart';
import '../models/input_devoir.dart';
import 'devoir_state.dart';



class DevoirLogic extends GetxController {
  static DevoirLogic instance = Get.find();
  final state = DevoirState();


  updateDateTime(DateTime val) {
    state.dateTimeLocal = val;
    update();
    log('dateTime: ${state.dateTimeLocal}');
  }


  InputDevoir? getInputDevoir(int idPersonne) {
    InputLogin? login = authState.inputLogin;
    if (login != null) {
      return InputDevoir(
        id_personne: idPersonne,
        identifiant: login.identifiant,
        motdepasse: login.motdepasse,
        tokenmobile: login.tokenmobile,
        date_devoir: formatDate(state.dateTimeLocal, [yyyy, '-', mm, '-', dd]),
      );
    } else {
      return null;
    }
  }


  Future<void> cacheDevoirResponse(String body) async {
    await prefs.setString(Keys.CACHED_DEVOIR, body);
  }


  Future<DevoirModel> getLastResponse() {
    final jsonString = prefs.getString(Keys.CACHED_DEVOIR);
    if (jsonString != null) {
      logger.i(jsonString);
      return Future.value(devoirsModelFromJson(jsonString));
    } else {
      throw CacheException(
        message: 'no_data_failure'.tr,
        state: RequestState.cache,
      );
    }
  }

  Future<void> cacheDevoir(DevoirModel model, int idPersonne) async {
    try {

      await appDatabase.delete(appDatabase.devoirs).go();
      await appDatabase.delete(appDatabase.devoirPiecesjointes).go();

      await appDatabase.devoirsDao.insertAllDevoir(model.devoirs);
      for (DevoirMod mod in model.devoirs) {
        await appDatabase.devoirPiecesjointesDao.insertAllDevoirPiecesjointe(mod.piecesjointes);
      }
    } catch(e) {
      throw CacheException(
        state: RequestState.cache,
        message: '$e',
      );
    }
  }

  Future<DevoirModel> getConcreteDevoir(InputDevoir input) async {
    try {

      final response = await http.post(Uri.parse(utilsLogic.getUrl(UrlService.devoirs)), body: {
        'inoface_ws': input.toString(),
      });

      logger.i("getConcreteDevoir: ${response.body}");

      if (response.statusCode == 200) {
        await cacheDevoirResponse(response.body);
      }
      return devoirsModelFromJson(response.body);
    } catch (e) {
      throw ServerException(
        state: RequestState.server,
        message: '$e',
      );
    }
  }

  Future<Either<Failure, DevoirModel>> getDevoir(InputDevoir input) async {
    if (networkState.isConnected) {
      try {
        DevoirModel model = await getConcreteDevoir(input);
        if (!model.erreur) {
          await cacheDevoir(model, input.id_personne);
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
        DevoirModel model = await getLastResponse();
        return Right(model);
      } on CacheException catch (failure) {
        logger.e("error_connection".tr);
        return Left(CacheFailure(
          message: failure.message,
          state: failure.state,
        ));
      }
    }
  }

  Future<Either<Failure, DevoirsDatesModel>> getAllDevoirsDates(int idPer) async {
    if (networkState.isConnected) {
      try {
        final model = await _getDevoirsDates(idPer);
        return Right(model);
      } on ServerException catch (failure) {
        return Left(ServerFailure(
          message: failure.message,
          state: failure.state,
        ));
      }
    } else {
      return Left(NetworkFailure(
        message: 'error_connection'.tr,
        state: RequestState.network,
      ));
    }
  }

  Future<DevoirsDatesModel> _getDevoirsDates(int idPer) async {
    try {
      InputLogin input = authState.inputLogin!;
      var body = {
        'identifiant': input.identifiant.replaceAll(' ', ''),
        'motdepasse': input.motdepasse.replaceAll(' ', ''),
        'tokenmobile': input.tokenmobile?.replaceAll(' ', ''),
        'id_personne': idPer,
      };
      final response = await http.post(Uri.parse(utilsLogic.getUrl(UrlService.GET_DEVOIRS_DATES)),
        body: {'inoface_ws': json.encode(body)},
      );

      if (response.statusCode == 200) {
        if (prefs.containsKey(Keys.CACHED_DEVOIR_DATES)) {
          await prefs.remove(Keys.CACHED_DEVOIR_DATES);
        }
        await prefs.setString(Keys.CACHED_DEVOIR_DATES, response.body);
      }
      return devoirsDatesModelFromJson(response.body);
    } catch(e) {
      throw ServerException(
        state: RequestState.error,
        message: '$e',
      );
    }
  }

}