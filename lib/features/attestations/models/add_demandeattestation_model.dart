import 'package:inoface/core/database/app_database.dart';
import 'dart:convert';


AddDemandeattestationModel addDemandeattestationModelFromJson(String str) => AddDemandeattestationModel.fromJson(json.decode(str));

String addDemandeattestationModelToJson(AddDemandeattestationModel data) => json.encode(data.toJson());

class AddDemandeattestationModel {
  AddDemandeattestationModel({
    required this.erreur,
    this.eleveAttestationScolaire,
    required this.message,
  });

  bool erreur;
  EleveAttestationScolaireMod? eleveAttestationScolaire;
  String message;

  factory AddDemandeattestationModel.fromJson(Map<String, dynamic> json) => AddDemandeattestationModel(
    erreur: json["erreur"],
    eleveAttestationScolaire: json["eleve_attestation_scolaire"] != null ? EleveAttestationScolaireMod.fromJson(json["eleve_attestation_scolaire"]) : null,
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "erreur": erreur,
    "eleve_attestation_scolaire": eleveAttestationScolaire?.toJson(),
    "message": message,
  };
}

class EleveAttestationScolaireMod extends EleveAttestationScolaire {
  EleveAttestationScolaireMod({
    required this.idEleveAttestationScolaire,
    required this.idPersonneParent,
    required this.idPersonneEleve,
    required this.dateDeLaDemande,
    this.dateDeLaReception,
    required this.nombreDeCopies,
    required this.idstatut,
    required this.statut,
  }) : super(
    id_eleve_attestation_scolaire: idEleveAttestationScolaire,
    id_personne_parent: idPersonneParent,
    id_personne_eleve: idPersonneEleve,
    date_de_la_demande: dateDeLaDemande,
    date_de_la_reception: dateDeLaReception,
    nombre_de_copies: nombreDeCopies,
    idstatut: idstatut,
    statut: statut,
  );

  int idEleveAttestationScolaire;
  int idPersonneParent;
  int idPersonneEleve;
  DateTime dateDeLaDemande;
  DateTime? dateDeLaReception;
  int nombreDeCopies;
  int idstatut;
  String statut;

  factory EleveAttestationScolaireMod.fromJson(Map<String, dynamic> json) => EleveAttestationScolaireMod(
    idEleveAttestationScolaire: json["id_eleve_attestation_scolaire"],
    idPersonneParent: json["id_personne_parent"],
    idPersonneEleve: json["id_personne_eleve"],
    dateDeLaDemande: DateTime.parse(json["date_de_la_demande"]),
    dateDeLaReception: json["date_de_la_reception"] != null ? DateTime.parse(json["date_de_la_reception"]) : null,
    nombreDeCopies: json["nombre_de_copies"],
    idstatut: json["idstatut"],
    statut: json["statut"],
  );
}
