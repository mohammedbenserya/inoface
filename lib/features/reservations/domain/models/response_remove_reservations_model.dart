// To parse this JSON data, do
//
//     final responseRemoveReservationsModel = responseRemoveReservationsModelFromJson(jsonString);

import 'dart:convert';

ResponseRemoveReservationsModel responseRemoveReservationsModelFromJson(String str) => ResponseRemoveReservationsModel.fromJson(json.decode(str));

String responseRemoveReservationsModelToJson(ResponseRemoveReservationsModel data) => json.encode(data.toJson());

class ResponseRemoveReservationsModel {
  ResponseRemoveReservationsModel({
    this.erreur = true,
    this.message = 'Oops,quelque chose a mal tourné !',
  });

  bool erreur;
  String message;

  factory ResponseRemoveReservationsModel.fromJson(Map<String, dynamic> json) => ResponseRemoveReservationsModel(
    erreur: json["erreur"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "erreur": erreur,
    "message": message,
  };
}
