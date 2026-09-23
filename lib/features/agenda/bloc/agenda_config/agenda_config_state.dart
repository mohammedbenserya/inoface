part of 'agenda_config_bloc.dart';

@immutable
abstract class AgendaConfigState extends Equatable {
  const AgendaConfigState();
}

// class InitialAgendaConfigState extends AgendaConfigState {
//   const InitialAgendaConfigState();
//   @override
//   List<Object> get props => [];
// }

class LoadingAgendaConfigState extends AgendaConfigState {
  const LoadingAgendaConfigState();
  @override
  List<Object> get props => [];
}

class LoadedAgendaConfigState extends AgendaConfigState {
  final AgendaConfigModel model;
  const LoadedAgendaConfigState({required this.model});
  @override
  List<Object> get props => [model];
}

class ErrorAgendaConfigState extends AgendaConfigState {
  final String message;
  const ErrorAgendaConfigState({required this.message});
  @override
  List<Object> get props => [message];
}
