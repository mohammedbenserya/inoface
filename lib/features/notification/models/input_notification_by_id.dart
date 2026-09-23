import 'package:equatable/equatable.dart';
import 'dart:convert';

class InputNotificationById extends Equatable {

  final String identifiant;
  final String motdepasse;
  final String? tokenmobile;
  final String id_parent_notification;

  InputNotificationById({
    required this.identifiant,
    required this.motdepasse,
    this.tokenmobile,
    required this.id_parent_notification,
  });

  factory InputNotificationById.fromJson(Map<String, dynamic> json) => InputNotificationById(
    identifiant: json["identifiant"],
    motdepasse: json["motdepasse"],
    tokenmobile: json["tokenmobile"],
    id_parent_notification: json["id_parent_notification"],
  );

  String toString() {
    var body = {
      'identifiant': identifiant.replaceAll(' ', ''),
      'motdepasse': motdepasse.replaceAll(' ', ''),
      'tokenmobile': tokenmobile?.replaceAll(' ', ''),
      'id_parent_notification': id_parent_notification.replaceAll(' ', ''),
    };
    return json.encode(body);
  }

  Map<String, dynamic> toJson() {
    return {
      'identifiant': identifiant,
      'motdepasse': motdepasse,
      'tokenmobile': tokenmobile,
      'id_parent_notification': id_parent_notification,
    };
  }

  @override
  List<Object?> get props => [identifiant, motdepasse, tokenmobile, id_parent_notification];

}