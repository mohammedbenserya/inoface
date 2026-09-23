import 'package:inoface/core/database/app_database.dart';
import 'package:inoface/core/usecases/constants.dart';
import 'dart:convert';


GetPlancantinebyDateModel getPlancantinebyDateModelFromJson(String str) =>
    GetPlancantinebyDateModel.fromJson(json.decode(str));
String getPlancantinebyDateModelToJson(GetPlancantinebyDateModel data) => json.encode(data.toJson());

class GetPlancantinebyDateModel {
  GetPlancantinebyDateModel({
    required this.erreur,
    required this.message,
    this.planCantine,
  });

  bool erreur;
  String message;
  PlanCantineModel? planCantine;

  factory GetPlancantinebyDateModel.fromJson(Map<String, dynamic> json) => GetPlancantinebyDateModel(
        erreur: json["erreur"],
        message: json["message"],
        planCantine: json["PlanCantine"] != null ? PlanCantineModel.fromJson(json["PlanCantine"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "erreur": erreur,
        "message": message,
        "PlanCantine": planCantine?.toJson(),
      };
}

class PlanCantineModel extends PlanCantine {
  PlanCantineModel({
    this.dateCantine,
    required this.idCantineType,
    this.cantineTypeDescription,
    required this.plats,
  }) : super(
          id_cantine_type: idCantineType,
          date_cantine: dateCantine,
          cantine_type_description: cantineTypeDescription,
        );

  DateTime? dateCantine;
  int idCantineType;
  String? cantineTypeDescription;
  List<PlatModel> plats;

  factory PlanCantineModel.fromJson(Map<String, dynamic> json) => PlanCantineModel(
        dateCantine: json["date_cantine"] != null ? DateTime.parse(json["date_cantine"]) : null,
        idCantineType: json["id_cantine_type"],
        cantineTypeDescription: json["cantine_type_description"],
        plats: json["Plats"] != null ? List<PlatModel>.from(json["Plats"].map((x) => PlatModel.fromJson(x))) : [],
      );

  Map<String, dynamic> toJsonModel() => {
        "date_cantine": "${dateCantine?.year.toString().padLeft(4, '0')}-${dateCantine?.month.toString().padLeft(2, '0')}-${dateCantine?.day.toString().padLeft(2, '0')}",
        "id_cantine_type": idCantineType,
        "cantine_type_description": cantineTypeDescription,
        "Plats": List<PlatModel>.from(plats.map((x) => x.toJson())),
      };
}

class PlatModel extends Plat {
  PlatModel({
    this.cantineTypeRepasDescription,
    this.plat,
    required this.position,
    this.idCantineType,
  }) : super(
          id: utilsLogic.createUniqueId(),
          cantine_type_repas_description: cantineTypeRepasDescription,
          plat: plat,
          position: position,
          id_cantine_type: idCantineType,
        );

  String? cantineTypeRepasDescription;
  String? plat;
  int position;
  int? idCantineType;

  factory PlatModel.fromJson(Map<String, dynamic> json) => PlatModel(
        cantineTypeRepasDescription: json["cantine_type_repas_description"],
        plat: json["plat"],
        position: json["position"] ?? 0,
        idCantineType: json["id_cantine_type"],
      );

  Map<String, dynamic> toJsonModel() => {
        "cantine_type_repas_description": cantineTypeRepasDescription,
        "id_cantine_type": idCantineType,
        "position": position,
        "plat": plat,
      };
}
