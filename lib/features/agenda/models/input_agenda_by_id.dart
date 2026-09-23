import 'package:equatable/equatable.dart';
import 'dart:convert';


class InputAgendaById extends Equatable {
  final String identifiant;
  final String motdepasse;
  final String? tokenmobile;
  final int id_personne;
  final int id_agenda;

  InputAgendaById({
    required this.identifiant,
    required this.motdepasse,
    required this.tokenmobile,
    required this.id_personne,
    required this.id_agenda,
  });

  String toString() {
    var body = {
      'identifiant': identifiant,
      'motdepasse': motdepasse,
      'tokenmobile': tokenmobile,
      'id_personne': id_personne,
      'id_agenda': id_agenda,
    };
    return json.encode(body);
  }

  Map<String, dynamic> toJson() {
    return {
      'identifiant': identifiant,
      'motdepasse': motdepasse,
      'tokenmobile': tokenmobile,
      'id_personne': id_personne,
      'id_agenda': id_agenda,
    };
  }

  @override
  List<Object?> get props => [
        identifiant,
        motdepasse,
        tokenmobile,
        id_personne,
        id_agenda,
      ];
}
