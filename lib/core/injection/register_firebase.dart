import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterFirebase {

  @injectable
  FirebaseMessaging get firebaseMessaging => FirebaseMessaging.instance;

  @injectable
  FirebaseFirestore get firestore => FirebaseFirestore.instance;

}
