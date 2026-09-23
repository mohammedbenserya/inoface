part of 'reservations_cubit.dart';


abstract class ReservationsState extends Equatable {
  const ReservationsState();
}

// class ReservationsInitial extends ReservationsState {
//   const ReservationsInitial();
//   @override
//   List<Object> get props => [];
// }

class ReservationsLoading extends ReservationsState {
  const ReservationsLoading();
  @override
  List<Object> get props => [];
}

class ReservationsLoaded extends ReservationsState {
  final GetReservationsCantineModel model;
  const ReservationsLoaded({required this.model});
  @override
  List<Object> get props => [model];
}

class ReservationsError extends ReservationsState {
  final String? message;
  const ReservationsError({this.message});
  @override
  List<Object?> get props => [message];
}
