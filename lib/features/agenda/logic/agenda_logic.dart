import 'package:inoface/features/agenda/models/agenda_model_by_id.dart';
import 'package:inoface/features/agenda/models/agenda_model.dart';
import 'package:inoface/core/usecases/enums.dart';
import '../../../core/database/app_database.dart';
import '../../../core/usecases/constants.dart';
import 'package:date_format/date_format.dart';
import '../../../core/util/url_service.dart';
import '../../login/models/input_login.dart';
import '../../../core/error/exceptions.dart';
import '../models/input_agenda_config.dart';
import '../models/agenda_config_model.dart';
import '../../../core/error/failures.dart';
import '../models/agenda_dates_model.dart';
import '../models/input_agenda_by_id.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../../../core/util/keys.dart';
import '../models/input_agenda.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import '../../../main.dart';
import 'agenda_state.dart';
import 'dart:developer';




class AgendaLogic extends GetxController {
  static AgendaLogic instance = Get.find();
  final state = AgendaState();


  updateDateTime(DateTime val) {
    state.dateTimeLocal = val;
    update();
  }

  Future<bool> getAgendaById({required int id, required int idPer}) async {
    try {
      final checkAgenda = await appDatabase.agendasDao.getAgendasByIdAgendaAndIdPer(idAgenda: id, idPer: idPer);
      if (checkAgenda != null) return true;
      if (kDebugMode) log('id_agenda: $id');
      if (networkState.isConnected) {
        final InputLogin? login = authState.inputLogin;
        if (login != null) {
          final input = InputAgendaById(
            id_agenda: id,
            id_personne: idPer,
            motdepasse: login.motdepasse,
            tokenmobile: login.tokenmobile,
            identifiant: login.identifiant,
          );

          final response = await utilsLogic.retryPost(
            url: utilsLogic.getUrl(UrlService.AGENDA_BY_ID),
            body: {'inoface_ws': input.toString()}
          );

          if (kDebugMode) {
            log('getAgendaById, body: ${response.body}');
          }

          AgendaModelById modelById = agendaModelByIdFromJson(response.body);
          if (modelById.erreur) {
            utilsLogic.showSnack(type: SnackBarType.error, message: modelById.message);
            return false;
          }

          if (kDebugMode) {
            log('getAgendaById, modelById: ${modelById.agendas}');
          }

          if (modelById.agendas != null) {
            await appDatabase.agendasDao.insertAgenda(modelById.agendas!);
            await appDatabase.agendaNotesDao.insertAllAgendaNote(modelById.agendas!.agendaNotes);
            await appDatabase.agendaDetailsDao.insertAllAgendaDetail(modelById.agendas!.agendaDetails);
            await appDatabase.agendaPhotoDetailsDao.insertAllAgendaPhotoDetail(modelById.agendas!.agendaPhotoDetails);
            return true;
          }
        }
      } else {
        utilsLogic.showSnack(type: SnackBarType.unconnected);
      }
    } catch (e) {
      logger.i(e);
      utilsLogic.showSnack(type: SnackBarType.error, message: '$e');
    }
    return false;
  }

  Future<Agenda?> getAgendasByIdAgendaAndIdPer({required int idAgenda, required int idPer}) async {
    if (kDebugMode) log('id_agenda: $idAgenda');
    return await appDatabase.agendasDao.getAgendasByIdAgendaAndIdPer(idAgenda: idAgenda, idPer: idPer);
  }

  InputAgendaConfig? getInputAgendaConfig(int idPersonne) {
    final InputLogin? login = authState.inputLogin;
    if (login != null) {
      return InputAgendaConfig(
        id_personne: idPersonne,
        identifiant: login.identifiant,
        motdepasse: login.motdepasse,
        tokenmobile: login.tokenmobile,
        lastupdate: formatDate(DateTime.now(), [yyyy, '-', mm, '-', dd, ' ', HH, ':', nn]),
      );
    } else {
      return null;
    }
  }

