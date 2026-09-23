import 'package:inoface/core/usecases/constants.dart';
import 'package:injectable/injectable.dart';
import '../../../core/error/failures.dart';
import '../models/devoirs_dates_model.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'package:bloc/bloc.dart';
import 'package:get/get.dart';

part 'date_devoir_state.dart';

@injectable
class DateDevoirCubit extends Cubit<DateDevoirState> {
  DateDevoirCubit() : super(const DateDevoirLoading());

  Future<void> getAllDevoirsDates({required int idPersonne}) async {
    try {
      emit(const DateDevoirLoading());
      Either<Failure, DevoirsDatesModel> either = await devoirLogic.getAllDevoirsDates(idPersonne);
      either.fold((failure) {
        String? msg;
        if (failure.props.isNotEmpty) {
          msg = failure.props.elementAt(0).toString();
        } else {
          msg = 'error_wrong'.tr;
        }
        logger.e('messageFailure: $msg');
        emit(DateDevoirError(message: msg));
      }, (values) async {
        emit(DateDevoirLoaded(model: values));
      });
    } catch(e) {
      emit(DateDevoirError(message: e.toString()));
    }
  }


}
