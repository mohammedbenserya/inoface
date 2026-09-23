import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import '../../../core/error/failures.dart';
import '../../../core/database/app_database.dart';
import '../../../core/usecases/enums.dart';
import '../../../main.dart';
import '../models/input_jours_feries.dart';
import '../models/jours_feries_model.dart';
import '../../../core/usecases/constants.dart';
import '../../../core/util/url_service.dart';
import '../../login/models/input_login.dart';
import '../../../core/error/exceptions.dart';
import '../../../core/util/keys.dart';
import 'package:get/get.dart';
import 'dart:developer';



class JoursFeriesLogic extends GetxController {
  static JoursFeriesLogic instance = Get.find();


  late Map<DateTime, List<JoursFerie>> events;
  late DateTime dateTimeLocal;

  @override
  void onInit() {
    events = {};
    dateTimeLocal = DateTime.now();
    super.onInit();
  }

  updateDateTime(DateTime val) {
    dateTimeLocal = val;
    log('dateTime: $dateTimeLocal');
    update();
  }

  Future<InputJoursFeries?> getInputJoursFeries() async {
    InputLogin? inputLogin = authLogic.getCashLogin();
    if (inputLogin != null) {
      List<JoursFerie> jours = await appDatabase.joursFeriesDao.getAllJoursFerie();
      return InputJoursFeries(
        identifiant: inputLogin.identifiant,
        motdepasse: inputLogin.motdepasse,
        tokenmobile: inputLogin.tokenmobile,
        jours: jours,
      );
    }
    return null;
  }

  Future<Map<DateTime, List<JoursFerie>>> joursFeriesEvents() async {
    final Map<DateTime, List<JoursFerie>> _events = {};
    try {

      List<JoursFerie> listJours = await appDatabase.joursFeriesDao.getAllJoursFerie();
      if (listJours.isNotEmpty) {
        for (JoursFerie jour in listJours) {
          if (jour.date_debut_jour_ferie != null && jour.date_fin_jour_ferie != null) {
            List<DateTime> list = _getListDate(
              start: jour.date_debut_jour_ferie!,
              end: jour.date_fin_jour_ferie!,
            );

            for (DateTime d in list) {
              if (_events.containsKey(d)) {
                List<JoursFerie> _myList = [];
                _myList.addAll(_events[d]!);
                _myList.add(jour);
                _events[d] = _myList;
              } else {
                _events[d] = [jour];
              }
            }
          }
        }
        return _events;
      }
      return _events;
    } catch (e) {
      logger.e(e);
      return _events;
    }
  }

  List<DateTime> _getListDate({
    required DateTime start,
    required DateTime end
  }) {
    var lastDat = _lastDayOfWeek(end);
    var newLastDate = DateTime(lastDat.year, lastDat.month, lastDat.day);
    return _daysInRange(start, newLastDate).toList();
  }

  static DateTime _lastDayOfWeek(DateTime day) {
    day = DateTime.utc(day.year, day.month, day.day);
    return day.add(const Duration(days: 1));
  }

  /// Returns a [DateTime] for each day the given range.
  static Iterable<DateTime> _daysInRange(DateTime start, DateTime end) sync* {
    var i = start;
    var offset = start.timeZoneOffset;
    while (i.isBefore(end)) {
      yield i;
      i = i.add(const Duration(days: 1));
      var timeZoneDiff = i.timeZoneOffset - offset;
      if (timeZoneDiff.inSeconds != 0) {
        offset = i.timeZoneOffset;
        i = i.subtract(Duration(seconds: timeZoneDiff.inSeconds));
      }
    }
  }


  Future<void> cacheJoursFeriesResponse(String body) async {
    await prefs.setString(Keys.CACHED_JOURS_FERIES, body);
  }

  Future<JoursFeriesModel> getLastResponse() {
    final jsonString = prefs.getString(Keys.CACHED_LOGIN_RESPONSE);
    if (jsonString != null) {
      logger.i(jsonString);
      return Future.value(joursFeriesModelFromJson(jsonString));
    } else {
      throw CacheException(
        state: RequestState.cache,
        message: 'no_data_failure'.tr,
      );
    }
  }

  Future<void> cacheJoursFeries(JoursFeriesModel model) async {
    try {
      events.clear();
      await appDatabase.delete(appDatabase.joursFeries).go();
      await appDatabase.joursFeriesDao.insertAllJoursFerie(model.joursFeries);
      final models = await joursFeriesEvents();
      events.addAll(models);
    } catch(e) {
      throw CacheException(
        state: RequestState.error,
        message: '$e',
      );
    }
  }

  Future<JoursFeriesModel> getConcreteJoursFeries(InputJoursFeries input) async {
    try {

      final response = await http.post(Uri.parse(utilsLogic.getUrl(UrlService.joursFeries)), body: {
        'inoface_ws': input.toString(),
      });

      log("getConcreteJoursFeries:\n${response.body}");

      if (response.statusCode == 200) await cacheJoursFeriesResponse(response.body);
      return joursFeriesModelFromJson(response.body);
    } catch (e) {
      throw ServerException(
        state: RequestState.error,
        message: '$e',
      );
    }
  }

  Future<Either<Failure, JoursFeriesModel>> getJoursFeries(InputJoursFeries input) async {
    if (networkState.isConnected) {
      try {
        JoursFeriesModel model = await getConcreteJoursFeries(input);
        if (!model.erreur) {
          await cacheJoursFeries(model);
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
        JoursFeriesModel model = await getLastResponse();
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