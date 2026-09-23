part of 'demande_recuperation_bloc.dart';

abstract class DemandeRecuperationEvent extends Equatable {
  const DemandeRecuperationEvent();
}


class InitDemandeRecuperationEvent extends DemandeRecuperationEvent {
  final InputLogin input;
  const InitDemandeRecuperationEvent({required this.input});

  @override
  List<Object> get props => [input];
}