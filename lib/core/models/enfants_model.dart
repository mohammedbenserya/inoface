import 'package:inoface/core/database/app_database.dart';
import '../usecases/constants.dart';
import 'dart:convert';



EnfantsModel enfantsModelFromJson(String str) => EnfantsModel.fromJson(json.decode(str));
String enfantsModelToJson(EnfantsModel data) => json.encode(data.toJson());

class EnfantsModel {
  EnfantsModel({
    this.erreur = true,
    this.recuperation_enfant_option = false,
    required this.message,
    required this.enfants,
  });

  bool erreur;
  bool recuperation_enfant_option;
  String message;
  List<EnfantModel> enfants;

  factory EnfantsModel.fromJson(Map<String, dynamic> json) => EnfantsModel(
        erreur: json["erreur"] ?? true,
        message: json["message"],
        recuperation_enfant_option: json["recuperation_enfant_option"],
        enfants: json["Enfants"] != null ? List<EnfantModel>.from(json["Enfants"].map((x) => EnfantModel.fromJson(x))) : [],
      );

  Map<String, dynamic> toJson() => {
        "erreur": erreur,
        "message": message,
        "recuperation_enfant_option": recuperation_enfant_option,
        "Enfants": List<dynamic>.from(enfants.map((x) => x.toJson())),
      };
}

class EnfantModel extends Enfant {
  List<EmploitempModel> emploitemps;

  EnfantModel({
    required int id_personne,
    required String nom,
    required String prenom,
    String? nom_arabe,
    String? prenom_arabe,
    required String identifiant,
    String? cin,
    String? gsm,
    String? email,
    String? genre,
    String? token,
    required String niveau,
    required String classe,
    String? photo,
    required bool has_agenda,
    required bool has_devoir,
    bool? has_ControlesNotes,
    bool? has_cantine,
    String? emploitempspdf,
    required this.emploitemps,
  }) : super(
          id_personne: id_personne,
          nom: nom,
          prenom: prenom,
          nom_arabe: nom_arabe,
          prenom_arabe: prenom_arabe,
          identifiant: identifiant,
          cin: cin,
          gsm: gsm,
          email: email,
          genre: genre,
          token: token,
          niveau: niveau,
          classe: classe,
          photo: photo,
          has_agenda: has_agenda,
          has_devoir: has_devoir,
          has_cantine: has_cantine,
          has_ControlesNotes: has_ControlesNotes,
          emploitempspdf: emploitempspdf,
        );

  factory EnfantModel.fromJson(Map<String, dynamic> json) => EnfantModel(
        id_personne: json["id_personne"],
        nom: json["nom"],
        prenom: json["prenom"],
        nom_arabe: json["nom_arabe"],
        prenom_arabe: json["prenom_arabe"],
        identifiant: json["identifiant"],
        cin: json["cin"],
        gsm: json["gsm"],
        email: json["email"],
        genre: json["genre"],
        token: json["token"],
        niveau: json["niveau"],
        classe: json["classe"],
        photo: json["photo"],
        has_agenda: json["has_agenda"],
        has_devoir: json["has_devoir"],
        has_cantine: json["has_cantine"] ?? false,
        has_ControlesNotes: json["has_ControlesNotes"] ?? false,
        emploitempspdf: json["emploitempspdf"],
        emploitemps: json["Emploitemps"] != null ? List<EmploitempModel>.from(json["Emploitemps"].map((x) => EmploitempModel.fromJson(x))) : [],
      );
}

// ---------------------------------

class EmploitempModel extends Emploitemp {
  EmploitempModel({
    // this.id,
    required this.idJour,
    required this.id_personne_eleve,
    required this.jour,
    required this.seances,
  }) : super(id: utilsLogic.createUniqueId(), id_jour: idJour, Jour: jour, id_personne_eleve: id_personne_eleve);

  // int? id;
  int idJour;
  int id_personne_eleve;
  String jour;
  List<SeanceModel> seances;

  factory EmploitempModel.fromJson(Map<String, dynamic> json) => EmploitempModel(
        // id: Uuid().v4(),
        idJour: json["id_jour"],
        jour: json["Jour"],
        id_personne_eleve: json["id_personne_eleve"],
        seances: json["Seances"] != null ? List<SeanceModel>.from(json["Seances"].map((x) => SeanceModel.fromJson(x))) : [],
      );
}

class SeanceModel extends Seance {

  SeanceModel({
    required this.idJour,
    required this.id_personne_eleve,
    required this.horaireDebut,
    required this.horaireFin,
    required this.horaireTranchesType,
    this.matiere,
    required this.salle,
    this.enseignant,
  }) : super(
          id: utilsLogic.createUniqueId(),
          id_jour: idJour,
          id_personne_eleve: id_personne_eleve,
          horaire_debut: horaireDebut,
          horaire_fin: horaireFin,
          horaire_tranches_type: horaireTranchesType,
          matiere: matiere,
          salle: salle,
        );

  int idJour;
  int id_personne_eleve;
  String horaireDebut;
  String horaireFin;
  String horaireTranchesType;
  String? matiere;
  String? salle;
  EnseignantModel? enseignant;

  factory SeanceModel.fromJson(Map<String, dynamic> json) => SeanceModel(
        idJour: json["id_jour"],
        id_personne_eleve: json["id_personne_eleve"],
        horaireDebut: json["horaire_debut"],
        horaireFin: json["horaire_fin"],
        horaireTranchesType: json["horaire_tranches_type"],
        matiere: json["matiere"],
        salle: json["salle"],
        enseignant: json["Enseignant"] == null ? null : EnseignantModel.fromJson(json["Enseignant"]),
      );
}

class EnseignantModel extends Enseignant {
  EnseignantModel({
    required this.idPersonne,
    required this.nom,
    required this.prenom,
    required this.idJour,
  }) : super(
          id: utilsLogic.createUniqueId(),
          id_personne: idPersonne,
          nom: nom,
          prenom: prenom,
          id_jour: idJour,
        );

  int idPersonne;
  String nom;
  String prenom;
  int idJour;

  factory EnseignantModel.fromJson(Map<String, dynamic> json) => EnseignantModel(
        idPersonne: json["id_personne"],
        nom: json["nom"],
        prenom: json["prenom"],
        idJour: json["id_jour"],
      );
}