  InputAgenda? getInputAgenda({required int idPersonne, required String date}) {
    final InputLogin? login = authState.inputLogin;
    if (login != null) {
      return InputAgenda(
        id_personne: idPersonne,
        identifiant: login.identifiant,
        motdepasse: login.motdepasse,
        tokenmobile: login.tokenmobile,
        date_agenda: date,
      );
    } else {
      return null;
    }
  }

  Future<Map<DateTime, List>> agendaDates() async {
    final Map<DateTime, List> events = {};
    try {
      List<AgendaDate> dates = await appDatabase.agendaDatesDao.getAllAgendaDate();
      if (dates.isNotEmpty) {
        for (AgendaDate agend in dates) {
          if (agend.date_agenda != null) {
            events[agend.date_agenda!] = [agend];
          }
        }
      }
    } catch (e) {
      logger.e(e);
    }
    return events;
  }

  Future<Either<Failure, AgendaConfigModel>> getConfig(InputAgendaConfig input) async {
    if (networkState.isConnected) {
      try {
        AgendaConfigModel model = await getConcreteAgendaConfig(input);
        if (!model.erreur) {
          await cacheAgendaConfig(model);
        }
        AgendaDatesModel dates = await getConcreteAgendaDates(input);
        if (dates.erreur == false) {
          await cacheAgendaDates(dates);
        }
        return Right(model);
      } on ServerException catch (failure) {
        return Left(ServerFailure(
          message: failure.message,
          state: failure.state,
        ));
      }
    } else {
      return Left(NetworkFailure(
        message: "error_connection".tr,
        state: RequestState.network,
      ));
    }
  }

  Future<Either<Failure, AgendaModel>> getAgenda(InputAgenda input) async {
    if (networkState.isConnected) {
      try {
        AgendaModel model = await getConcreteAgenda(input);
        if (!model.erreur) {
          await cacheAgenda(model);
        }
        return Right(model);
      } on ServerException catch (failure) {
        return Left(ServerFailure(
          message: failure.message,
          state: failure.state,
        ));
      }
    } else {
      return Left(NetworkFailure(
        message: "error_connection".tr,
        state: RequestState.network,
      ));
    }
  }

  Future<void> cacheAgendaConfigResponse(String body) async {
    await prefs.setString(Keys.CACHE_AGENDA_CONFIG, body);
  }

  Future<AgendaConfigModel> getLastResponse() {
    final jsonString = prefs.getString(Keys.CACHE_AGENDA_CONFIG);
    if (jsonString != null) {
      logger.i(jsonString);
      return Future.value(agendaConfigModelFromJson(jsonString));
    } else {
      throw CacheException(
        message: "no_data_failure".tr,
        state: RequestState.cache,
      );
    }
  }

  Future<void> cacheAgendaConfig(AgendaConfigModel model) async {
    try {

      await appDatabase.delete(appDatabase.agendaTypes).go();
      await appDatabase.delete(appDatabase.agendaTypesDetails).go();
      await appDatabase.delete(appDatabase.agendaTypesPrestations).go();

      await appDatabase.agendaTypesPrestationsDao.insertAllAgendaTypesPrestation(model.agendaTypesPrestations);
      await appDatabase.agendaTypesDao.insertAllAgendaType(model.agendaTypes);
      for (AgendaTypeModel type in model.agendaTypes) {
        if (type.agendaTypeDetails.isNotEmpty) {
          await appDatabase.agendaTypesDetailsDao.insertAllAgendaTypesDetail(type.agendaTypeDetails);
        }
      }
    } catch (e) {
      throw CacheException(
        state: RequestState.error,
        message: '$e',
      );
    }
  }

  Future<void> cacheAgendaDatesResponse(String body) async {
    await prefs.setString(Keys.CACHE_AGENDA_DATES, body);
  }

