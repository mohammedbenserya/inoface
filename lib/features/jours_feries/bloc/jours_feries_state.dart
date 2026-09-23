part of 'jours_feries_bloc.dart';

@immutable
abstract class JoursFeriesState extends Equatable {
  const JoursFeriesState();
}

class InitialJoursFeriesState extends JoursFeriesState {
  const InitialJoursFeriesState();

  @override
  List<Object> get props => [];
}

class LoadingJoursFeriesState extends JoursFeriesState {
  const LoadingJoursFeriesState();

  @override
  List<Object> get props => [];
}

class LoadedJoursFeriesState extends JoursFeriesState {
  final JoursFeriesModel model;
  const LoadedJoursFeriesState({required this.model});

  @override
  List<Object> get props => [model];
}

class ErrorJoursFeriesState extends JoursFeriesState {
  final String message;
  const ErrorJoursFeriesState({required this.message});

  @override
  List<Object> get props => [message];
}