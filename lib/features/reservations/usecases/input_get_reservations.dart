import 'dart:convert';

import 'package:equatable/equatable.dart';

class InputGetReservations extends Equatable {
  final String identifiant;
  final String motdepasse;
  final String? tokenmobile;
  final int id_personne;
  final String date_cantine;

  const InputGetReservations({
    required this.identifiant,
    required this.motdepasse,
    this.tokenmobile,
    required this.id_personne,
    required this.date_cantine,
  });

  String toString() {
    var body = {
      'identifiant': identifiant,
      'motdepasse': motdepasse,
      'tokenmobile': tokenmobile,
      'id_personne': id_personne,
      'date_cantine': date_cantine,
    };
    return json.encode(body);
  }

  Map<String, dynamic> toJson() {
    return {
      'identifiant': identifiant,
      'motdepasse': motdepasse,
      'tokenmobile': tokenmobile,
      'id_personne': id_personne,
      'date_cantine': date_cantine,
    };
  }

  @override
  List<Object?> get props => [identifiant, motdepasse, tokenmobile, id_personne, date_cantine];
}
