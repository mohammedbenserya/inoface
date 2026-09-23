import 'package:inoface/features/attestations/models/add_demandeattestation_model.dart';
import 'package:inoface/features/attestations/models/demande_attestations_model.dart';
import 'package:inoface/core/usecases/constants.dart';
import 'package:inoface/core/error/failures.dart';
import 'package:injectable/injectable.dart';
import '../logic/attestations_logic.dart';
import '../models/input_attestation.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'package:bloc/bloc.dart';
import 'package:get/get.dart';

part 'attestations_event.dart';
part 'attestations_state.dart';

@injectable
class AttestationsBloc extends Bloc<AttestationsEvent, AttestationsState> {

  final attestationsLogic = Get.put(AttestationsLogic());
  AttestationsBloc() : super(const LoadingAttestationsState()) {
    on<AttestationsEvent>((event, emit) async {
      if (event is CurrentDemandeAttestations) {
        try {
          final input = attestationsLogic.getInputAttestation(event.idPersonne);
          if (input != null) {
            emit(const LoadingAttestationsState());
            Either<Failure, DemandeAttestationsModel> either = await attestationsLogic.getAttestations(input);
            either.fold((failure) async {
              String? msg;
              if (failure.props.isNotEmpty) {
                msg = failure.props.elementAt(0).toString();
              } else {
                msg = 'error_wrong'.tr;
              }
              emit(ErrorAttestationsState(message: msg));
            }, (values) async {
              logger.d('values: $values');
              emit(LoadedAttestationsState(model: values, addModel: null));
            });
          } else {
            emit(ErrorAttestationsState(message: 'no_data_failure'.tr));
          }
        } catch (e) {
          emit(ErrorAttestationsState(message: e.toString()));
        }
      } else if (event is AddDemandeAttestations) {
        try {
          emit(const LoadingAttestationsState());
          Either<Failure, AddDemandeattestationModel> either = await attestationsLogic.demandeAttestations(event.input);
          either.fold((failure) async {
            String? msg;
            if (failure.props.isNotEmpty) {
              msg = failure.props.elementAt(0).toString();
            } else {
              msg = 'error_wrong'.tr;
            }
            emit(ErrorAttestationsState(message: msg));
          }, (values) async {
            logger.d('values: $values');
            emit(LoadedAttestationsState(addModel: values, model: null));
          });
        } catch (e) {
          emit(ErrorAttestationsState(message: e.toString()));
        }
      }
    });
  }
}
