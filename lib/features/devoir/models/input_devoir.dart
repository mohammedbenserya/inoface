import 'package:equatable/equatable.dart';
import 'dart:convert';


class InputDevoir extends Equatable {

  final String identifiant;
  final String motdepasse;
  final String? tokenmobile;
  final int id_personne;
  final String date_devoir;

  InputDevoir({
    required this.identifiant,
    required this.motdepasse,
    this.tokenmobile,
    required this.id_personne,
    required this.date_devoir,
  });

  String toString() {
    var body = {
      'identifiant': identifiant,
      'motdepasse': motdepasse,
      'tokenmobile': tokenmobile,
      'id_personne': id_personne,
      'date_devoir': date_devoir,
    };
    return json.encode(body);
  }

  Map<String, dynamic> toJson() {
    return {
      'identifiant': identifiant,
      'motdepasse': motdepasse,
      'tokenmobile': tokenmobile,
      'id_personne': id_personne,
      'date_devoir': date_devoir,
    };
  }

  @override
  List<Object?> get props => [
    identifiant,
    motdepasse,
    tokenmobile,
    id_personne,
    date_devoir,
  ];

}