import 'dart:convert';

import 'package:equatable/equatable.dart';

class InputPdfReservation extends Equatable {
  final String identifiant;
  final String motdepasse;
  final String? tokenmobile;
  final String date_cantine;

  const InputPdfReservation({
    required this.identifiant,
    required this.motdepasse,
    this.tokenmobile,
    required this.date_cantine,
  });

  String toString() {
    var body = {
      'identifiant': identifiant,
      'motdepasse': motdepasse,
      'tokenmobile': tokenmobile,
      'date_cantine': date_cantine,
    };
    return json.encode(body);
  }

  Map<String, dynamic> toJson() {
    return {
      'identifiant': identifiant,
      'motdepasse': motdepasse,
      'tokenmobile': tokenmobile,
      'date_cantine': date_cantine,
    };
  }

  @override
  List<Object?> get props => [identifiant, motdepasse, tokenmobile, date_cantine];
}
