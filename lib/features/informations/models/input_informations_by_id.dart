import 'package:equatable/equatable.dart';
import 'dart:convert';


class InputInformationsById extends Equatable {

  final String identifiant;
  final String motdepasse;
  final String? tokenmobile;
  final int id_personne;
  final int id_information;

  InputInformationsById({
    required this.identifiant,
    required this.motdepasse,
    this.tokenmobile,
    required this.id_personne,
    required this.id_information,
  });

  String toStringModel() {
    var body = {
      'identifiant': identifiant,
      'motdepasse': motdepasse,
      'tokenmobile': tokenmobile,
      'id_personne': id_personne,
      'id_information': id_information,
    };
    return json.encode(body);
  }

  Map<String, dynamic> toJson() {
    return {
      'identifiant': identifiant,
      'motdepasse': motdepasse,
      'tokenmobile': tokenmobile,
      'id_personne': id_personne,
      'id_information': id_information,
    };
  }

  @override
  List<Object?> get props => [identifiant, motdepasse, tokenmobile, id_information];

}