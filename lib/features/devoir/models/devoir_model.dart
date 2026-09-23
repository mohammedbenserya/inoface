import 'package:inoface/core/database/app_database.dart';
import 'dart:convert';


DevoirModel devoirsModelFromJson(String str) => DevoirModel.fromJson(json.decode(str));
String devoirsModelToJson(DevoirModel data) => json.encode(data.toJson());

class DevoirModel {
  DevoirModel({
    required this.erreur,
    required this.message,
    required this.devoirs,
  });

  bool erreur;
  String message;
  List<DevoirMod> devoirs;

  factory DevoirModel.fromJson(Map<String, dynamic> json) => DevoirModel(
    erreur: json["erreur"],
    message: json["message"],
    devoirs: json["Devoirs"] != null ? List<DevoirMod>.from(json["Devoirs"].map((x) => DevoirMod.fromJson(x))) : [],
  );

  Map<String, dynamic> toJson() => {
    "erreur": erreur,
    "message": message,
    "Devoirs": List<DevoirMod>.from(devoirs.map((x) => x.toJson())),
  };
}

class DevoirMod extends Devoir {

  DevoirMod({
    required this.id_personne,
    required this.idDevoir,
    this.devoirDescription,
    this.devoirDetail,
    this.matiere,
    required this.devoirtype,
    this.devoirendrroit,
    required this.position,
    required this.piecesjointes,
    required this.date_devoir,
  }) : super(
    id_personne: id_personne,
    id_devoir: idDevoir,
    devoir_description: devoirDescription,
    devoir_detail: devoirDetail,
    matiere: matiere,
    devoirtype: devoirtype,
    devoirendrroit: devoirendrroit,
    position: position,
    date_devoir: date_devoir,
  );

  int id_personne;
  int idDevoir;
  String? devoirDescription;
  String? devoirDetail;
  String? matiere;
  String devoirtype;
  String? devoirendrroit;
  int position;
  DateTime date_devoir;
  List<Piecesjointe> piecesjointes;

  factory DevoirMod.fromJson(Map<String, dynamic> json) => DevoirMod(
    id_personne: json["id_personne"],
    idDevoir: json["id_devoir"],
    devoirDescription: json["devoir_description"],
    devoirDetail: json["devoir_detail"],
    matiere: json["matiere"],
    devoirtype: json["devoirtype"],
    devoirendrroit: json["devoirendrroit"],
    position: json["position"],
    date_devoir: DateTime.parse(json["date_devoir"]),
    piecesjointes: json["Piecesjointes"] != null ? List<Piecesjointe>.from(json["Piecesjointes"].map((x) => Piecesjointe.fromJson(x))) : [],
  );

  Map<String, dynamic> toJsonModel() => {
    "id_personne": id_personne,
    "id_devoir": idDevoir,
    "devoir_description": devoirDescription,
    "devoir_detail": devoirDetail,
    "matiere": matiere,
    "devoirtype": devoirtype,
    "devoirendrroit": devoirendrroit,
    "position": position,
    "date_devoir": date_devoir,
    "Piecesjointes": List<Piecesjointe>.from(piecesjointes.map((x) => x.toJson())),
  };

}

class Piecesjointe extends DevoirPiecesjointe {

  Piecesjointe({
    required this.idDevoirPieceJointe,
    required this.nomOriginalPieceJointe,
    required this.lieuPieceJointe,
    required this.position,
    required this.idDevoir,
  }) : super(
    id_devoir_piece_jointe: idDevoirPieceJointe,
    nom_original_piece_jointe: nomOriginalPieceJointe,
    lieu_piece_jointe: lieuPieceJointe,
    position: position,
    id_devoir: idDevoir,
  );

  int idDevoirPieceJointe;
  String nomOriginalPieceJointe;
  String lieuPieceJointe;
  int position;
  int idDevoir;

  factory Piecesjointe.fromJson(Map<String, dynamic> json) => Piecesjointe(
    idDevoirPieceJointe: json["id_devoir_piece_jointe"],
    nomOriginalPieceJointe: json["nom_original_piece_jointe"],
    lieuPieceJointe: json["lieu_piece_jointe"],
    position: json["position"],
    idDevoir: json["id_devoir"],
  );

  Map<String, dynamic> toJsonModel() => {
    "id_devoir_piece_jointe": idDevoirPieceJointe,
    "nom_original_piece_jointe": nomOriginalPieceJointe,
    "lieu_piece_jointe": lieuPieceJointe,
    "position": position,
    "id_devoir": idDevoir,
  };
}
