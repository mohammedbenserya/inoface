import 'package:get/get.dart';
import 'dart:convert';


SurveyModel surveyModelFromJson(String str) => SurveyModel.fromJson(json.decode(str));
String surveyModelToJson(SurveyModel data) => json.encode(data.toJson());

class SurveyModel {
  SurveyModel({
    required this.erreur,
    required this.message,
    required this.sondages,
  });

  bool erreur;
  String message;
  List<Sondage> sondages;

  factory SurveyModel.fromJson(Map<String, dynamic> json) => SurveyModel(
    erreur: json["erreur"] ?? true,
    message: json["message"] ?? 'error_server'.tr,
    sondages: json["Sondages"] != null ? List<Sondage>.from(json["Sondages"].map((x) => Sondage.fromJson(x))) : [],
  );

  Map<String, dynamic> toJson() => {
    "erreur": erreur,
    "message": message,
    "Sondages": List<dynamic>.from(sondages.map((x) => x.toJson())),
  };
}

class Sondage {
  Sondage({
    required this.idSondage,
    required this.titre,
    required this.description,
    required this.debut,
    required this.fin,
    required this.idPersonne,
    required this.lastupdate,
    required this.piecesjointes,
    required this.questions,
    this.statut,
  });

  int idSondage;
  String titre;
  String description;
  String debut;
  String fin;
  int idPersonne;
  DateTime lastupdate;
  List<Piecesjointe> piecesjointes;
  List<Question> questions;
  Statut? statut;

  factory Sondage.fromJson(Map<String, dynamic> json) => Sondage(
    idSondage: json["id_sondage"],
    titre: json["titre"],
    description: json["description"],
    debut: json["debut"],
    fin: json["fin"],
    idPersonne: json["id_personne"],
    lastupdate: DateTime.parse(json["lastupdate"]),
    piecesjointes: json["Piecesjointes"] != null ? List<Piecesjointe>.from(json["Piecesjointes"].map((x) => Piecesjointe.fromJson(x))) : [],
    questions: List<Question>.from(json["Questions"].map((x) => Question.fromJson(x))),
    statut: json["Statut"] != null ? Statut.fromJson(json["Statut"]) : null,
  );

  Map<String, dynamic> toJson() => {
    "id_sondage": idSondage,
    "titre": titre,
    "description": description,
    "debut": debut,
    "fin": fin,
    "id_personne": idPersonne,
    "lastupdate": lastupdate.toIso8601String(),
    "Piecesjointes": List<dynamic>.from(piecesjointes.map((x) => x)),
    "Questions": List<dynamic>.from(questions.map((x) => x.toJson())),
    "Statut": statut?.toJson(),
  };
}

class Question {
  Question({
    required this.idSondageQuestion,
    required this.description,
    required this.choixMultiple,
    required this.position,
    required this.idSondage,
    this.commentaire,
    required this.choix,
  });

  int idSondageQuestion;
  String description;
  bool choixMultiple;
  int position;
  int idSondage;
  String? commentaire;
  List<Choix> choix;

  factory Question.fromJson(Map<String, dynamic> json) => Question(
    idSondageQuestion: json["id_sondage_question"],
    description: json["description"],
    choixMultiple: json["choix_multiple"],
    position: json["position"],
    idSondage: json["id_sondage"],
    commentaire: json["commentaire"],
    choix: List<Choix>.from(json["Choix"].map((x) => Choix.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id_sondage_question": idSondageQuestion,
    "description": description,
    "choix_multiple": choixMultiple,
    "position": position,
    "id_sondage": idSondage,
    "commentaire": commentaire,
    "Choix": List<dynamic>.from(choix.map((x) => x.toJson())),
  };
}

class Choix {
  Choix({
    required this.idSondageChoice,
    required this.choix,
    required this.idSondageQuestion,
    required this.selected,
  });

  int idSondageChoice;
  String choix;
  int idSondageQuestion;
  bool selected;

  factory Choix.fromJson(Map<String, dynamic> json) => Choix(
    idSondageChoice: json["id_sondage_choice"],
    choix: json["choix"],
    idSondageQuestion: json["id_sondage_question"],
    selected: json["selected"],
  );

  Map<String, dynamic> toJson() => {
    "id_sondage_choice": idSondageChoice,
    "choix": choix,
    "id_sondage_question": idSondageQuestion,
    "selected": selected,
  };
}

class Piecesjointe {
  Piecesjointe({
    required this.idCommunicationPieceJointe,
    required this.lienPieceJointe,
    required this.idSondage,
  });

  int idCommunicationPieceJointe;
  String lienPieceJointe;
  int idSondage;

  factory Piecesjointe.fromJson(Map<String, dynamic> json) => Piecesjointe(
    idCommunicationPieceJointe: json["id_communication_piece_jointe"],
    lienPieceJointe: json["lien_piece_jointe"],
    idSondage: json["id_sondage"],
  );

  Map<String, dynamic> toJson() => {
    "id_communication_piece_jointe": idCommunicationPieceJointe,
    "lien_piece_jointe": lienPieceJointe,
    "id_sondage": idSondage,
  };
}

class Statut {
  Statut({
    required this.idStatut,
    required this.sondageStatut,
    required this.color,
    required this.idSondage,
  });

  int idStatut;
  String sondageStatut;
  String color;
  int idSondage;

  factory Statut.fromJson(Map<String, dynamic> json) => Statut(
    idStatut: json["id_statut"],
    sondageStatut: json["sondage_statut"],
    color: json["color"],
    idSondage: json["id_sondage"],
  );

  Map<String, dynamic> toJson() => {
    "id_statut": idStatut,
    "sondage_statut": sondageStatut,
    "color": color,
    "id_sondage": idSondage,
  };
}
