import 'package:inoface/core/database/app_database.dart';
import 'dart:convert';

MainCountsModel mainCountsModelFromJson(String str) => MainCountsModel.fromJson(json.decode(str));
String mainCountsModelToJson(MainCountsModel data) => json.encode(data.toJsonModel());


class MainCountsModel extends Counter {

  MainCountsModel({
    // required this.erreur,
    // required this.message,
    required this.idPersonne,
    required this.countJoursFeries,
    required this.countEvenements,
    required this.countInformations,
    required this.countNotifications,
    required this.countSondages,
  }) : super(
    id_personne: idPersonne,
    count_jours_feries: countJoursFeries,
    count_evenements: countEvenements,
    count_informations: countInformations,
    count_sondages: countSondages,
    count_notifications: countNotifications,
  );

  // bool erreur;
  // String message;
  int idPersonne;
  int countJoursFeries;
  int countEvenements;
  int countInformations;
  int countNotifications;
  int countSondages;

  factory MainCountsModel.fromJson(Map<String, dynamic> json) => MainCountsModel(
    // erreur: json["erreur"],
    // message: json["message"],
    idPersonne: json["id_personne"],
    countJoursFeries: json["count_jours_feries"] ?? 0,
    countEvenements: json["count_evenements"] ?? 0,
    countInformations: json["count_informations"] ?? 0,
    countNotifications: json["count_notifications"] ?? 0,
    countSondages: json["count_sondages"] ?? 0,
  );

  Map<String, dynamic> toJsonModel() => {
    // "erreur": erreur,
    // "message": message,
    "id_personne": idPersonne,
    "count_jours_feries": countJoursFeries,
    "count_evenements": countEvenements,
    "count_informations": countInformations,
    "count_notifications": countNotifications,
    "count_sondages": countSondages,
  };
}