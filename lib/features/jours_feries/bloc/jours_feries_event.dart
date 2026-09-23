part of 'jours_feries_bloc.dart';

@immutable
abstract class JoursFeriesEvent extends Equatable {
  const JoursFeriesEvent();
}

class JoursFeriesWs extends JoursFeriesEvent {
  final InputJoursFeries? inputJoursFeries;
  const JoursFeriesWs({this.inputJoursFeries});

  @override
  List<Object?> get props => [inputJoursFeries];
}
