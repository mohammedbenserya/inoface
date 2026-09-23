part of 'agenda_bloc.dart';

@immutable
abstract class AgendaState extends Equatable {
  const AgendaState();
}

// class InitialAgendaState extends AgendaState {
//   const InitialAgendaState();
//   @override
//   List<Object> get props => [];
// }

class LoadingAgendaState extends AgendaState {
  const LoadingAgendaState();
  @override
  List<Object> get props => [];
}

class LoadedAgendaState extends AgendaState {
  final AgendaModel model;
  const LoadedAgendaState({required this.model});
  @override
  List<Object> get props => [model];
}

class ErrorAgendaState extends AgendaState {
  final String? message;
  const ErrorAgendaState({this.message});
  @override
  List<Object?> get props => [message];
}
