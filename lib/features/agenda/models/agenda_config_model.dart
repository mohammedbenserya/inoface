import 'package:inoface/core/database/app_database.dart';
import 'dart:convert';


AgendaConfigModel agendaConfigModelFromJson(String str) => AgendaConfigModel.fromJson(json.decode(str));
String agendaConfigModelToJson(AgendaConfigModel data) => json.encode(data.toJson());

class AgendaConfigModel {
  AgendaConfigModel({
    required this.erreur,
    required this.message,
    required this.lastupdate,
    required this.agendaTypesPrestations,
    required this.agendaTypes,
  });

  bool erreur;
  String message;
  DateTime lastupdate;
  List<AgendaTypesPrestationModel> agendaTypesPrestations;
  List<AgendaTypeModel> agendaTypes;

  factory AgendaConfigModel.fromJson(Map<String, dynamic> json) => AgendaConfigModel(
    erreur: json["erreur"],
    message: json["message"],
    lastupdate: DateTime.parse(json["lastupdate"]),
    agendaTypesPrestations: json["Agenda_types_prestations"] != null ?
    List<AgendaTypesPrestationModel>.from(json["Agenda_types_prestations"].map((x) => AgendaTypesPrestationModel.fromJson(x))) : [],
    agendaTypes: json["Agenda_types"] != null ?
    List<AgendaTypeModel>.from(json["Agenda_types"].map((x) => AgendaTypeModel.fromJson(x))) : [],
  );

  Map<String, dynamic> toJson() => {
    "erreur": erreur,
    "message": message,
    "lastupdate": lastupdate.toIso8601String(),
    "Agenda_types_prestations": List<dynamic>.from(agendaTypesPrestations.map((x) => x.toJson())),
    "Agenda_types": List<dynamic>.from(agendaTypes.map((x) => x.toJson())),
  };
}

class AgendaTypeModel extends AgendaType {
  AgendaTypeModel({
    required this.idAgendaType,
    required this.description,
    required this.agendaJourneeTypeDescription,
    required this.idAgendaTypesPrestation,
    required this.lienImage,
    required this.agendaTypeDetails,
  }) : super(
    id_agenda_type: idAgendaType,
    description: description,
    lien_image: lienImage,
    agenda_journee_type_description: agendaJourneeTypeDescription,
    id_agenda_types_prestation: idAgendaTypesPrestation,
  );

  int idAgendaType;
  String description;
  String agendaJourneeTypeDescription;
  int idAgendaTypesPrestation;
  String lienImage;
  List<AgendaTypeDetailModel> agendaTypeDetails;

  factory AgendaTypeModel.fromJson(Map<String, dynamic> json) => AgendaTypeModel(
    idAgendaType: json["id_agenda_type"],
    description: json["description"],
    agendaJourneeTypeDescription: json["agenda_journee_type_description"],
    idAgendaTypesPrestation: json["id_agenda_types_prestation"],
    lienImage: json["lien_image"],
    agendaTypeDetails: json["Agenda_type_details"] != null ?
    List<AgendaTypeDetailModel>.from(json["Agenda_type_details"].map((x) => AgendaTypeDetailModel.fromJson(x))) : [],
  );

  Map<String, dynamic> toJsonModel() => {
    "id_agenda_type": idAgendaType,
    "description": description,
    "agenda_journee_type_description": agendaJourneeTypeDescription,
    "id_agenda_types_prestation": idAgendaTypesPrestation,
    "lien_image": lienImage,
    "Agenda_type_details": List<dynamic>.from(agendaTypeDetails.map((x) => x.toJson())),
  };
}

class AgendaTypeDetailModel extends AgendaTypesDetail {
  AgendaTypeDetailModel({
    required this.idAgendaTypeDetail,
    required this.idAgendaType,
    required this.description,
    required this.lienImage,
    required this.position,
    required this.facturable,
  }) : super(
    id_agenda_type_detail: idAgendaTypeDetail,
    id_agenda_type: idAgendaType,
    description: description,
    lien_image: lienImage,
    position: position,
    facturable: facturable,
  );

