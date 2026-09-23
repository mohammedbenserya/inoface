import 'package:inoface/features/jours_feries/models/jours_feries_model.dart';
import 'package:inoface/core/usecases/constants.dart';
import '../../../core/error/failures.dart';
import '../models/input_jours_feries.dart';
import 'package:injectable/injectable.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:get/get.dart';

part 'jours_feries_event.dart';
part 'jours_feries_state.dart';

@injectable
class JoursFeriesBloc extends Bloc<JoursFeriesEvent, JoursFeriesState> {

  JoursFeriesBloc() : super(const InitialJoursFeriesState()) {
    on<JoursFeriesEvent>((event, emit) async {
      if (event is JoursFeriesWs) {
        try {
          final input = event.inputJoursFeries;
          if (input != null) {
            emit(const LoadingJoursFeriesState());
            Either<Failure, JoursFeriesModel> either = await joursFeriesLogic.getJoursFeries(input);
            either.fold((failure) async {
              String? msg;
              if (failure.props.isNotEmpty) {
                msg = failure.props.elementAt(0).toString();
              } else {
                msg = 'error_wrong'.tr;
              }
              emit(ErrorJoursFeriesState(message: msg));
            }, (values) async {
              emit(LoadedJoursFeriesState(model: values));
            });
          } else {
            emit(ErrorJoursFeriesState(message: 'no_data_failure'.tr));
          }
        } catch(e) {
          emit(ErrorJoursFeriesState(message: e.toString()));
        }
      }
    });
  }
}
