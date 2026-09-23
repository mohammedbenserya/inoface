import 'package:inoface/core/database/app_database.dart';
import 'dart:convert';

EvenementsModelById evenementsByIdModelFromJson(String str) => EvenementsModelById.fromJson(json.decode(str));


class EvenementsModelById {
  EvenementsModelById({
    required this.erreur,
    required this.message,
    this.evenements,
  });

  final bool erreur;
  final String message;
  final EvenementModelId? evenements;

  factory EvenementsModelById.fromJson(Map<String, dynamic> json) => EvenementsModelById(
    erreur: json["erreur"],
    message: json["message"],
    evenements: json["Evenement"] != null ? EvenementModelId.fromJson(json["Evenement"]) : null,
  );
}

class EvenementModelId extends Evenement {

  final List<PiecesjointeModel> piecesjointes;
  final List<AlbumphotoModel> albumphotos;

  EvenementModelId({
    required int id_evenement,
    required int id_personne,
    required String titre,
    String? description,
    required DateTime debut,
    required DateTime fin,
    required DateTime lastupdate,
    required this.piecesjointes,
    required this.albumphotos,
  }) : super(
    id_evenement: id_evenement,
    id_personne: id_personne,
    titre: titre,
    description: description,
    debut: debut,
    fin: fin,
    lastupdate: lastupdate,
  );


  factory EvenementModelId.fromJson(Map<String, dynamic> json) => EvenementModelId(
    id_evenement: json["id_evenement"],
    id_personne: json["id_personne"],
    titre: json["titre"],
    description: json["description"],
    debut: DateTime.parse(json["debut"]),
    fin: DateTime.parse(json["fin"]),
    lastupdate: DateTime.parse(json["lastupdate"]),
    piecesjointes: json["Piecesjointes"] != null ? List<PiecesjointeModel>.from(json["Piecesjointes"].map((x) => PiecesjointeModel.fromJson(x))) : [],
    albumphotos: json["Albumphotos"] != null ? List<AlbumphotoModel>.from(json["Albumphotos"].map((x) => AlbumphotoModel.fromJson(x))) : [],
  );
}

class AlbumphotoModel extends Albumphoto {
  AlbumphotoModel({
    required int id_communication_photo,
    String? photo_description,
    required String lien_piece_jointe,
    required int position,
    required int id_evenement,
  }) : super(
    id_communication_photo: id_communication_photo,
    photo_description: photo_description,
    lien_piece_jointe: lien_piece_jointe,
    position: position,
    id_evenement: id_evenement,
  );

  factory AlbumphotoModel.fromJson(Map<String, dynamic> json) => AlbumphotoModel(
    id_communication_photo: json["id_communication_photo"],
    photo_description: json["photo_description"],
    lien_piece_jointe: json["lien_piece_jointe"],
    position: json["position"],
    id_evenement: json["id_evenement"],
  );
}

class PiecesjointeModel extends  Piecesjointe {

  PiecesjointeModel({
    required int id_communication_piece_jointe,
    required String lien_piece_jointe,
    required int id_evenement,
  }) : super(
    id_communication_piece_jointe: id_communication_piece_jointe,
    lien_piece_jointe: lien_piece_jointe,
    id_evenement: id_evenement,
  );

  factory PiecesjointeModel.fromJson(Map<String, dynamic> json) => PiecesjointeModel(
    id_communication_piece_jointe: json["id_communication_piece_jointe"],
    lien_piece_jointe: json["lien_piece_jointe"],
    id_evenement: json["id_evenement"],
  );

}
