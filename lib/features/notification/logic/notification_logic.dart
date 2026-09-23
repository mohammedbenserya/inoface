import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:inoface/core/usecases/enums.dart';
import '../../../core/error/exceptions.dart';
import '../../../main.dart';
import '../models/parent_notifications_model.dart';
import '../../../core/error/failures.dart';
import '../../../core/usecases/constants.dart';
import '../../../core/util/keys.dart';
import '../../../core/util/url_service.dart';
import '../../login/models/input_login.dart';



class NotificationLogic extends GetxController {
  static NotificationLogic instance = Get.find();


  Future<Either<Failure, ParentNotificationsModel>> getNotifications(InputLogin? input) async {
    if (input == null) {
      return Left(CacheFailure(
        message: 'cache_failure'.tr,
        state: RequestState.cache,
      ));
    }

    if (networkState.isConnected) {
      try {
        ParentNotificationsModel model = await getConcreteNotifications(input);
        if (!model.erreur) {
          await cacheNotifications(model);
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
        ParentNotificationsModel model = await getLastResponse();
        return Right(model);
      } on CacheException catch (failure) {
        return Left(CacheFailure(
          message: failure.message,
          state: failure.state,
        ));
      }
    }
  }

  Future<ParentNotificationsModel> getConcreteNotifications(InputLogin input) async {
    try {
      final response = await http.post(
          Uri.parse(utilsLogic.getUrl(UrlService.PARENT_NOTIFICATIONS)), body: {
        'inoface_ws': input.toString(),
      });

      if (response.statusCode == 200) {
        await prefs.setString(Keys.CACHED_NOTIFICATIONS, response.body);
      }
      return parentNotificationsModelFromJson(response.body);
    } catch (e) {
      throw ServerException(
        state: RequestState.error,
        message: '$e',
      );
    }
  }

  Future<ParentNotificationsModel> getLastResponse() {
    final jsonString = prefs.getString(Keys.CACHED_NOTIFICATIONS);
    if (jsonString != null) {
      logger.i(jsonString);
      return Future.value(parentNotificationsModelFromJson(jsonString));
    } else {
      throw CacheException(
        state: RequestState.cache,
        message: 'no_data_failure'.tr,
      );
    }
  }

  Future<void> cacheNotifications(ParentNotificationsModel model) async {
    try {
      await appDatabase.delete(appDatabase.parentNotifications).go();
      await appDatabase.parentNotificationsDao.insertAllParentNotifications(model.notifications);
    } catch (e) {
      throw CacheException(
        state: RequestState.error,
        message: '$e',
      );
    }
  }

}