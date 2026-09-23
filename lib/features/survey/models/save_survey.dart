import 'package:equatable/equatable.dart';
import 'dart:convert';


class SaveSurvey extends Equatable {
  final String identifiant;
  final String motdepasse;
  final String? tokenmobile;
  final String? choices;
  final String? commentaire;
  final int idSondageQuestion;

  const SaveSurvey({
    required this.identifiant,
    required this.motdepasse,
    this.tokenmobile,
    this.commentaire,
    this.choices,
    required this.idSondageQuestion,
  });

  Map<String, dynamic> toBodyModel() {
    var body = {
      'identifiant': identifiant,
      'motdepasse': motdepasse,
      'tokenmobile': tokenmobile,
      'Choices': choices,
      'id_sondage_question': idSondageQuestion,
      'commentaire': commentaire,
    };
    return {
      'inoface_ws': json.encode(body)
    };
  }

  @override
  List<Object?> get props => [
    identifiant,
    motdepasse,
    tokenmobile,
    choices,
    idSondageQuestion,
    commentaire,
  ];
}