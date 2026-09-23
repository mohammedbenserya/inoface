import '../domain/models/response_remove_reservations_model.dart';
import '../domain/models/reservations_cantine_dates_model.dart';
import '../domain/models/response_pdf_reservations_model.dart';
import '../domain/models/get_reservations_cantine_model.dart';
import '../domain/models/get_plancantine_by_date_model.dart';
import '../usecases/input_reservations_cantine_dates.dart';
import '../../../widget_helper/loading_dialog.dart';
import '../usecases/input_remove_reservation.dart';
import '../../../core/database/app_database.dart';
import '../usecases/input_get_reservations.dart';
import '../usecases/input_pdf_reservation.dart';
import '../../../core/usecases/constants.dart';
import '../../../core/error/exceptions.dart';
import '../../login/models/input_login.dart';
import '../../../core/util/url_service.dart';
import '../../../core/error/failures.dart';
import '../../../core/usecases/enums.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../../../core/util/keys.dart';
import 'package:dartz/dartz.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import '../../../main.dart';
import 'dart:developer';




class ReservationLogic extends GetxController {
  static ReservationLogic instance = Get.find();


  late List<ReservationsCantineDate> events;
  late DateTime dateTimeLocal;

  @override
  void onInit() {
    dateTimeLocal = DateTime.now();
    events = [];
    super.onInit();
  }


  updateDateTime(DateTime val) {
    dateTimeLocal = val;
    update();
    log('dateTime: $dateTimeLocal');
  }

  Future<ResponsePdfReservationsModel?> getPdfReservations({
    required BuildContext context,
    required DateTime dateTimeLocal,
    required int idPersonne,
  }) async {
    if (networkState.isConnected) {
      InputLogin? inputLogin = authLogic.getCashLogin();
      if (inputLogin != null) {
        final input = InputPdfReservation(
          identifiant: inputLogin.identifiant,
          motdepasse: inputLogin.motdepasse,
          tokenmobile: inputLogin.tokenmobile,
          date_cantine: DateFormat('yyyy-MM-dd').format(dateTimeLocal),
        );

        final response = await http.post(
            Uri.parse(utilsLogic.getUrl(UrlService.PDF_RESERVATIONS)),
            body: {
              'inoface_ws': input.toString(),
            });
        log('getPdfReservations: ${response.body}');
        return responsePdfReservationsModelFromJson(response.body);
      }
    } else {
      utilsLogic.showSnack(type: SnackBarType.unconnected);
    }
    return null;
  }

  InputReservationsCantineDates? getInputReservationDate({required int idPersonne}) {
    InputLogin? inputLogin = authLogic.getCashLogin();
    if (inputLogin != null) {
      return InputReservationsCantineDates(
        identifiant: inputLogin.identifiant,
        motdepasse: inputLogin.motdepasse,
        tokenmobile: inputLogin.tokenmobile,
        id_personne: idPersonne,
      );
    } else {
      return null;
    }
  }

  InputGetReservations? getInputReservation(int idPersonne, DateTime dateTime) {
    InputLogin? inputLogin = authLogic.getCashLogin();
    if (inputLogin != null) {
      return InputGetReservations(
        identifiant: inputLogin.identifiant,
        motdepasse: inputLogin.motdepasse,
        tokenmobile: inputLogin.tokenmobile,
        id_personne: idPersonne,
        date_cantine: DateFormat('yyyy-MM-dd').format(dateTime),
      );
    } else {
      return null;
    }
  }

  Future<Map<DateTime, List>> reservationsDate() async {
    Map<DateTime, List> events = {};
    try {

      List<ReservationsCantineDate> listDate =
      await appDatabase.reservationsCantineDatesDao.getAllReservationsCantineDates();
      if (listDate.isNotEmpty) {
        for (ReservationsCantineDate jour in listDate) {
          if (jour.date_cantine != null) {
            events[jour.date_cantine!] = [jour];
          }
        }
        return events;
      }
      return events;
    } catch (e) {
      logger.e(e);
      return events;
    }
  }

