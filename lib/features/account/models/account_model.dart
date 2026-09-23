import 'package:hive/hive.dart';
import 'dart:convert';

part 'account_model.g.dart';

AccountModel accountFromJson(String str) => AccountModel.fromJson(json.decode(str));
String accountToJson(AccountModel data) => json.encode(data.toJson());

@HiveType(typeId: 0)
class AccountModel extends HiveObject {

  @HiveField(0)
  String identifiant;

  @HiveField(1)
  String motdepasse;

  @HiveField(2)
  String? tokenmobile;

  @HiveField(3)
  String? codeSchool;

  @HiveField(4)
  String? nameSchool;

  AccountModel({
    required this.identifiant,
    required this.motdepasse,
    this.tokenmobile,
    this.codeSchool,
    this.nameSchool,
  });

  Future<void> deleteModel(AccountModel account) async {
    await account.delete();
  }

  factory AccountModel.fromJson(Map<String, dynamic> json) => AccountModel(
    identifiant: json["identifiant"],
    motdepasse: json["motdepasse"],
    tokenmobile: json["tokenmobile"],
    codeSchool: json["codeSchool"],
    nameSchool: json["nameSchool"],
  );

  String modelToString() {
    var body = {
      'identifiant': identifiant.replaceAll(' ', ''),
      'motdepasse': motdepasse.replaceAll(' ', ''),
      'tokenmobile': tokenmobile?.replaceAll(' ', ''),
      'codeSchool': codeSchool?.replaceAll(' ', ''),
      'nameSchool': nameSchool?.replaceAll(' ', ''),
    };
    return json.encode(body);
  }

  Map<String, dynamic> toJson() {
    return {
      'identifiant': identifiant,
      'motdepasse': motdepasse,
      'tokenmobile': tokenmobile,
      'codeSchool': codeSchool,
      'nameSchool': nameSchool,
    };
  }
}
