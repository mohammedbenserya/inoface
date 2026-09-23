part of 'attestations_bloc.dart';

abstract class AttestationsState extends Equatable {
  const AttestationsState();
}


// class InitialAttestationsState extends AttestationsState {
//   const InitialAttestationsState();
//
//   @override
//   List<Object> get props => [];
// }

class LoadingAttestationsState extends AttestationsState {
  const LoadingAttestationsState();

  @override
  List<Object> get props => [];
}

class LoadedAttestationsState extends AttestationsState {
  final DemandeAttestationsModel? model;
  final AddDemandeattestationModel? addModel;
  const LoadedAttestationsState({this.model, this.addModel});

  @override
  List<Object?> get props => [model];
}

class ErrorAttestationsState extends AttestationsState {
  final String message;
  const ErrorAttestationsState({required this.message});

  @override
  List<Object> get props => [message];
}