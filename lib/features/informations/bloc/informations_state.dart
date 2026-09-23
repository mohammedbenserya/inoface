part of 'informations_bloc.dart';

@immutable
abstract class InformationsState extends Equatable {
  const InformationsState();
}

class InitialInformationsState extends InformationsState {
  const InitialInformationsState();

  @override
  List<Object> get props => [];
}

class LoadingInformationsState extends InformationsState {
  const LoadingInformationsState();
  @override
  List<Object> get props => [];
}

class LoadedInformationsState extends InformationsState {
  final InformationsModel model;
  const LoadedInformationsState({required this.model});
  @override
  List<Object> get props => [model];
}

class ErrorInformationsState extends InformationsState {
  final String message;
  const ErrorInformationsState({required this.message});
  @override
  List<Object> get props => [message];
}