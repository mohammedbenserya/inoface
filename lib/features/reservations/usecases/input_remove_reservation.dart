import 'dart:convert';

import 'package:equatable/equatable.dart';

class InputRemoveReservation extends Equatable {
  final String identifiant;
  final String motdepasse;
  final String? tokenmobile;
  final int id_cantine_journaliere;

  const InputRemoveReservation({
    required this.identifiant,
    required this.motdepasse,
    required this.tokenmobile,
    required this.id_cantine_journaliere,
  });

  String toString() {
    var body = {
      'identifiant': identifiant,
      'motdepasse': motdepasse,
      'tokenmobile': tokenmobile,
      'id_cantine_journaliere': id_cantine_journaliere,
    };
    return json.encode(body);
  }

  Map<String, dynamic> toJson() {
    return {
      'identifiant': identifiant,
      'motdepasse': motdepasse,
      'tokenmobile': tokenmobile,
      'id_cantine_journaliere': id_cantine_journaliere,
    };
  }

  @override
  List<Object?> get props => [identifiant, motdepasse, tokenmobile, id_cantine_journaliere];
}
