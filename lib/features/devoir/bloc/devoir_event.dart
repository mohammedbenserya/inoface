part of 'devoir_bloc.dart';

abstract class DevoirEvent extends Equatable {
  const DevoirEvent();
}

class DevoirWs extends DevoirEvent {

  final InputDevoir? input;
  const DevoirWs({this.input});

  @override
  List<Object?> get props => [input];
}