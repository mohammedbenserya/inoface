import '../../../core/models/demandes_recuperation_model.dart';
import 'package:inoface/core/usecases/constants.dart';
import 'package:inoface/core/error/failures.dart';
import '../../login/models/input_login.dart';
import 'package:injectable/injectable.dart';
import 'package:equatable/equatable.dart';
import '../logic/recuperation_logic.dart';
import 'package:dartz/dartz.dart';
import 'package:bloc/bloc.dart';
import 'package:get/get.dart';

part 'demande_recuperation_event.dart';
part 'demande_recuperation_state.dart';

@injectable
class DemandeRecuperationBloc extends Bloc<DemandeRecuperationEvent, DemandeRecuperationState> {

  final recuperationLogic = Get.put(RecuperationLogic());
  DemandeRecuperationBloc() : super(const DemandeRecuperationInitial()) {
    on<DemandeRecuperationEvent>((event, emit) async {
      if (event is InitDemandeRecuperationEvent) {
        try {
          Either<Failure, DemandesRecuperationModel> either = await recuperationLogic.getRecuperation(event.input);
          either.fold((failure) async {
            String? msg;
            if (failure.props.isNotEmpty) {
              msg = failure.props.elementAt(0).toString();
            } else {
              msg = 'error_wrong'.tr;
            }
            emit(DemandeRecuperationError(message: msg));
          }, (values) async {
            logger.d('values: $values');
            emit(DemandeRecuperationLoaded(model: values));
          });
        } catch(e) {
          emit(DemandeRecuperationError(message: e.toString()));
        }
      }
    });
  }
}
