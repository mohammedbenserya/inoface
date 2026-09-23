part of 'reservation_date_cubit.dart';

abstract class ReservationDateState extends Equatable {
  const ReservationDateState();
}


class ReservationDateLoading extends ReservationDateState {
  const ReservationDateLoading();
  @override
  List<Object> get props => [];
}

class ReservationDateLoaded extends ReservationDateState {
  final ReservationsCantineDatesModel model;
  const ReservationDateLoaded({required this.model});
  @override
  List<Object> get props => [model];
}

class ReservationDateError extends ReservationDateState {
  final String? message;
  const ReservationDateError({this.message});
  @override
  List<Object?> get props => [message];
}
