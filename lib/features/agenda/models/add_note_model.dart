import 'package:inoface/core/database/app_database.dart';
import 'dart:convert';


AddNoteModel addNoteModelFromJson(String str) => AddNoteModel.fromJson(json.decode(str));
String addNoteModelToJson(AddNoteModel data) => json.encode(data.toJson());

class AddNoteModel {
  AddNoteModel({
    this.erreur = true,
    this.agendaNote,
    required this.message,
  });

  bool erreur;
  AddAgendaNote? agendaNote;
  String message;

  factory AddNoteModel.fromJson(Map<String, dynamic> json) => AddNoteModel(
        erreur: json["erreur"],
        agendaNote: json["add_agenda_note"] != null ? AddAgendaNote.fromJson(json["add_agenda_note"]) : null,
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "erreur": erreur,
        "agenda_note": agendaNote?.toJson(),
        "message": message,
      };
}

class AddAgendaNote extends AddNote {
  AddAgendaNote({
    required int idAgendaNote,
    required int idAgenda,
    required int idPersonne,
    required String note,
    required int idAgendaStatut,
    DateTime? dateAgendaNote,
  }) : super(
          id_agenda_note: idAgendaNote,
          id_agenda: idAgenda,
          id_personne: idPersonne,
          note: note,
          id_agenda_statut: idAgendaStatut,
          date_agenda_note: dateAgendaNote,
        );

  factory AddAgendaNote.fromJson(Map<String, dynamic> json) => AddAgendaNote(
        idAgendaNote: json["id_agenda_note"],
        idAgenda: json["id_agenda"],
        idPersonne: json["id_personne"],
        note: json["note"],
        idAgendaStatut: json["id_agenda_statut"],
        dateAgendaNote: json["date_agenda_note"] != null ? DateTime.parse(json["date_agenda_note"]) : null,
      );
}
