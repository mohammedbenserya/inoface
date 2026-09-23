part of 'init_home_bloc.dart';

@immutable
abstract class InitHomeEvent extends Equatable {
  const InitHomeEvent();
}

class Inoface extends InitHomeEvent {
  final InputLogin login;
  const Inoface({required this.login});

  @override
  List<Object> get props => [login];
}