  Future<void> cacheAgendaDates(AgendaDatesModel model) async {
    try {
      state.events.clear();
      await appDatabase.delete(appDatabase.agendaDates).go();
      await appDatabase.agendaDatesDao.insertAllAgendaDate(model.agendas);
      state.events.addAll(model.agendas);
      update();
    } catch (e) {
      throw CacheException(
        state: RequestState.error,
        message: '$e',
      );
    }
  }

  Future<AgendaConfigModel> getConcreteAgendaConfig(InputAgendaConfig input) async {
    try {
      final response = await http.post(
        Uri.parse(utilsLogic.getUrl(UrlService.AGEND_CONFIG)),
        body: {'inoface_ws': input.toString()},
      );

      if (kDebugMode) {
        log("getConcreteAgendaConfig: ${input.toString()}\n${response.body}");
      }

      if (response.statusCode == 200) {
        await cacheAgendaConfigResponse(response.body);
      }
      return agendaConfigModelFromJson(response.body);
    } catch (e) {
      throw ServerException(
        state: RequestState.error,
        message: '$e',
      );
    }
  }

  Future<AgendaDatesModel> getConcreteAgendaDates(InputAgendaConfig input) async {
    try {
      final response = await http.post(
        Uri.parse(utilsLogic.getUrl(UrlService.agendaDatesV2Ws)),
        body: {'inoface_ws': input.toString()},
      );
      if (kDebugMode) {
        log("getConcreteAgendaDates: body: ${input.toString()}\n result: ${response.body}");
      }
      if (response.statusCode == 200) {
        await cacheAgendaDatesResponse(response.body);
      }
      return agendaDatesModelFromJson(response.body);
    } catch (e) {
      throw ServerException(
        state: RequestState.error,
        message: '$e',
      );
    }
  }

  Future<void> cacheAgendaResponse(String body) async {
    await prefs.setString(Keys.CACHE_AGENDA, body);
  }

  Future<AgendaModel> getLastAgendaResponse() {
    final jsonString = prefs.getString(Keys.CACHE_AGENDA);
    if (jsonString != null) {
      logger.i(jsonString);
      return Future.value(agendaModelFromJson(jsonString));
    } else {
      throw CacheException(
        message: 'no_data_failure'.tr,
        state: RequestState.cache,
      );
    }
  }

  Future<void> cacheAgenda(AgendaModel model) async {
    try {
      await appDatabase.delete(appDatabase.agendas).go();
      await appDatabase.delete(appDatabase.personneEnseignants).go();
      await appDatabase.delete(appDatabase.agendaNotes).go();
      await appDatabase.delete(appDatabase.personneNotes).go();
      await appDatabase.delete(appDatabase.agendaDetails).go();
      await appDatabase.agendasDao.insertAllAgenda(model.agendas);
      for (AgendaMod mod in model.agendas) {
        if (mod.personneEnseignant != null) {
          await appDatabase.personneEnseignantsDao.insertPersonneEnseignant(mod.personneEnseignant!);
        }
        await appDatabase.agendaPhotoDetailsDao.insertAllAgendaPhotoDetail(mod.agendaPhotoDetails);
        await appDatabase.agendaNotesDao.insertAllAgendaNote(mod.agendaNotes);
        for (AgendaNoteMod val in mod.agendaNotes) {
          if (val.personneNote != null) {
            await appDatabase.personneNotesDao.insertPersonneNote(val.personneNote!);
          }
        }
        await appDatabase.agendaDetailsDao.insertAllAgendaDetail(mod.agendaDetails);
      }
    } catch (e) {
      throw CacheException(
        state: RequestState.error,
        message: '$e',
      );
    }
  }

  Future<AgendaModel> getConcreteAgenda(InputAgenda input) async {
    try {
      final response = await http.post(
        Uri.parse(utilsLogic.getUrl(UrlService.AGEND)),
        body: {'inoface_ws': input.toString()},
      );
      if (response.statusCode == 200) {
        await cacheAgendaResponse(response.body);
      }
      return agendaModelFromJson(response.body);
    } catch (e) {
      throw ServerException(
        state: RequestState.error,
        message: '$e',
      );
    }
  }
}