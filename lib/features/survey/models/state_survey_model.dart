import 'package:get/get.dart';
import 'dart:convert';


StateSurveyModel stateSurveyModelFromJson(String str) => StateSurveyModel.fromJson(json.decode(str));

String stateSurveyModelToJson(StateSurveyModel data) => json.encode(data.toJson());

class StateSurveyModel {
  StateSurveyModel({
    required this.erreur,
    required this.message,
  });

  bool erreur;
  String message;

  factory StateSurveyModel.fromJson(Map<String, dynamic> json) => StateSurveyModel(
    erreur: json["erreur"] ?? true,
    message: json["message"] ?? 'error_server'.tr,
  );

  Map<String, dynamic> toJson() => {
    "erreur": erreur,
    "message": message,
  };
}
