import 'package:inoface/core/database/app_database.dart';
import '../../../core/usecases/constants.dart';
import 'dart:convert';


AgendaDatesModel agendaDatesModelFromJson(String str) => AgendaDatesModel.fromJson(json.decode(str));
String agendaDatesModelToJson(AgendaDatesModel data) => json.encode(data.toJson());

class AgendaDatesModel {
  bool erreur;
  String message;
  List<Agendas> agendas;

  AgendaDatesModel({
    this.erreur = true,
    required this.message,
    required this.agendas,
  });

  factory AgendaDatesModel.fromJson(Map<String, dynamic> json) => AgendaDatesModel(
        erreur: json["erreur"],
        message: json["message"],
        agendas: json["Agendas"] != null ? List<Agendas>.from(json["Agendas"].map((x) => Agendas.fromJson(x))) : [],
      );

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["erreur"] = erreur;
    map["message"] = message;
    map["Agendas"] = agendas.map((v) => v.toJson()).toList();
    return map;
  }
}


class Agendas extends AgendaDate {
  final int id;
  DateTime? dateAgenda;
  bool hasPhoto;
  int nbrPhoto;

  Agendas({
    required this.id,
    this.dateAgenda,
    required this.hasPhoto,
    required this.nbrPhoto,
  }) : super(
    id: id,
    date_agenda: dateAgenda,
    has_photo: hasPhoto,
    nbr_photo: nbrPhoto
  );

  factory Agendas.fromJson(Map<String, dynamic> json) => Agendas(
        id: utilsLogic.createUniqueId(),
        dateAgenda: DateTime.parse(json["date_agenda"]),
        hasPhoto: json["has_photo"] ?? false,
        nbrPhoto: json["nbr_photo"] ?? 0,
      );
}
