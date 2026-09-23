import 'dart:convert';

RemoveDemandeModel removeDemandeModelFromJson(String str) => RemoveDemandeModel.fromJson(json.decode(str));

String removeDemandeModelToJson(RemoveDemandeModel data) => json.encode(data.toJson());

class RemoveDemandeModel {
  RemoveDemandeModel({
    this.erreur = true,
    required this.message,
  });

  bool erreur;
  String message;

  factory RemoveDemandeModel.fromJson(Map<String, dynamic> json) => RemoveDemandeModel(
    erreur: json["erreur"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "erreur": erreur,
    "message": message,
  };
}
