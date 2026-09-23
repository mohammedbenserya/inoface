part of 'informations_bloc.dart';

@immutable
abstract class InformationsEvent extends Equatable {
  const InformationsEvent();
}

class InformationsWs extends InformationsEvent {
  final InputInformations? informations;
  const InformationsWs({this.informations});

  @override
  List<Object?> get props => [informations];
}