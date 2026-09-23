import 'dart:convert';

NotesModel notesModelFromJson(String str) => NotesModel.fromJson(json.decode(str));
String notesModelToJson(NotesModel data) => json.encode(data.toJson());


class NotesModel {
  NotesModel({
    required this.erreur,
    required this.message,
    required this.controlesNotes,
  });

  bool erreur;
  String message;
  List<ControlesNote> controlesNotes;

  factory NotesModel.fromJson(Map<String, dynamic> json) => NotesModel(
    erreur: json["erreur"],
    message: json["message"],
    controlesNotes: json["ControlesNotes"] != null ? List<ControlesNote>.from(json["ControlesNotes"].map((x) => ControlesNote.fromJson(x))) : [],
  );

  Map<String, dynamic> toJson() => {
    "erreur": erreur,
    "message": message,
    "ControlesNotes": List<dynamic>.from(controlesNotes.map((x) => x.toJson())),
  };
}

class ControlesNote {
  ControlesNote({
    required this.idSemestre,
    required this.semestreDescription,
    required this.controles,
    required this.idPersonneEleve,
  });

  int idSemestre;
  String semestreDescription;
  List<Controle> controles;
  int idPersonneEleve;

  factory ControlesNote.fromJson(Map<String, dynamic> json) => ControlesNote(
    idSemestre: json["id_semestre"],
    semestreDescription: json["semestre_description"],
    controles: json["Controles"] != null ? List<Controle>.from(json["Controles"].map((x) => Controle.fromJson(x))) : [],
    idPersonneEleve: json["id_personne_eleve"],
  );

  Map<String, dynamic> toJson() => {
    "id_semestre": idSemestre,
    "semestre_description": semestreDescription,
    "Controles": List<dynamic>.from(controles.map((x) => x.toJson())),
    "id_personne_eleve": idPersonneEleve,
  };
}

class Controle {
  Controle({
    required this.idSemestreControle,
    required this.controleDescription,
    required this.notes,
    required this.idSemestre,
  });

  int idSemestreControle;
  String controleDescription;
  List<Note> notes;
  int idSemestre;

  factory Controle.fromJson(Map<String, dynamic> json) => Controle(
    idSemestreControle: json["id_semestre_controle"],
    controleDescription: json["controle_description"],
    notes: json["Notes"] != null ? List<Note>.from(json["Notes"].map((x) => Note.fromJson(x))) : [],
    idSemestre: json["id_semestre"],
  );

  Map<String, dynamic> toJson() => {
    "id_semestre_controle": idSemestreControle,
    "controle_description": controleDescription,
    "Notes": List<dynamic>.from(notes.map((x) => x.toJson())),
    "id_semestre": idSemestre,
  };
}

class Note {
  Note({
    required this.idControleNote,
    required this.matiereDescription,
    required this.note,
    required this.idSemestreControle,
  });

  int idControleNote;
  String matiereDescription;
  String note;
  int idSemestreControle;

  factory Note.fromJson(Map<String, dynamic> json) => Note(
    idControleNote: json["id_controle_note"],
    matiereDescription: json["matiere_description"],
    note: json["note"],
    idSemestreControle: json["id_semestre_controle"],
  );

  Map<String, dynamic> toJson() => {
    "id_controle_note": idControleNote,
    "matiere_description": matiereDescription,
    "note": note,
    "id_semestre_controle": idSemestreControle,
  };
}
