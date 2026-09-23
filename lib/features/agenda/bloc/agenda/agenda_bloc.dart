import 'package:inoface/features/agenda/models/input_agenda.dart';
import 'package:inoface/core/usecases/constants.dart';
import 'package:inoface/core/error/failures.dart';
import 'package:injectable/injectable.dart';
import 'package:equatable/equatable.dart';
import '../../models/agenda_model.dart';
import 'package:dartz/dartz.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:get/get.dart';

part 'agenda_event.dart';
part 'agenda_state.dart';

@injectable
class AgendaBloc extends Bloc<AgendaEvent, AgendaState> {
  AgendaBloc() : super(const LoadingAgendaState()) {
    on<AgendaEvent>((event, emit) async {
      if (event is AgendWs) {
        try {
          emit(const LoadingAgendaState());
          InputAgenda? input = agendaLogic.getInputAgenda(idPersonne: event.idPersonne, date: event.date);
          if (input != null) {
            Either<Failure, AgendaModel> either = await agendaLogic.getAgenda(input);
            either.fold((failure) async {
              String? msg;
              if (failure.props.isNotEmpty) {
                msg = failure.props.elementAt(0).toString();
              } else {
                msg = 'error_wrong'.tr;
              }
              emit(ErrorAgendaState(message: msg));
            }, (values) async {
              logger.d('values: $values');
              emit(LoadedAgendaState(model: values));
            });
          } else {
            emit(ErrorAgendaState(message: 'no_data_failure'.tr));
          }
        } catch (e) {
          emit(ErrorAgendaState(message: e.toString()));
        }
      }
    });
  }
}
