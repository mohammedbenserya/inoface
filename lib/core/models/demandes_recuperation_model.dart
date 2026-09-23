import 'package:inoface/core/database/app_database.dart';
import 'dart:convert';


DemandesRecuperationModel demandesRecuperationModelFromJson(String str) =>
    DemandesRecuperationModel.fromJson(json.decode(str));

String demandesRecuperationModelToJson(DemandesRecuperationModel data) => json.encode(data.toJson());

class DemandesRecuperationModel {
  DemandesRecuperationModel({
    required this.erreur,
    required this.message,
    required this.demandesRecuperation,
  });

  bool erreur;
  String message;
  List<DemandesRecuperation> demandesRecuperation;

  factory DemandesRecuperationModel.fromJson(Map<String, dynamic> json) => DemandesRecuperationModel(
        erreur: json["erreur"],
        message: json["message"],
        demandesRecuperation: json["DemandesRecuperation"] != null
            ? List<DemandesRecuperation>.from(json["DemandesRecuperation"].map((x) => DemandesRecuperation.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "erreur": erreur,
        "message": message,
        "DemandesRecuperation": List<dynamic>.from(demandesRecuperation.map((x) => x.toJsonModel())),
      };
}

class DemandesRecuperation extends Recuperation {
  DemandesRecuperation({
    required this.idEleveRecuperations,
    required this.idPersonneParent,
    required this.idPersonneEleve,
    this.parentnom,
    required this.dateDeLaDemande,
  }) : super(
          id_eleve_recuperations: idEleveRecuperations,
          id_personne_parent: idPersonneParent,
          id_personne_eleve: idPersonneEleve,
          parentnom: parentnom,
          date_de_la_demande: dateDeLaDemande,
        );

  int idEleveRecuperations;
  int idPersonneParent;
  int idPersonneEleve;
  String? parentnom;
  DateTime dateDeLaDemande;

  factory DemandesRecuperation.fromJson(Map<String, dynamic> json) => DemandesRecuperation(
        idEleveRecuperations: json["id_eleve_recuperations"],
        idPersonneParent: json["id_personne_parent"],
        idPersonneEleve: json["id_personne_eleve"],
        parentnom: json["parentnom"],
        dateDeLaDemande: DateTime.parse(json["date_de_la_demande"]),
      );

  Map<String, dynamic> toJsonModel() => {
        "id_eleve_recuperations": idEleveRecuperations,
        "id_personne_parent": idPersonneParent,
        "id_personne_eleve": idPersonneEleve,
        "parentnom": parentnom,
        "date_de_la_demande": dateDeLaDemande.toIso8601String(),
      };
}
