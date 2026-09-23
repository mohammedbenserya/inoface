import 'dart:convert';

import 'package:inoface/core/database/app_database.dart';

ReservationsCantineDatesModel reservationsCantineDatesModelFromJson(String str) =>
    ReservationsCantineDatesModel.fromJson(json.decode(str));
String reservationsCantineDatesModelToJson(ReservationsCantineDatesModel data) => json.encode(data.toJson());

class ReservationsCantineDatesModel {
  ReservationsCantineDatesModel({
    this.erreur = false,
    this.message = 'Oops,quelque chose a mal tourné !',
    required this.reservationsDates,
  });

  bool erreur;
  String message;
  List<ReservationsDate> reservationsDates;

  factory ReservationsCantineDatesModel.fromJson(Map<String, dynamic> json) => ReservationsCantineDatesModel(
        erreur: json["erreur"],
        message: json["message"],
        reservationsDates: json["ReservationsDates"] != null
            ? List<ReservationsDate>.from(json["ReservationsDates"].map((x) => ReservationsDate.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "erreur": erreur,
        "message": message,
        "ReservationsDates": List<dynamic>.from(reservationsDates.map((x) => x.toJson())),
      };
}

class ReservationsDate extends ReservationsCantineDate {
  ReservationsDate({
    required this.dateCantine,
  }) : super(
          date_cantine: dateCantine,
        );

  DateTime dateCantine;

  factory ReservationsDate.fromJson(Map<String, dynamic> json) => ReservationsDate(
        dateCantine: DateTime.parse(json["date_cantine"]),
      );
}
