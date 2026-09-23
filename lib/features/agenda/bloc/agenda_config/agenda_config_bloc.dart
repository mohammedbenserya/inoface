import 'package:inoface/features/agenda/models/agenda_config_model.dart';
import 'package:inoface/core/usecases/constants.dart';
import 'package:inoface/core/error/failures.dart';
import '../../models/input_agenda_config.dart';
import 'package:injectable/injectable.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:get/get.dart';

part 'agenda_config_event.dart';
part 'agenda_config_state.dart';

@injectable
class AgendaConfigBloc extends Bloc<AgendaConfigEvent, AgendaConfigState> {

  AgendaConfigBloc() : super(const LoadingAgendaConfigState()) {
    on<AgendaConfigEvent>((event, emit) async {
      if (event is AgendConfigaWs) {
        try {
          // final input = event.inputAgendaConfig;
          InputAgendaConfig? input = agendaLogic.getInputAgendaConfig(event.idPersonne);
          if (input != null) {
            emit(const LoadingAgendaConfigState());
            Either<Failure, AgendaConfigModel> either = await agendaLogic.getConfig(input);
            either.fold((failure) async {
              String? msg;
              if (failure.props.isNotEmpty) {
                msg = failure.props.elementAt(0).toString();
              } else {
                msg = 'error_wrong'.tr;
              }
              emit(ErrorAgendaConfigState(message: msg));
            }, (values) async {
              logger.d('getConfig: $values');
              emit(LoadedAgendaConfigState(model: values));
            });
          } else {
            emit(ErrorAgendaConfigState(message: 'no_data_failure'.tr));
          }
        } catch (e) {
          emit(ErrorAgendaConfigState(message: e.toString()));
        }
      }
    });
  }
}
