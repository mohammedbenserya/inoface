import 'package:inoface/core/database/app_database.dart';
import 'dart:convert';

DemandeAttestationsModel demandeAttestationsModelFromJson(String str) => DemandeAttestationsModel.fromJson(json.decode(str));
String demandeAttestationsModelToJson(DemandeAttestationsModel data) => json.encode(data.toJson());

class DemandeAttestationsModel {
  DemandeAttestationsModel({
    required this.erreur,
    required this.message,
    required this.demandesAttestations,
  });

  bool erreur;
  String message;
  List<DemandesAttestationMod> demandesAttestations;

  factory DemandeAttestationsModel.fromJson(Map<String, dynamic> json) => DemandeAttestationsModel(
    erreur: json["erreur"],
    message: json["message"],
    demandesAttestations: json["DemandesAttestations"] != null ? List<DemandesAttestationMod>.from(json["DemandesAttestations"].map((x) => DemandesAttestationMod.fromJson(x))) : [],
  );

  Map<String, dynamic> toJson() => {
    "erreur": erreur,
    "message": message,
    "DemandesAttestations": List<dynamic>.from(demandesAttestations.map((x) => x.toJson())),
  };
}

class DemandesAttestationMod extends DemandesAttestation {

  DemandesAttestationMod({
    required this.idEleveAttestationScolaire,
    this.idPersonneParent,
    required this.idPersonneEleve,
    required this.dateDeLaDemande,
    this.dateDeLaReception,
    required this.nombreDeCopies,
    required this.idstatut,
    required this.statut,
    this.parentnom,
    this.send,
  }) : super(
    id_eleve_attestation_scolaire: idEleveAttestationScolaire,
    id_personne_parent: idPersonneParent,
    id_personne_eleve: idPersonneEleve,
    date_de_la_demande: dateDeLaDemande,
    date_de_la_reception: dateDeLaReception,
    nombre_de_copies: nombreDeCopies,
    idstatut: idstatut,
    statut: statut,
    parentnom: parentnom,
    send: send,
  );

  int idEleveAttestationScolaire;
  int? idPersonneParent;
  int idPersonneEleve;
  DateTime dateDeLaDemande;
  DateTime? dateDeLaReception;
  int nombreDeCopies;
  int idstatut;
  String statut;
  String? parentnom;
  bool? send;

  factory DemandesAttestationMod.fromJson(Map<String, dynamic> json) => DemandesAttestationMod(
    idEleveAttestationScolaire: json["id_eleve_attestation_scolaire"],
    idPersonneParent: json["id_personne_parent"],
    idPersonneEleve: json["id_personne_eleve"],
    dateDeLaDemande: DateTime.parse(json["date_de_la_demande"]),
    dateDeLaReception: json["date_de_la_reception"] != null ? DateTime.parse(json["date_de_la_reception"]) : null,
    nombreDeCopies: json["nombre_de_copies"],
    idstatut: json["idstatut"],
    parentnom: json["parentnom"],
    statut: json["statut"],
    send: true,
  );
}
