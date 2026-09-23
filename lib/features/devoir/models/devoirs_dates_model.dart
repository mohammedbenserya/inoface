// To parse this JSON data, do
//
//     final devoirsDatesModel = devoirsDatesModelFromJson(jsonString);

import 'dart:convert';

DevoirsDatesModel devoirsDatesModelFromJson(String str) => DevoirsDatesModel.fromJson(json.decode(str));

String devoirsDatesModelToJson(DevoirsDatesModel data) => json.encode(data.toJson());

class DevoirsDatesModel {
  DevoirsDatesModel({
    required this.erreur,
    required this.message,
    required this.dates,
  });

  bool erreur;
  String message;
  List<Date> dates;

  factory DevoirsDatesModel.fromJson(Map<String, dynamic> json) => DevoirsDatesModel(
    erreur: json["erreur"],
    message: json["message"],
    dates: List<Date>.from(json["Dates"].map((x) => Date.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "erreur": erreur,
    "message": message,
    "Dates": List<dynamic>.from(dates.map((x) => x.toJson())),
  };
}

class Date {
  Date({
    required this.dateDuDevoir,
  });

  DateTime dateDuDevoir;

  factory Date.fromJson(Map<String, dynamic> json) => Date(
    dateDuDevoir: DateTime.parse(json["date_du_devoir"]),
  );

  Map<String, dynamic> toJson() => {
    "date_du_devoir": "${dateDuDevoir.year.toString().padLeft(4, '0')}-${dateDuDevoir.month.toString().padLeft(2, '0')}-${dateDuDevoir.day.toString().padLeft(2, '0')}",
  };
}
