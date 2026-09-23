part of 'evenements_bloc.dart';

@immutable
abstract class EvenementsState extends Equatable {
  const EvenementsState();
}

class InitialEvenementsState extends EvenementsState {
  const InitialEvenementsState();

  @override
  List<Object> get props => [];
}

class LoadingEvenementsState extends EvenementsState {
  const LoadingEvenementsState();
  @override
  List<Object> get props => [];
}

class LoadedEvenementsState extends EvenementsState {
  final EvenementsModel model;
  const LoadedEvenementsState({required this.model});

  @override
  List<Object> get props => [model];
}

class ErrorEvenementsState extends EvenementsState {
  final String message;
  const ErrorEvenementsState({required this.message});

  @override
  List<Object> get props => [message];
}