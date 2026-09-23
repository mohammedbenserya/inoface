part of 'demande_recuperation_bloc.dart';


abstract class DemandeRecuperationState extends Equatable {
  const DemandeRecuperationState();
}

class DemandeRecuperationInitial extends DemandeRecuperationState {
  const DemandeRecuperationInitial();
  @override
  List<Object> get props => [];
}


class DemandeRecuperationLoaded extends DemandeRecuperationState {
  final DemandesRecuperationModel model;
  const DemandeRecuperationLoaded({required this.model});
  @override
  List<Object> get props => [model];
}


class DemandeRecuperationError extends DemandeRecuperationState {
  final String message;
  const DemandeRecuperationError({required this.message});

  @override
  List<Object> get props => [message];
}