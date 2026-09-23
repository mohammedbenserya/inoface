import 'package:equatable/equatable.dart';
import 'dart:convert';


class InputRemoveDemande extends Equatable {

  final String identifiant;
  final String motdepasse;
  final String? tokenmobile;
  final int id_eleve_attestation_scolaire;


  const InputRemoveDemande({
    required this.identifiant,
    required this.motdepasse,
    this.tokenmobile,
    required this.id_eleve_attestation_scolaire,
  });

  String toString() {
    var body = {
      'identifiant': identifiant,
      'motdepasse': motdepasse,
      'tokenmobile': tokenmobile,
      'id_eleve_attestation_scolaire': id_eleve_attestation_scolaire,
    };
    return json.encode(body);
  }

  Map<String, dynamic> toJson() {
    return {
      'identifiant': identifiant,
      'motdepasse': motdepasse,
      'tokenmobile': tokenmobile,
      'id_eleve_attestation_scolaire': id_eleve_attestation_scolaire,
    };
  }

  @override
  List<Object?> get props => [identifiant, motdepasse, tokenmobile, id_eleve_attestation_scolaire];

}