import 'package:inoface/core/database/app_database.dart';
import 'dart:convert';

InformationsModelById informationsByIdModelFromJson(String str) => InformationsModelById.fromJson(json.decode(str));

class InformationsModelById {
  InformationsModelById({
    required this.erreur,
    required this.message,
    this.informations,
  });

  final bool erreur;
  final String message;
  final InformationMod? informations;

  factory InformationsModelById.fromJson(Map<String, dynamic> json) => InformationsModelById(
    erreur: json["erreur"],
    message: json["message"],
    informations: json["Information"] != null ? InformationMod.fromJson(json["Information"]) : null,
  );

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
    //DateTime lastupdate,
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
