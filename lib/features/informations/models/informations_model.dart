import 'package:inoface/core/database/app_database.dart';
import 'dart:convert';

InformationsModel informationsModelFromJson(String str) => InformationsModel.fromJson(json.decode(str));
String informationsModelToJson(InformationsModel data) => json.encode(data.toJson());

class InformationsModel {
  InformationsModel({
    required this.erreur,
    required this.message,
    required this.informations,
  });

  bool erreur;
  String message;
  List<InformationMod> informations;

  factory InformationsModel.fromJson(Map<String, dynamic> json) => InformationsModel(
    erreur: json["erreur"],
    message: json["message"],
    informations: json["Informations"] != null ? List<InformationMod>.from(json["Informations"].map((x) => InformationMod.fromJson(x))) : [],
  );

  Map<String, dynamic> toJson() => {
    "erreur": erreur,
    "message": message,
    "Informations": List<InformationMod>.from(informations.map((x) => x.toJson())),
  };
}

class InformationMod extends Information {

  List<PiecesjointeModel> piecesjointes;

  InformationMod({
    required int id_information,
    required int id_personne,
    required String titre,
    String? description,
    required DateTime debut,
    required DateTime fin,
    required String lastupdate,
    // DateTime lastupdate,
    required this.piecesjointes,
  }) : super(
    id_information: id_information,
    id_personne: id_personne,
    titre: titre,
    description: description,
    debut: debut,
    fin: fin,
    lastupdate: lastupdate,
  );

  factory InformationMod.fromJson(Map<String, dynamic> json) => InformationMod(
    id_information: json["id_information"],
    id_personne: json["id_personne"],
    titre: json["titre"],
    description: json["description"],
    debut: DateTime.parse(json["debut"]),
    fin: DateTime.parse(json["fin"]),
    lastupdate: json["lastupdate"],
    //lastupdate: DateTime.parse(json["lastupdate"]),
    piecesjointes: json["Piecesjointes"] != null ? List<PiecesjointeModel>.from(json["Piecesjointes"].map((x) => PiecesjointeModel.fromJson(x))) : [],
  );
}

class PiecesjointeModel extends Piecesjointe {

  PiecesjointeModel({
    required int id_communication_piece_jointe,
    required String lien_piece_jointe,
    required int id_information,
  }) : super(
    id_communication_piece_jointe: id_communication_piece_jointe,
    lien_piece_jointe: lien_piece_jointe,
    id_information: id_information,
  );

  factory PiecesjointeModel.fromJson(Map<String, dynamic> json) => PiecesjointeModel(
    id_communication_piece_jointe: json["id_communication_piece_jointe"],
    lien_piece_jointe: json["lien_piece_jointe"],
    id_information: json["id_information"],
  );
}
