import 'package:inoface/core/database/app_database.dart';
import 'package:equatable/equatable.dart';
import 'dart:convert';


AgendaModel agendaModelFromJson(String str) => AgendaModel.fromJson(json.decode(str));


class AgendaModel extends Equatable {
  AgendaModel({
    this.erreur = true,
    required this.message,
    required this.agendas,
  });

  bool erreur;
  String message;
  List<AgendaMod> agendas = [];

  factory AgendaModel.fromJson(Map<String, dynamic> json) => AgendaModel(
        erreur: json["erreur"],
        message: json["message"],
        agendas: json["Agendas"] != null ? List<AgendaMod>.from(json["Agendas"].map((x) => AgendaMod.fromJson(x))) : [],
      );

  @override
  List<Object> get props => [erreur, message, agendas];
}

class AgendaMod extends Agenda {
  PersonneEnseignantModel? personneEnseignant;
  List<AgendaPhotoDetailModel> agendaPhotoDetails = [];
  List<AgendaNoteMod> agendaNotes = [];
  List<AgendaDetailModel> agendaDetails = [];

  AgendaMod({
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

  factory AgendaMod.fromJson(Map<String, dynamic> json) => AgendaMod(
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
            ? List<AgendaNoteMod>.from(json["Agenda_notes"].map((x) => AgendaNoteMod.fromJson(x)))
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
        position: json["position"],
        agendaRetard: json["agenda_retard"] != null ? DateTime.parse(json["agenda_retard"]) : null,
      );
}

class AgendaNoteMod extends AgendaNote {
  PersonneNoteModel? personneNote;

  AgendaNoteMod({
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

  factory AgendaNoteMod.fromJson(Map<String, dynamic> json) => AgendaNoteMod(
        idAgendaNote: json["id_agenda_note"],
        note: json["note"],
        dateAgendaNote: DateTime.parse(json["date_agenda_note"]),
        idAgenda: json["id_agenda"],
        personneNote: json["PersonneNote"] != null ? PersonneNoteModel.fromJson(json["PersonneNote"]) : null,
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
        idPersonne: json["id_personne"],
        nom: json["nom"],
        prenom: json["prenom"],
        idAgenda: json["id_agenda"],
      );
}

class AgendaPhotoDetailModel extends AgendaPhotoDetail {
  AgendaPhotoDetailModel({
    required this.idAgendaPhotoDetail,
    this.nomOriginalPhoto,
    this.lieuPhoto,
    this.position,
    this.idAgenda,
    this.id_personne,
  }) : super(
          id_agenda_photo_detail: idAgendaPhotoDetail,
          nom_original_photo: nomOriginalPhoto,
          lieu_photo: lieuPhoto,
          position: position,
          id_agenda: idAgenda,
          id_personne: id_personne,
        );

  int idAgendaPhotoDetail;
  String? nomOriginalPhoto;
  String? lieuPhoto;
  int? position;
  int? idAgenda;
  int? id_personne;

  factory AgendaPhotoDetailModel.fromJson(Map<String, dynamic> json) => AgendaPhotoDetailModel(
        idAgendaPhotoDetail: json["id_agenda_photo_detail"],
        nomOriginalPhoto: json["nom_original_photo"],
        lieuPhoto: json["lieu_photo"],
        position: json["position"] ?? 0,
        idAgenda: json["id_agenda"],
        id_personne: json["id_personne"],
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
