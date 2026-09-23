import '../../domain/models/get_reservations_cantine_model.dart';
import '../../../../core/usecases/constants.dart';
import '../../../../core/error/failures.dart';
import 'package:injectable/injectable.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'package:bloc/bloc.dart';
import 'package:get/get.dart';

part 'reservations_state.dart';

@injectable
class ReservationsCubit extends Cubit<ReservationsState> {
  ReservationsCubit() : super(const ReservationsLoading());


  Future<void> getReservation({required int idPersonne, required DateTime date}) async {
    try {
      final input = reservationLogic.getInputReservation(idPersonne, date);
      if (input != null) {
        emit(const ReservationsLoading());
        Either<Failure, GetReservationsCantineModel> either = await reservationLogic.getReservations(input);
        either.fold((failure) {
          String? msg;
          if (failure.props.isNotEmpty) {
            msg = failure.props.elementAt(0).toString();
          } else {
            msg = 'error_wrong'.tr;
          }
          logger.e('messageFailure: $msg');
          emit(ReservationsError(message: msg));
        }, (values) async {
          emit(ReservationsLoaded(model: values));
        });
      } else {
        emit(ReservationsError(message: 'no_data_failure'.tr));
      }

    } catch(e) {
      emit(ReservationsError(message: e.toString()));
    }
  }
}
