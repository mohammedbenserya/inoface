import 'dart:convert';

import 'package:equatable/equatable.dart';

InputLogin inputLoginFromJson(String str) => InputLogin.fromJson(json.decode(str));
String inputLoginToJson(InputLogin data) => json.encode(data.toJson());

class InputLogin extends Equatable {
  final String identifiant;
  final String motdepasse;
  final String? tokenmobile;
  final String? codeSchool;
  final String? ecolename;

  const InputLogin({
    required this.identifiant,
    required this.motdepasse,
    this.tokenmobile,
    this.codeSchool,
    this.ecolename,
  });

  factory InputLogin.fromJson(Map<String, dynamic> json) => InputLogin(
    identifiant: json["identifiant"],
    motdepasse: json["motdepasse"],
    tokenmobile: json["tokenmobile"],
    codeSchool: json["codeSchool"],
    ecolename: json["ecolename"],
  );

  String toString() {
    final body = <String, dynamic>{
      'identifiant': identifiant.replaceAll(' ', ''),
      'motdepasse': motdepasse.replaceAll(' ', ''),
      'tokenmobile': tokenmobile?.replaceAll(' ', ''),
      'codeSchool': codeSchool?.replaceAll(' ', ''),
      'ecolename': ecolename?.replaceAll(' ', ''),
    };
    body.removeWhere((key, value) => value == null || '$value'.isEmpty);
    return json.encode(body);
  }

  Map<String, dynamic> toJson() {
    return {
      'identifiant': identifiant,
      'motdepasse': motdepasse,
      'tokenmobile': tokenmobile,
      'codeSchool': codeSchool,
      'ecolename': ecolename,
    };
  }

  InputLogin copyWith({
    String? identifiant,
    String? motdepasse,
    String? tokenmobile,
    String? codeSchool,
    String? ecolename,
  }) => InputLogin(
    identifiant: identifiant ?? this.identifiant,
    motdepasse: motdepasse ?? this.motdepasse,
    tokenmobile: tokenmobile ?? this.tokenmobile,
    codeSchool: codeSchool ?? this.codeSchool,
    ecolename: ecolename ?? this.ecolename,
  );

  @override
  List<Object?> get props => [
    identifiant,
    motdepasse,
    tokenmobile,
    codeSchool,
    ecolename,
  ];

}
