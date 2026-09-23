import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:inoface/core/database/app_database.dart';

AgendaModelById agendaModelByIdFromJson(String str) => AgendaModelById.fromJson(json.decode(str));

class AgendaModelById extends Equatable {
  const AgendaModelById({
    this.erreur = true,
    required this.message,
    this.agendas,
  });

  final bool erreur;
  final String message;
  final AgendaModById? agendas;

  factory AgendaModelById.fromJson(Map<String, dynamic> json) => AgendaModelById(
        erreur: json["erreur"],
        message: json["message"],
        agendas: json["Agenda"] != null ? AgendaModById.fromJson(json["Agenda"]) : null,
      );

  @override
  List<Object?> get props => [erreur, message, agendas];
}

class AgendaModById extends Agenda {
  PersonneEnseignantModel? personneEnseignant;
  List<AgendaPhotoDetailModel> agendaPhotoDetails;
  List<AgendaNoteModel> agendaNotes;
  List<AgendaDetailModel> agendaDetails;

  AgendaModById({
    required int idAgenda,
    required DateTime dateAgenda,
    String? agendaJourneeTypeDescription,
    int? idPersonne,
    this.personneEnseignant,
    required this.agendaPhotoDetails,
    required this.agendaNotes,
    required this.agendaDetails,
  }) : super(
          id_agenda: idAgenda,
          date_agenda: dateAgenda,
          agenda_journee_type_description: agendaJourneeTypeDescription,
          id_personne: idPersonne,
        );

  factory AgendaModById.fromJson(Map<String, dynamic> json) => AgendaModById(
        idAgenda: json["id_agenda"],
        dateAgenda: DateTime.parse(json["date_agenda"]),
        agendaJourneeTypeDescription: json["agenda_journee_type_description"],
        idPersonne: json["id_personne"],
        personneEnseignant:
            json["PersonneEnseignant"] != null ? PersonneEnseignantModel.fromJson(json["PersonneEnseignant"]) : null,
        agendaPhotoDetails: json["Agenda_photo_details"] != null
            ? List<AgendaPhotoDetailModel>.from(
                json["Agenda_photo_details"].map((x) => AgendaPhotoDetailModel.fromJson(x)))
            : [],
        agendaNotes: json["Agenda_notes"] != null
            ? List<AgendaNoteModel>.from(json["Agenda_notes"].map((x) => AgendaNoteModel.fromJson(x)))
            : [],
        agendaDetails: json["Agenda_details"] != null
            ? List<AgendaDetailModel>.from(json["Agenda_details"].map((x) => AgendaDetailModel.fromJson(x)))
            : [],
      );
}

class AgendaDetailModel extends AgendaDetail {
  AgendaDetailModel({
    required int idAgendaDetail,
    required int idAgenda,
    required int idAgendaTypeDetail,
    required int position,
    DateTime? agendaRetard,
  }) : super(
          id_agenda_detail: idAgendaDetail,
          id_agenda: idAgenda,
          id_agenda_type_detail: idAgendaTypeDetail,
          agenda_retard: agendaRetard,
          position: position,
        );

  factory AgendaDetailModel.fromJson(Map<String, dynamic> json) => AgendaDetailModel(
        idAgendaDetail: json["id_agenda_detail"],
        idAgenda: json["id_agenda"],
        idAgendaTypeDetail: json["id_agenda_type_detail"],
        position: json["position"] ?? 0,
        agendaRetard: json["agenda_retard"] != null ? DateTime.parse(json["agenda_retard"]) : null,
      );
}

class AgendaNoteModel extends AgendaNote {
  PersonneNoteModel? personneNote;

  AgendaNoteModel({
    required int idAgendaNote,
    required String note,
    required DateTime dateAgendaNote,
    required int idAgenda,
    this.personneNote,
  }) : super(
          id_agenda_note: idAgendaNote,
          note: note,
          date_agenda_note: dateAgendaNote,
          id_agenda: idAgenda,
        );

  factory AgendaNoteModel.fromJson(Map<String, dynamic> json) => AgendaNoteModel(
        idAgendaNote: json["id_agenda_note"],
        note: json["note"],
        dateAgendaNote: DateTime.parse(json["date_agenda_note"]),
        idAgenda: json["id_agenda"],
        personneNote: json["PersonneNote"] != null ?
        PersonneNoteModel.fromJson(json["PersonneNote"]) : null,
      );
}

class PersonneEnseignantModel extends PersonneEnseignant {
  PersonneEnseignantModel({
    required int idPersonne,
    String? nom,
    String? prenom,
    int? idAgenda,
  }) : super(
          id_personne: idPersonne,
          nom: nom,
          prenom: prenom,
          id_agenda: idAgenda,
        );

  factory PersonneEnseignantModel.fromJson(Map<String, dynamic> json) => PersonneEnseignantModel(
      idPersonne: json["id_personne"], nom: json["nom"], prenom: json["prenom"], idAgenda: json["id_agenda"]);
}

class AgendaPhotoDetailModel extends AgendaPhotoDetail {
  AgendaPhotoDetailModel({
    required this.idAgendaPhotoDetail,
    this.nomOriginalPhoto,
    this.lieuPhoto,
    this.position,
    this.idAgenda,
  }) : super(
          id_agenda_photo_detail: idAgendaPhotoDetail,
          nom_original_photo: nomOriginalPhoto,
          lieu_photo: lieuPhoto,
          position: position,
          id_agenda: idAgenda,
        );

  int idAgendaPhotoDetail;
  String? nomOriginalPhoto;
  String? lieuPhoto;
  int? position;
  int? idAgenda;

  factory AgendaPhotoDetailModel.fromJson(Map<String, dynamic> json) => AgendaPhotoDetailModel(
        idAgendaPhotoDetail: json["id_agenda_photo_detail"],
        nomOriginalPhoto: json["nom_original_photo"],
        lieuPhoto: json["lieu_photo"],
        position: json["position"],
        idAgenda: json["id_agenda"],
      );
}

class PersonneNoteModel extends PersonneNote {
  PersonneNoteModel({
    required int id_personne,
    String? nom,
    String? prenom,
    int? id_agenda_note,
  }) : super(
          id_personne: id_personne,
          nom: nom,
          prenom: prenom,
          id_agenda_note: id_agenda_note,
        );

  factory PersonneNoteModel.fromJson(Map<String, dynamic> json) => PersonneNoteModel(
        id_personne: json["id_personne"],
        nom: json["nom"],
        prenom: json["prenom"],
        id_agenda_note: json["id_agenda_note"],
      );
}
