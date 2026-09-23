import 'dart:convert';

GetUrlFromQrcodeModel getUrlFromQrcodeModelFromJson(String str) => GetUrlFromQrcodeModel.fromJson(json.decode(str));

String getUrlFromQrcodeModelToJson(GetUrlFromQrcodeModel data) => json.encode(data.toJson());

class GetUrlFromQrcodeModel {
  GetUrlFromQrcodeModel({
    this.erreur = true,
    this.ecolecode,
  });

  bool erreur;
  String? ecolecode;

  factory GetUrlFromQrcodeModel.fromJson(Map<String, dynamic> json) => GetUrlFromQrcodeModel(
        erreur: json["erreur"],
        ecolecode: json["ecolecode"],
      );

  Map<String, dynamic> toJson() => {
        "erreur": erreur,
        "ecolecode": ecolecode,
      };
}
