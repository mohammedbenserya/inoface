part of 'notifications_cubit.dart';

abstract class NotificationsState extends Equatable {
  const NotificationsState();
}

// class NotificationsInitial extends NotificationsState {
//   const NotificationsInitial();
//   @override
//   List<Object> get props => [];
// }


class NotificationsLoading extends NotificationsState {
  const NotificationsLoading();

  @override
  List<Object> get props => [];
}

class NotificationsLoaded extends NotificationsState {
  final ParentNotificationsModel model;
  const NotificationsLoaded({required this.model});

  @override
  List<Object> get props => [model];
}

class NotificationsError extends NotificationsState {
  final String? message;
  const NotificationsError({this.message});

  @override
  List<Object?> get props => [message];
}