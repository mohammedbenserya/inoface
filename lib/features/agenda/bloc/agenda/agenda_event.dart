part of 'agenda_bloc.dart';

@immutable
abstract class AgendaEvent extends Equatable {
  const AgendaEvent();
}

class AgendWs extends AgendaEvent {
  final String date;
  final int idPersonne;
  const AgendWs({required this.idPersonne, required this.date});

  @override
  List<Object> get props => [idPersonne, date];
}
