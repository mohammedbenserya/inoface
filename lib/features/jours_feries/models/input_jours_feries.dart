import 'package:inoface/core/database/app_database.dart';
import 'package:equatable/equatable.dart';
import 'dart:convert';


class InputJoursFeries extends Equatable {

  final String identifiant;
  final String motdepasse;
  final String? tokenmobile;
  final List<JoursFerie> jours;

  const InputJoursFeries({
    required this.identifiant,
    required this.motdepasse,
    this.tokenmobile,
    required this.jours,
  });

  String toString() {
    var body = {
      'identifiant': identifiant,
      'motdepasse': motdepasse,
      'tokenmobile': tokenmobile,
      'jours_feries': jours,
    };
    return json.encode(body);
  }

  Map<String, dynamic> toJson() {
    return {
      'identifiant': identifiant,
      'motdepasse': motdepasse,
      'tokenmobile': tokenmobile,
      'jours_feries': jours,
    };
  }

  @override
  List<Object?> get props => [identifiant, motdepasse, tokenmobile, jours];

}