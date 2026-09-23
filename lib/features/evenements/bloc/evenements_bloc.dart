import 'package:inoface/features/evenements/models/input_evenements.dart';
import 'package:inoface/features/evenements/models/evenements_model.dart';
import 'package:inoface/core/usecases/constants.dart';
import '../../../core/error/failures.dart';
import 'package:injectable/injectable.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:get/get.dart';


part 'evenements_event.dart';
part 'evenements_state.dart';

@injectable
class EvenementsBloc extends Bloc<EvenementsEvent, EvenementsState> {

  // final evenementLogic = Get.put(EvenementLogic());

  EvenementsBloc() : super(const InitialEvenementsState()) {
    on<EvenementsEvent>((event, emit) async {
      if (event is EvenementsWs) {
        try {
          final input = event.inputEvenements;
          if (input != null) {
            emit(const LoadingEvenementsState());
            Either<Failure, EvenementsModel> either = await evenementLogic.getEvenements(input);
            either.fold((failure) async {
              String? msg;
              if (failure.props.isNotEmpty) {
                msg = failure.props.elementAt(0).toString();
              } else {
                msg = 'error_wrong'.tr;
              }
              emit(ErrorEvenementsState(message: msg));
            }, (values) async {
              emit(LoadedEvenementsState(model: values));
            });
          } else {
            emit(ErrorEvenementsState(message: 'no_data_failure'.tr));
          }
        } catch(e) {
          emit(ErrorEvenementsState(message: e.toString()));
        }
      }
    });
  }
}
