import 'package:equatable/equatable.dart';
import 'dart:convert';


class InputAgenda extends Equatable {
  final String identifiant;
  final String motdepasse;
  final String? tokenmobile;
  final int id_personne;
  final String date_agenda;

  const InputAgenda({
    required this.identifiant,
    required this.motdepasse,
    this.tokenmobile,
    required this.id_personne,
    required this.date_agenda,
  });

  String toString() {
    var body = {
      'identifiant': identifiant,
      'motdepasse': motdepasse,
      'tokenmobile': tokenmobile,
      'id_personne': id_personne,
      'date_agenda': date_agenda, //'2020-06-04',//
    };
    return json.encode(body);
  }

  Map<String, dynamic> toJson() {
    return {
      'identifiant': identifiant,
      'motdepasse': motdepasse,
      'tokenmobile': tokenmobile,
      'id_personne': id_personne,
      'date_agenda': date_agenda,
    };
  }

  @override
  List<Object?> get props => [
        identifiant,
        motdepasse,
        tokenmobile,
        id_personne,
        date_agenda,
      ];
}
