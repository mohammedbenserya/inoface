import 'package:equatable/equatable.dart';
import 'dart:convert';


class SendNote extends Equatable {
  final String identifiant;
  final String motdepasse;
  final String? tokenmobile;
  final int id_agenda;
  final String note;

  SendNote({
    required this.identifiant,
    required this.motdepasse,
    this.tokenmobile,
    required this.id_agenda,
    required this.note,
  });

  toJson() {
    return {
      'identifiant': identifiant,
      'motdepasse': motdepasse,
      'tokenmobile': tokenmobile,
      'id_agenda': id_agenda,
      'note': note,
    };
  }

  toString() {
    var body = {
      'identifiant': identifiant,
      'motdepasse': motdepasse,
      'tokenmobile': tokenmobile,
      'id_agenda': id_agenda,
      'note': note,
    };
    return json.encode(body);
  }

  @override
  List<Object?> get props => [
        identifiant,
        motdepasse,
        tokenmobile,
        id_agenda,
        note,
      ];
}
