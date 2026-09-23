import 'package:inoface/core/usecases/constants.dart';
import 'package:inoface/core/error/failures.dart';
import 'package:injectable/injectable.dart';
import 'package:equatable/equatable.dart';
import '../models/devoir_model.dart';
import '../models/input_devoir.dart';
import 'package:dartz/dartz.dart';
import 'package:bloc/bloc.dart';
import 'package:get/get.dart';

part 'devoir_event.dart';
part 'devoir_state.dart';

@injectable
class DevoirBloc extends Bloc<DevoirEvent, DevoirState> {

  DevoirBloc() : super(const LoadingDevoirState()) {
    on<DevoirEvent>((event, emit) async {
      if (event is DevoirWs) {
        try {
          final input = event.input;
          if (input != null) {
            emit(const LoadingDevoirState());
            Either<Failure, DevoirModel> either = await devoirLogic.getDevoir(input);
            either.fold((failure) async {
              String? msg;
              if (failure.props.isNotEmpty) {
                msg = failure.props.elementAt(0).toString();
              } else {
                msg = 'error_wrong'.tr;
              }
              return emit(ErrorDevoirState(message: msg));
            }, (values) async {
              return emit(LoadedDevoirState(model: values));
            });
          } else {
            return emit(ErrorDevoirState(message: 'no_data_failure'.tr));
          }
        } catch(e) {
          return emit(ErrorDevoirState(message: e.toString()));
        }
      }
    });
  }
}
