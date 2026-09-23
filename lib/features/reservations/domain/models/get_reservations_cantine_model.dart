import 'dart:convert';

import 'package:inoface/core/database/app_database.dart';

GetReservationsCantineModel getReservationsCantineModelFromJson(String str) =>
    GetReservationsCantineModel.fromJson(json.decode(str));

String getReservationsCantineModelToJson(GetReservationsCantineModel data) => json.encode(data.toJson());

class GetReservationsCantineModel {
  GetReservationsCantineModel({
    this.erreur = true,
    this.message = 'Oops,quelque chose a mal tourné !',
    this.reservationCantine,
  });

  final bool erreur;
  final String message;
  final ReservationCantineMode? reservationCantine;

  factory GetReservationsCantineModel.fromJson(Map<String, dynamic> json) => GetReservationsCantineModel(
        erreur: json["erreur"],
        message: json["message"],
        reservationCantine:
            json["ReservationCantine"] != null ? ReservationCantineMode.fromJson(json["ReservationCantine"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "erreur": erreur,
        "message": message,
        "ReservationCantine": reservationCantine?.toJson(),
      };
}

class ReservationCantineMode extends ReservationsCantine {
  ReservationCantineMode({
    required this.idCantineJournaliere,
    required this.idPersonneParent,
    this.idPersonneEleve,
    this.parentnom,
    this.paiement,
    this.date_cantine,
  }) : super(
          id_cantine_journaliere: idCantineJournaliere,
          id_personne_parent: idPersonneParent,
          id_personne_eleve: idPersonneEleve,
          parentnom: parentnom,
          Paiement: paiement,
          date_cantine: date_cantine,
        );

  int idCantineJournaliere;
  int idPersonneParent;
  int? idPersonneEleve;
  String? parentnom;
  int? paiement;
  DateTime? date_cantine;

  factory ReservationCantineMode.fromJson(Map<String, dynamic> json) => ReservationCantineMode(
        idCantineJournaliere: json["id_cantine_journaliere"],
        idPersonneParent: json["id_personne_parent"],
        idPersonneEleve: json["id_personne_eleve"],
        parentnom: json["parentnom"],
        paiement: json["Paiement"],
        date_cantine: json["date_cantine"] != null ? DateTime.parse(json["date_cantine"]) : null,
      );
}
