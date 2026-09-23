// To parse this JSON data, do
//
//     final responsePdfReservationsModel = responsePdfReservationsModelFromJson(jsonString);

import 'dart:convert';

ResponsePdfReservationsModel responsePdfReservationsModelFromJson(String str) =>
    ResponsePdfReservationsModel.fromJson(json.decode(str));

String responsePdfReservationsModelToJson(ResponsePdfReservationsModel data) => json.encode(data.toJson());

class ResponsePdfReservationsModel {
  ResponsePdfReservationsModel({
    this.erreur = false,
    this.message = 'Oops,quelque chose a mal tourné !',
    this.plancantinepdf,
  });

  bool erreur;
  String message;
  String? plancantinepdf;

  factory ResponsePdfReservationsModel.fromJson(Map<String, dynamic> json) => ResponsePdfReservationsModel(
        erreur: json["erreur"],
        message: json["message"],
        plancantinepdf: json["plancantinepdf"],
      );

  Map<String, dynamic> toJson() => {
        "erreur": erreur,
        "message": message,
        "plancantinepdf": plancantinepdf,
      };
}
