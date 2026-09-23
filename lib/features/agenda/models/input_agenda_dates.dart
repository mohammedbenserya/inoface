import 'package:equatable/equatable.dart';
import 'dart:convert';


class InputAgendaDates2 extends Equatable {
  final String identifiant;
  final String motdepasse;
  final String tokenmobile;
  final int id_personne;

  InputAgendaDates2({
    required this.identifiant,
    required this.motdepasse,
    required this.tokenmobile,
    required this.id_personne,
  });

  String toString() {
    var body = {
      'identifiant': identifiant,
      'motdepasse': motdepasse,
      'tokenmobile': tokenmobile,
      'id_personne': id_personne,
    };
    return json.encode(body);
  }

  Map<String, dynamic> toJson() {
    return {
      'identifiant': identifiant,
      'motdepasse': motdepasse,
      'tokenmobile': tokenmobile,
      'id_personne': id_personne,
    };
  }

  @override
  List<Object> get props => [
        identifiant,
        motdepasse,
        tokenmobile,
        id_personne,
      ];
}
