import 'package:equatable/equatable.dart';
import 'dart:convert';


class InputEvenementsById extends Equatable {

  final String identifiant;
  final String motdepasse;
  final String? tokenmobile;
  final int id_personne;
  final int id_evenement;

  InputEvenementsById({
    required this.identifiant,
    required this.motdepasse,
    this.tokenmobile,
    required this.id_personne,
    required this.id_evenement,
  });

  String toString() {
    var body = {
      'identifiant': identifiant,
      'motdepasse': motdepasse,
      'tokenmobile': tokenmobile,
      'id_personne': id_personne,
      'id_evenement': id_evenement,
    };
    return json.encode(body);
  }

  Map<String, dynamic> toJson() {
    return {
      'identifiant': identifiant,
      'motdepasse': motdepasse,
      'tokenmobile': tokenmobile,
      'id_personne': id_personne,
      'id_evenement': id_evenement,
    };
  }

  @override
  List<Object?> get props => [identifiant, motdepasse, tokenmobile, id_evenement];

}