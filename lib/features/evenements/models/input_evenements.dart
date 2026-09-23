import 'package:inoface/core/database/app_database.dart';
import 'package:equatable/equatable.dart';
import 'dart:convert';


class InputEvenements extends Equatable {
  final String identifiant;
  final String motdepasse;
  final String? tokenmobile;
  final int id_personne;
  final List<Evenement> evenements;

  const InputEvenements({
    required this.identifiant,
    required this.motdepasse,
    this.tokenmobile,
    required this.id_personne,
    required this.evenements,
  });

  String toString() {
    var body = {
      'identifiant': identifiant,
      'motdepasse': motdepasse,
      'tokenmobile': tokenmobile,
      'id_personne': id_personne,
      'evenements': evenements,
    };
    return json.encode(body);
  }

  Map<String, dynamic> toJson() {
    return {
      'identifiant': identifiant,
      'motdepasse': motdepasse,
      'tokenmobile': tokenmobile,
      'id_personne': id_personne,
      'evenements': evenements,
    };
  }

  @override
  List<Object?> get props => [identifiant, motdepasse, tokenmobile, evenements];
}
