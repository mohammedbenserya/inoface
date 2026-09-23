import 'package:inoface/core/database/app_database.dart';
import 'package:get/get.dart';
import 'dart:convert';


JoursFeriesModel joursFeriesModelFromJson(String str) => JoursFeriesModel.fromJson(json.decode(str));

class JoursFeriesModel {
  JoursFeriesModel({
    required this.erreur,
    required this.message,
    required this.joursFeries,
  });

  bool erreur;
  String message;
  List<JoursFery> joursFeries;

  factory JoursFeriesModel.fromJson(Map<String, dynamic> json) => JoursFeriesModel(
    erreur: json["erreur"] ?? true,
    message: json["message"] ?? 'error_server'.tr,
    joursFeries: json["Jours_feries"] != null ? List<JoursFery>.from(json["Jours_feries"].map((x) => JoursFery.fromJson(x))) : [],
  );

  Map<String, dynamic> toJson() => {
    "erreur": erreur,
    "message": message,
    "Jours_feries": List<JoursFery>.from(joursFeries.map((x) => x.toJson())),
  };
}

class JoursFery extends JoursFerie {

  JoursFery({
    required int id_jours_feries,
    required String description_jour_ferie,
    required DateTime date_debut_jour_ferie,
    required DateTime date_fin_jour_ferie,
    required DateTime lastupdate,
  }) : super(
    id_jours_feries: id_jours_feries,
    description_jour_ferie : description_jour_ferie,
    date_debut_jour_ferie : date_debut_jour_ferie,
    date_fin_jour_ferie : date_fin_jour_ferie,
    lastupdate : lastupdate,
  );

  factory JoursFery.fromJson(Map<String, dynamic> json) => JoursFery(
    id_jours_feries: json["id_jours_feries"],
    description_jour_ferie: json["description_jour_ferie"],
    date_debut_jour_ferie: DateTime.parse(json["date_debut_jour_ferie"]),
    date_fin_jour_ferie: DateTime.parse(json["date_fin_jour_ferie"]),
    lastupdate: DateTime.parse(json["lastupdate"]),
  );
}
