part of 'agenda_config_bloc.dart';

@immutable
abstract class AgendaConfigEvent extends Equatable {
  const AgendaConfigEvent();
}

class AgendConfigaWs extends AgendaConfigEvent {
  final int idPersonne;
  const AgendConfigaWs({required this.idPersonne});

  @override
  List<Object?> get props => [idPersonne];
}
