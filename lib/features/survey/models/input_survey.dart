import 'package:equatable/equatable.dart';
import 'dart:convert';


class InputSurvey extends Equatable {
  final String identifiant;
  final String motdepasse;
  final String? tokenmobile;
  final int? id_personne;
  final int? idStatut;
  final int? idSondage;

  const InputSurvey({
    required this.identifiant,
    required this.motdepasse,
    this.tokenmobile,
    this.id_personne,
    this.idStatut,
    this.idSondage,
  });

  Map<String, dynamic> toBodyModel() {
    var body = {
      'identifiant': identifiant,
      'motdepasse': motdepasse,
      'tokenmobile': tokenmobile,
      'id_personne': id_personne,
      'id_statut': idStatut,
      'id_sondage': idSondage,
    };
    return {
      'inoface_ws': json.encode(body)
    };
  }

  @override
  List<Object?> get props => [identifiant, motdepasse, tokenmobile];
}