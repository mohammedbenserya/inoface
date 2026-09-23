import 'package:inoface/features/login/entities/login_entity.dart';
import 'package:inoface/core/database/app_database.dart';
import 'package:get/get.dart';
import 'dart:convert';



LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

class LoginModel extends LoginEntity {
  PersonneModel? personneModel;

  LoginModel({
    required bool erreur,
    required String message,
    String? motdepasse,
    String? ecolename,
    this.personneModel,
  }) : super(
          erreur: erreur,
          message: message,
          motdepasse: motdepasse,
          personne: personneModel,
          ecolename: ecolename,
        );

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        erreur: json["erreur"] ?? true,
        message: json["message"] ?? 'error_server'.tr,
        motdepasse: json["motdepasse"],
        personneModel: json["Personne"] != null ? PersonneModel.fromJson(json["Personne"]) : null,
        ecolename: json["ecolename"],
      );
}

class PersonneModel extends Personne {
  List<RoleModel> roles;

  PersonneModel({
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
    String? ecolecode,
    required this.roles,
  }) : super(
          id_personne: id_personne,
          nom: nom,
          prenom: prenom,
          nom_arabe: nom_arabe,
          prenom_arabe: prenom_arabe,
          identifiant: identifiant,
          cin: cin,
          gsm: genre,
          email: email,
          genre: genre,
          token: token,
          ecolecode: ecolecode,
        );

  factory PersonneModel.fromJson(Map<String, dynamic> json) => PersonneModel(
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
        ecolecode: json["ecolecode"],
        roles: json["Roles"] != null ? List<RoleModel>.from(json["Roles"].map((x) => RoleModel.fromJson(x))) : [],
      );
}

class RoleModel extends Role {

  RoleModel({
    required int id_role,
    String? role_description,
    int? default_role,
    int? id_personne,
  }) : super(
          id_role: id_role,
          role_description: role_description,
          default_role: default_role,
          id_personne: id_personne,
        );

  factory RoleModel.fromJson(Map<String, dynamic> json) => RoleModel(
        id_role: json["id_role"],
        role_description: json["role_description"],
        default_role: json["default_role"],
        id_personne: json["id_personne"],
      );
}
