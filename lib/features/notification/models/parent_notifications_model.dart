import 'package:inoface/core/database/app_database.dart';
import 'dart:convert';

ParentNotificationsModel parentNotificationsModelFromJson(String str) => ParentNotificationsModel.fromJson(json.decode(str));
String parentNotificationsModelToJson(ParentNotificationsModel data) => json.encode(data.toJson());

class ParentNotificationsModel {
  ParentNotificationsModel({
    required this.erreur,
    required this.message,
    required this.notifications,
  });

  bool erreur;
  String message;
  List<NotificationMode> notifications;

  factory ParentNotificationsModel.fromJson(Map<String, dynamic> json) => ParentNotificationsModel(
    erreur: json["erreur"],
    message: json["message"],
    notifications: json["Notifications"] != null ? List<NotificationMode>.from(json["Notifications"].map((x) => NotificationMode.fromJson(x))) : [],
  );

  Map<String, dynamic> toJson() => {
    "erreur": erreur,
    "message": message,
    "Notifications": List<dynamic>.from(notifications.map((x) => x.toJsonMode())),
  };
}

class NotificationMode extends ParentNotification {
  NotificationMode({
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

  factory NotificationMode.fromJson(Map<String, dynamic> json) => NotificationMode(
    idParentNotification: json["id_parent_notification"],
    titre: json["titre"],
    detail: json["detail"],
    dateDeNotification: DateTime.parse(json["date_de_notification"]),
  );

  Map<String, dynamic> toJsonMode() => {
    "id_parent_notification": idParentNotification,
    "titre": titre,
    "detail": detail,
    "date_de_notification": dateDeNotification,
  };
}
