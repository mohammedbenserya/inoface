import '../../domain/models/reservations_cantine_dates_model.dart';
import '../../../../core/usecases/constants.dart';
import '../../../../core/error/failures.dart';
import 'package:injectable/injectable.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'package:bloc/bloc.dart';
import 'package:get/get.dart';

part 'reservation_date_state.dart';

@injectable
class ReservationDateCubit extends Cubit<ReservationDateState> {
  ReservationDateCubit() : super(const ReservationDateLoading());

  Future<void> getReservationDate({required int idPersonne}) async {
    try {
      final input = reservationLogic.getInputReservationDate(idPersonne: idPersonne);
      if (input != null) {
        emit(const ReservationDateLoading());
        Either<Failure, ReservationsCantineDatesModel> either = await reservationLogic.getReservationsDate(input);
        either.fold((failure) {
          String? msg;
          if (failure.props.isNotEmpty) {
            msg = failure.props.elementAt(0).toString();
          } else {
            msg = 'error_wrong'.tr;
          }
          logger.e('messageFailure: $msg');
          emit(ReservationDateError(message: msg));
        }, (values) async {
          logger.d('values: $values');
          emit(ReservationDateLoaded(model: values));
        });

      } else {
        emit(ReservationDateError(message: 'no_data_failure'.tr));
      }
    } catch(e) {
      emit(ReservationDateError(message: e.toString()));
    }
  }
}
