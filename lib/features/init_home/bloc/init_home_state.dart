part of 'init_home_bloc.dart';


class InitHomeState extends Equatable {
  final RequestState requestState;
  final String message;
  final dynamic result;
  const InitHomeState({
    this.requestState = RequestState.loading,
    this.message = 'error_wrong',
    this.result,
  });

  InitHomeState copyWith({
    RequestState? requestState,
    String? message,
    dynamic result,
  }) {
    return InitHomeState(
      requestState: requestState ?? this.requestState,
      message: message ?? this.message,
      result: result ?? this.result,
    );
  }

  @override
  List<Object?> get props => [
    requestState,
    message,
    result,
  ];
}

/*
@immutable
abstract class InitHomeState extends Equatable {
  const InitHomeState();
}


class LoadingInitHomeState extends InitHomeState {
  const LoadingInitHomeState();
  @override
  List<Object> get props => [];
}

class LoadedInitHomeState extends InitHomeState {
  final EnfantsModel model;
  const LoadedInitHomeState({required this.model});
  @override
  List<Object> get props => [model];
}

class ErrorInitHomeState extends InitHomeState {
  final String? message;
  const ErrorInitHomeState({this.message});
  @override
  List<Object?> get props => [message];
}

*/
