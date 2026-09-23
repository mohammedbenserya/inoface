import 'package:equatable/equatable.dart';


class NotificationEntity extends Equatable {

  final String? title;
  final String? body;
  final String type;
  final String? id;
  final String? idPersonne;
  final String? codeSchool;
  final String? identifiant;


  const NotificationEntity({
    this.title,
    this.body,
    required this.type,
    this.id,
    this.idPersonne,
    this.codeSchool,
    this.identifiant
  });

  NotificationEntity copyWith({
    String? title,
    String? body,
    String? type,
    String? id,
    String? idPersonne,
    String? codeSchool,
    String? identifiant,
  }) => NotificationEntity(
    title: title ?? this.title,
    body: body ?? this.body,
    type: type ?? this.type,
    id: id ?? this.id,
    idPersonne: idPersonne ?? this.idPersonne,
    codeSchool: codeSchool ?? this.codeSchool,
    identifiant: identifiant ?? this.identifiant,
  );

  factory NotificationEntity.fromJson(Map<String, dynamic> json) {
    return NotificationEntity(
      title: json['title'],
      body: json['body'],
      type: json['Type'],
      id: json['id'],
      idPersonne: json['id_personne'],
      codeSchool: json['code_school'],
      identifiant: json['identifiant'],
    );
  }

  @override
  List<Object?> get props => [
    type, id, idPersonne, codeSchool, identifiant
  ];

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "body": body,
      "Type": type,
      "id": id,
      "id_personne": idPersonne,
      "code_school": codeSchool,
      "identifiant": identifiant,
    };
  }
}