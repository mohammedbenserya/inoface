part of 'evenements_bloc.dart';

@immutable
abstract class EvenementsEvent extends Equatable {
  const EvenementsEvent();
}

class EvenementsWs extends EvenementsEvent {
  final InputEvenements? inputEvenements;
  const EvenementsWs({this.inputEvenements});

  @override
  List<Object?> get props => [inputEvenements];
}