import 'package:equatable/equatable.dart';
import 'dart:convert';


class InputAttestation extends Equatable {

  final String identifiant;
  final String motdepasse;
  final String? tokenmobile;
  final int id_personne;
  final int nombre_de_copies;

  InputAttestation({
    required this.identifiant,
    required this.motdepasse,
    this.tokenmobile,
    required this.id_personne,
    required this.nombre_de_copies,
  });

  String toString() {
    var body = {
      'identifiant': identifiant,
      'motdepasse': motdepasse,
      'tokenmobile': tokenmobile,
      'id_personne': id_personne,
      'nombre_de_copies': nombre_de_copies,
    };
    return json.encode(body);
  }

  Map<String, dynamic> toJson() {
    return {
      'identifiant': identifiant,
      'motdepasse': motdepasse,
      'tokenmobile': tokenmobile,
      'id_personne': id_personne,
      'nombre_de_copies': nombre_de_copies,
    };
  }

  @override
  List<Object?> get props => [identifiant, motdepasse, tokenmobile, id_personne, nombre_de_copies];

}