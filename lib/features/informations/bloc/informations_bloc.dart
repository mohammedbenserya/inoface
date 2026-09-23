import 'package:inoface/features/informations/models/informations_model.dart';
import 'package:inoface/core/usecases/constants.dart';
import 'package:inoface/core/error/failures.dart';
import 'package:injectable/injectable.dart';
import 'package:equatable/equatable.dart';
import '../models/input_informations.dart';
import 'package:dartz/dartz.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:get/get.dart';

part 'informations_event.dart';
part 'informations_state.dart';

@injectable
class InformationsBloc extends Bloc<InformationsEvent, InformationsState> {

  // final informationsLogic = Get.put(InformationsLogic());

  InformationsBloc() : super(const InitialInformationsState()) {
    on<InformationsEvent>((event, emit) async {
      if (event is InformationsWs) {
        try {
          final input = event.informations;
          if (input != null) {
            emit(const LoadingInformationsState());
            Either<Failure, InformationsModel> either = await informationsLogic.getInformations(input);
            either.fold((failure) async {
              String? msg;
              if (failure.props.isNotEmpty) {
                msg = failure.props.elementAt(0).toString();
              } else {
                msg = 'error_wrong'.tr;
              }
              emit(ErrorInformationsState(message: msg));
            }, (values) async {
              logger.d('values: $values');
              emit(LoadedInformationsState(model: values));
            });
          } else {
            emit(ErrorInformationsState(message: 'no_data_failure'.tr));
          }

        } catch(e) {
          emit(ErrorInformationsState(message: e.toString()));
        }
      }
    });
  }
}
