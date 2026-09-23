part of 'attestations_bloc.dart';

abstract class AttestationsEvent extends Equatable {
  const AttestationsEvent();
}


class CurrentDemandeAttestations extends AttestationsEvent {
  final int idPersonne;
  const CurrentDemandeAttestations({required this.idPersonne});

  @override
  List<Object> get props => [idPersonne];
}

class AddDemandeAttestations extends AttestationsEvent {
  final InputAttestation input;
  const AddDemandeAttestations({required this.input});

  @override
  List<Object> get props => [input];
}