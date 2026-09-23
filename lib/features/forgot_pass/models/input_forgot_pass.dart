import 'package:equatable/equatable.dart';
import 'dart:convert';


class InputForgotPass extends Equatable {
  final String identifiant;
  final String email;

  const InputForgotPass({
    required this.identifiant,
    required this.email,
  });

  Map<String, dynamic> toJson() {
    return {
      'identifiant': identifiant,
      'email': email,
    };
  }

  String toString() {
    var body = {
      'identifiant': identifiant.replaceAll(' ', ''),
      'email': email.replaceAll(' ', ''),
    };
    return json.encode(body);
  }

  @override
  List<Object> get props => [identifiant, email];
}