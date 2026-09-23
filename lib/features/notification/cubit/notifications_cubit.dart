import '../models/parent_notifications_model.dart';
import '../../../core/usecases/constants.dart';
import '../../login/models/input_login.dart';
import 'package:injectable/injectable.dart';
import '../../../core/error/failures.dart';
import '../logic/notification_logic.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'package:bloc/bloc.dart';
import 'package:get/get.dart';

part 'notifications_state.dart';

@injectable
class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit() : super(const NotificationsLoading());

  final notificationsLogic = Get.put(NotificationLogic());

  Future<void> getNotifications({InputLogin? input}) async {
    try {
      emit(const NotificationsLoading());
      Either<Failure, ParentNotificationsModel> either = await notificationsLogic.getNotifications(input);
      either.fold((failure) {
        String? msg;
        if (failure.props.isNotEmpty) {
          msg = failure.props.elementAt(0).toString();
        } else {
          msg = 'error_wrong'.tr;
        }
        logger.e('messageFailure: $msg');
        emit(NotificationsError(message: msg));
      }, (values) async {
        logger.d('values: $values');
        emit(NotificationsLoaded(model: values));
      });
    } catch(e) {
      emit(NotificationsError(message: e.toString()));
    }
  }

}
