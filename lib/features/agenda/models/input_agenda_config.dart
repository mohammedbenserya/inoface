import 'package:equatable/equatable.dart';
import 'dart:convert';


class InputAgendaConfig extends Equatable {
  final String identifiant;
  final String motdepasse;
  final String? tokenmobile;
  final int id_personne;
  final String lastupdate;

  InputAgendaConfig({
    required this.identifiant,
    required this.motdepasse,
    this.tokenmobile,
    required this.id_personne,
    required this.lastupdate,
  });

  String toString() {
    var body = {
      'identifiant': identifiant,
      'motdepasse': motdepasse,
      'tokenmobile': tokenmobile,
      'id_personne': id_personne,
      'lastupdate': lastupdate,
    };
    return json.encode(body);
  }

  Map<String, dynamic> toJson() {
    return {
      'identifiant': identifiant,
      'motdepasse': motdepasse,
      'tokenmobile': tokenmobile,
      'id_personne': id_personne,
      'lastupdate': lastupdate,
    };
  }

  @override
  List<Object?> get props => [
        identifiant,
        motdepasse,
        tokenmobile,
        id_personne,
        lastupdate,
      ];
}
