import 'package:equatable/equatable.dart';
import 'dart:convert';


class InputMainCounts extends Equatable {
  final String identifiant;
  final String motdepasse;
  final String? tokenmobile;
  final int id_personne;

  const InputMainCounts({
    required this.identifiant,
    required this.motdepasse,
    this.tokenmobile,
    required this.id_personne,
  });

  factory InputMainCounts.fromJson(Map<String, dynamic> json) => InputMainCounts(
        identifiant: json["identifiant"],
        motdepasse: json["motdepasse"],
        tokenmobile: json["tokenmobile"],
        id_personne: json["id_personne"],
      );

  String toString() {
    var body = {
      'identifiant': identifiant,
      'motdepasse': motdepasse,
      'tokenmobile': tokenmobile,
      'id_personne': id_personne,
    };
    return json.encode(body);
  }

  Map<String, dynamic> toJson() {
    return {
      'identifiant': identifiant,
      'motdepasse': motdepasse,
      'tokenmobile': tokenmobile,
      'id_personne': id_personne,
    };
  }

  @override
  List<Object?> get props => [identifiant, motdepasse, tokenmobile, id_personne];
}
