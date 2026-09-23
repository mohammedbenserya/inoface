// To parse this JSON data, do
//
//     final parentNotificationsByIdModel = parentNotificationsByIdModelFromJson(jsonString);

import 'package:inoface/core/database/app_database.dart';
import 'dart:convert';

ParentNotificationsByIdModel parentNotificationsByIdModelFromJson(String str) => ParentNotificationsByIdModel.fromJson(json.decode(str));

String parentNotificationsByIdModelToJson(ParentNotificationsByIdModel data) => json.encode(data.toJson());

class ParentNotificationsByIdModel {
  ParentNotificationsByIdModel({
    required this.erreur,
    required this.message,
    this.notification,
  });

  bool erreur;
  String message;
  Notification? notification;

  factory ParentNotificationsByIdModel.fromJson(Map<String, dynamic> json) => ParentNotificationsByIdModel(
    erreur: json["erreur"],
    message: json["message"],
    notification: json["Notification"] != null ? Notification.fromJson(json["Notification"]) : null,
  );

  Map<String, dynamic> toJson() => {
    "erreur": erreur,
    "message": message,
    "Notification": notification?.toJson(),
  };
}

class Notification extends ParentNotification {
  Notification({
    required this.idParentNotification,
    required this.titre,
    this.detail,
    required this.dateDeNotification,
  }) : super(
    id_parent_notification: idParentNotification,
    titre: titre,
    detail: detail,
    date_de_notification: dateDeNotification,
  );

  int idParentNotification;
  String titre;
  String? detail;
  DateTime dateDeNotification;

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
    idParentNotification: json["id_parent_notification"],
    titre: json["titre"],
    detail: json["detail"],
    dateDeNotification: DateTime.parse(json["date_de_notification"]),
  );

  Map<String, dynamic> toJsonModel() => {
    "id_parent_notification": idParentNotification,
    "titre": titre,
    "detail": detail,
    "date_de_notification": dateDeNotification,
  };
}