  int idAgendaTypeDetail;
  int idAgendaType;
  String description;
  String lienImage;
  int position;
  int facturable;

  factory AgendaTypeDetailModel.fromJson(Map<String, dynamic> json) => AgendaTypeDetailModel(
    idAgendaTypeDetail: json["id_agenda_type_detail"],
    idAgendaType: json["id_agenda_type"],
    description: json["description"],
    lienImage: json["lien_image"],
    position: json["position"],
    facturable: json["facturable"],
  );

  Map<String, dynamic> toJsonModel() => {
    "id_agenda_type_detail": idAgendaTypeDetail,
    "id_agenda_type": idAgendaType,
    "description": description,
    "lien_image": lienImage,
    "position": position,
    "facturable": facturable,
  };
}

class AgendaTypesPrestationModel extends AgendaTypesPrestation {
  AgendaTypesPrestationModel({
    required this.idAgendaType,
    required this.description,
  }) : super(
    id_agenda_types_prestation: idAgendaType,
    description: description,
  );

  int idAgendaType;
  String description;

  factory AgendaTypesPrestationModel.fromJson(Map<String, dynamic> json) => AgendaTypesPrestationModel(
    idAgendaType: json["id_agenda_type"],
    description: json["description"],
  );

  Map<String, dynamic> toJsonModel() => {
    "id_agenda_type": idAgendaType,
    "description": description,
  };
}


/*
AgendaConfigModel agendaConfigModelFromJson(String str) => AgendaConfigModel.fromJson(json.decode(str));

class AgendaConfigModel {

  AgendaConfigModel({
    this.erreur = true,
    this.message = '',
    required this.lastupdate,
    required this.agendaTypesPrestations,
    required this.agendaTypes,
  });

  bool erreur;
  String message;
  DateTime lastupdate;
  List<AgendaTypesPrestationModel> agendaTypesPrestations;
  List<AgendaTypeModel> agendaTypes;

  factory AgendaConfigModel.fromJson(Map<String, dynamic> json) => AgendaConfigModel(
        erreur: json["erreur"],
        message: json["message"],
        lastupdate: DateTime.parse(json["lastupdate"]),
        agendaTypesPrestations: json["Agenda_types_prestations"] != null ?
        List<AgendaTypesPrestationModel>.from(json["Agenda_types_prestations"].map((x) =>
            AgendaTypesPrestationModel.fromJson(x))) : [],

        agendaTypes: json["Agenda_types"] != null ?
        List<AgendaTypeModel>.from(json["Agenda_types"].map((x) =>
            AgendaTypeModel.fromJson(x))) : [],
      );
}

class AgendaTypeModel extends AgendaType {
  List<AgendaTypeDetailModel> Agenda_type_details;

  AgendaTypeModel({
    required int id_agenda_type,
    required String description,
    required String lien_image,
    required String agenda_journee_type_description,
    required int id_agenda_types_prestation,
    required this.Agenda_type_details,
  }) : super(
          id_agenda_type: id_agenda_type,
          description: description,
          lien_image: lien_image,
          agenda_journee_type_description: agenda_journee_type_description,
          id_agenda_types_prestation: id_agenda_types_prestation,
        );

  factory AgendaTypeModel.fromJson(Map<String, dynamic> json) => AgendaTypeModel(
        id_agenda_type: json["id_agenda_type"],
        description: json["description"],
        lien_image: json["lien_image"],
        agenda_journee_type_description: json["agenda_journee_type_description"],
        id_agenda_types_prestation: json["id_agenda_types_prestation"],
        Agenda_type_details: json["Agenda_type_details"] != null
            ? List<AgendaTypeDetailModel>.from(
                json["Agenda_type_details"].map((x) => AgendaTypeDetailModel.fromJson(x)))
            : [],
      );
}

 */