  Future<bool> alertRservations(BuildContext context, DateTime date, int idPer) async {
    try {
      Enfant? enfant = await appDatabase.enfantsDao.getEnfantById(idPer);
      if (enfant != null && context.mounted) {
        return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: Text('alert_rservations'
                .trArgs([("${enfant.prenom} ${enfant.nom}"), DateFormat('dd MMMM', 'fr').format(date)])),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('cancel'.tr),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text('yes'.tr),
              ),
            ],
          ),
        )) ??
            false;
      } else {
        return false;
      }
    } catch (e) {
      logger.e('e');
      return false;
    }
  }

  Future<void> reservationsCantine({
    required BuildContext context,
    required DateTime dateTime,
    required int idPersonne,
  }) async {

    if (networkState.isConnected) {
      LoadingDialog.show(context: context);
      InputLogin? inputLogin = authLogic.getCashLogin();
      if (inputLogin != null) {
        final input = InputGetReservations(
          identifiant: inputLogin.identifiant,
          motdepasse: inputLogin.motdepasse,
          tokenmobile: inputLogin.tokenmobile,
          id_personne: idPersonne,
          date_cantine: DateFormat('yyyy-MM-dd').format(dateTime),
        );

        final response = await http.post(
          Uri.parse(utilsLogic.getUrl(UrlService.ADD_RESERVATIONS)),
            body: {'inoface_ws': input.toString()},
        );

        GetReservationsCantineModel model = getReservationsCantineModelFromJson(response.body);

        if (!model.erreur && model.reservationCantine != null) {

          await appDatabase.reservationsCantinesDao.insertReservationsCantines(model.reservationCantine!);
          events.add(ReservationsCantineDate(date_cantine: model.reservationCantine!.date_cantine));

          if (context.mounted) LoadingDialog.hide(context: context);
          utilsLogic.showSnack(type: SnackBarType.success, message: model.message);
        } else {
          // if (context.mounted) LoadingDialog.hide(context: context);
          // utilsLogic.showSnack(type: SnackBarType.error, message: model.message);
          if (context.mounted) {
            LoadingDialog.hide(context: context);
            await showDialog(context: context, builder: (context) {
            return AlertDialog(
              title: Text('unable_to_book'.tr,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              content: Text(model.message,
                textAlign: TextAlign.center,
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('ok'.tr),
                ),
              ],
            );
          });
          }
        }
      }
    } else {
      utilsLogic.showSnack(type: SnackBarType.unconnected);
    }
  }

  Future<bool> removeReservationsAlert(BuildContext context, DateTime date) async {
    return await showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text('confirmation'.tr,
          textAlign: TextAlign.center,
        ),
        content: Text('please_confirm_cancellation'.trArgs([DateFormat('dd MMMM', 'fr').format(date)]),
          textAlign: TextAlign.center,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('cancel'.tr),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text('yes'.tr),
          ),
        ],
      );
    }) ?? false;
  }
  Future<void> removeReservations({
    required BuildContext context,
    required DateTime dateTime,
    required int idJournaliere,
    // required MobxReservation mobx,
  }) async {
    if (networkState.isConnected) {
      LoadingDialog.show(context: context);
      // DateTime emptyMap = DateTime.now();
      InputLogin? inputLogin = authLogic.getCashLogin();
      if (inputLogin != null) {
        final input = InputRemoveReservation(
          identifiant: inputLogin.identifiant,
          motdepasse: inputLogin.motdepasse,
          tokenmobile: inputLogin.tokenmobile,
          id_cantine_journaliere: idJournaliere,
        );

        final response =
        await http.post(Uri.parse(utilsLogic.getUrl(UrlService.REMOVE_RESERVATIONS)), body: {
          'inoface_ws': input.toString(),
        });

        final model = responseRemoveReservationsModelFromJson(response.body);
        if (response.statusCode == 200) {

          await appDatabase.reservationsCantinesDao.deleteReservationsById(journaliere: idJournaliere);
          events.removeWhere((element) => element.date_cantine == dateTime);
          update();

          if (context.mounted) LoadingDialog.hide(context: context);
          utilsLogic.showSnack(type: SnackBarType.success, message: model.message);
        } else {
          if (context.mounted) LoadingDialog.hide(context: context);
          utilsLogic.showSnack(type: SnackBarType.error, message: model.message);
        }
      }
    } else {
      utilsLogic.showSnack(type: SnackBarType.unconnected);
    }
  }


  ///! --------------- Reservations ---------------
  Future<Either<Failure, GetReservationsCantineModel>> getReservations(InputGetReservations? input) async {
    if (input == null) return Left(NoDataFailure(message: 'no_data_failure'.tr, state: RequestState.cache));
    if (networkState.isConnected) {
      try {
        GetReservationsCantineModel model = await getConcreteReservations(input);
        if (model.erreur == false) {
          await cacheReservations(model);
        }

        GetPlancantinebyDateModel modelPlan = await getPlancantinebyDate(input);
        if (!modelPlan.erreur) {
          await cachePlanCantine(modelPlan);
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
        GetReservationsCantineModel model = await getLastReservationsResponse();
        return Right(model);
      } on CacheException catch (failure) {
        return Left(CacheFailure(
          message: failure.message,
          state: failure.state,
        ));
      }
    }
  }

  Future<GetPlancantinebyDateModel> getPlancantinebyDate(InputGetReservations input) async {
    try {
      logger.i("getPlancantinebyDate: inoface_ws: ${input.toString()}");
      final response =
      await http.post(Uri.parse(utilsLogic.getUrl(UrlService.GET_PLANCANTINE_BY_DATE)), body: {
        'inoface_ws': input.toString(),
      });

      logger.i("getPlancantinebyDate body: ${response.body}");

      if (response.statusCode == 200) {
        await prefs.setString(Keys.CACHED_PLANCANTINE_BY_DATE, response.body);
      }
      return getPlancantinebyDateModelFromJson(response.body);
    } catch (e) {
      throw ServerException(
        state: RequestState.error,
        message: '$e',
      );
    }
  }

  Future<GetReservationsCantineModel> getConcreteReservations(InputGetReservations input) async {
    try {
      logger.i("getReservations: inoface_ws: ${input.toString()}");
      final response = await http.post(Uri.parse(utilsLogic.getUrl(UrlService.GET_RESERVATIONS)), body: {
        'inoface_ws': input.toString(),
      });

      log('getReservations:\n${response.body}');

      if (response.statusCode == 200) {
        await prefs.setString(Keys.CACHED_GET_RESERVATIONS, response.body);
      }
      return getReservationsCantineModelFromJson(response.body);
    } catch (e) {
      throw ServerException(
        state: RequestState.error,
        message: '$e',
      );
    }
  }

  Future<void> cacheReservations(GetReservationsCantineModel model) async {
    try {

      await appDatabase.delete(appDatabase.reservationsCantines).go();
      if (model.reservationCantine != null) {
        await appDatabase.reservationsCantinesDao.insertReservationsCantines(model.reservationCantine!);
      }
    } catch (e) {
      throw CacheException(
        state: RequestState.error,
        message: '$e',
      );
    }
  }

  Future<void> cachePlanCantine(GetPlancantinebyDateModel model) async {
    try {

      await appDatabase.delete(appDatabase.plats).go();
      await appDatabase.delete(appDatabase.planCantines).go();

      if (model.planCantine != null) {
        await appDatabase.planCantinesDao.insertPlanCantines(model.planCantine!);
        await appDatabase.platsDao.insertAllPlats(model.planCantine!.plats);
      }
    } catch (e) {
      throw CacheException(
        state: RequestState.error,
        message: '$e',
      );
    }
  }

  Future<GetReservationsCantineModel> getLastReservationsResponse() {
    final jsonString = prefs.getString(Keys.CACHED_GET_RESERVATIONS);
    if (jsonString != null) {
      logger.i(jsonString);
      return Future.value(getReservationsCantineModelFromJson(jsonString));
    } else {
      throw CacheException(
        state: RequestState.cache,
        message: 'no_data_failure'.tr,
      );
    }
  }


  ///! --------------- Reservations Date ---------------
  Future<Either<Failure, ReservationsCantineDatesModel>> getReservationsDate(InputReservationsCantineDates? input) async {
    if (input == null) return Left(CacheFailure(message: 'cache_failure'.tr, state: RequestState.cache));
    if (networkState.isConnected) {
      try {
        ReservationsCantineDatesModel model = await getConcreteReservationsDate(input);
        if (model.erreur == false) {
          await cacheReservationsDate(model);
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
        ReservationsCantineDatesModel model = await getLastResponseReservationsDate();
        return Right(model);
      } on CacheException catch (failure) {
        return Left(CacheFailure(
          message: failure.message,
          state: failure.state,
        ));
      }
    }
  }

  Future<ReservationsCantineDatesModel> getConcreteReservationsDate(InputReservationsCantineDates input) async {
    try {
      logger.i("getConcreteReservations: inoface_ws: ${input.toString()}");
      final response =
      await http.post(Uri.parse(utilsLogic.getUrl(UrlService.RESERVATIONS_DATE)), body: {
        'inoface_ws': input.toString(),
      });

      logger.i("getConcreteReservations: ${response.body}");
      if (response.statusCode == 200) {
        await prefs.setString(Keys.CACHED_RESERVATIONS_DATE, response.body);
      }
      return reservationsCantineDatesModelFromJson(response.body);
    } catch (e) {
      throw ServerException(
        state: RequestState.error,
        message: '$e',
      );
    }
  }

  Future<ReservationsCantineDatesModel> getLastResponseReservationsDate() {
    final jsonString = prefs.getString(Keys.CACHED_RESERVATIONS_DATE);
    if (jsonString != null) {
      logger.i(jsonString);
      return Future.value(reservationsCantineDatesModelFromJson(jsonString));
    } else {
      throw CacheException(
        state: RequestState.error,
        message: 'no_data_failure'.tr,
      );
    }
  }

  Future<void> cacheReservationsDate(ReservationsCantineDatesModel model) async {
    try {

      await appDatabase.delete(appDatabase.reservationsCantineDates).go();
      await appDatabase.reservationsCantineDatesDao.insertAllReservationsCantineDates(model.reservationsDates);
      insertAllReservationsCantineDates(model.reservationsDates);
    } catch (e) {
      throw CacheException(
        state: RequestState.error,
        message: '$e',
      );
    }
  }

  void insertAllReservationsCantineDates(List<ReservationsDate> reservationsDates) {
    events.clear();
    events.addAll(reservationsDates);
    update();
  }
}