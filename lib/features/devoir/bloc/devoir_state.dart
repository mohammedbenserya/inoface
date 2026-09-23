part of 'devoir_bloc.dart';

abstract class DevoirState extends Equatable {
  const DevoirState();
}

// class InitialDevoirState extends DevoirState {
//   const InitialDevoirState();
//
//   @override
//   List<Object> get props => [];
// }

class LoadingDevoirState extends DevoirState {
  const LoadingDevoirState();

  @override
  List<Object> get props => [];
}

class LoadedDevoirState extends DevoirState {
  final DevoirModel model;
  const LoadedDevoirState({required this.model});

  @override
  List<Object> get props => [model];
}

class ErrorDevoirState extends DevoirState {
  final String message;
  const ErrorDevoirState({required this.message});

  @override
  List<Object> get props => [message];
}