// import 'package:inoface/features/notification/presentation/widgets/details_notifications.dart';
// import 'package:inoface/features/informations/presentation/widgets/details_informations.dart';
// import 'package:inoface/features/evenements/presentation/widgets/details_evenement.dart';
// import 'package:inoface/features/agenda/presentation/widgets/agenda_notes.dart';
// import 'package:inoface/features/home/entities/notification_entity.dart';
// import 'package:inoface/features/agenda/presentation/pages/agenda_page.dart';
// import 'package:inoface/features/home/presentation/pages/home_page.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:inoface/core/database/app_database.dart';
// import 'package:inoface/core/usecases/constants.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:inoface/core/util/keys.dart';
// import 'package:open_file/open_file.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'dart:convert';
// import 'dart:async';
// import 'enums.dart';
// import 'dart:io';
//
//
//
//
// class FirebaseNotifications {
//   static late BuildContext ctx;
//
//   // static final StreamController<String?> selectNotificationStream = StreamController<String?>.broadcast();
//   static Future<void> setUpFirebase() async {
//     final settings = await firebaseMessaging.requestPermission(
//       criticalAlert: false,
//       announcement: false,
//       provisional: false,
//       carPlay: false,
//       badge: true,
//       alert: true,
//       sound: true,
//     );
//
//     await firebaseMessaging.setForegroundNotificationPresentationOptions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//
//     logger.i('User granted permission: ${settings.authorizationStatus}');
//     if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//       logger.i('User granted permission');
//     } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
//       logger.i('User granted provisional permission');
//     } else {
//       logger.i('User declined or has not accepted permission');
//     }
//   }
//
//   static Future<String?> getToken() async {
//     return await firebaseMessaging.getToken();
//   }
//
//   static Future<void> deleteToken() async {
//     return await firebaseMessaging.deleteToken();
//   }
//
//   static void messagingListeners(BuildContext context) {
//     try {
//       ctx = context;
//       FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
//         if (message.data.isNotEmpty && Platform.isAndroid) {
//           AndroidNotification? android = message.notification?.android;
//           RemoteNotification? notification = message.notification;
//           await flutterLocalNotificationsPlugin.show(
//             message.hashCode,
//             notification?.title ?? '',
//             notification?.body ?? '',
//             NotificationDetails(
//               android: AndroidNotificationDetails(
//                 channel.id,
//                 channel.name,
//                 priority: Priority.high,
//                 importance: Importance.max,
//                 icon: android?.smallIcon,
//               ),
//               iOS: const DarwinNotificationDetails(
//                 presentAlert: true,
//                 presentBadge: true,
//                 presentSound: true,
//               ),
//             ),
//             payload: json.encode(message.data),
//           );
//         }
//       });
//
//       FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
//         if (message.data.isNotEmpty) {
//           logger.i('Message data: onMessageOpenedApp ${message.data}');
//           final entity = NotificationEntity.fromJson(message.data);
//           Widget? page = await checkTypeMessage(entity);
//           if (page != null) {
//             Get.offAll(() => const HomePage());
//             Get.to(() => page);
//           }
//         } else {
//           var details = await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
//           String? payload = details?.notificationResponse?.payload;
//           if ((details?.didNotificationLaunchApp??false) && payload != null) {
//             final entity = NotificationEntity.fromJson(json.decode(payload));
//             Widget? page = await FirebaseNotifications.checkTypeMessage(entity);
//             if (page != null) {
//               Get.offAll(() => const HomePage());
//               Get.to(() => page);
//             }
//           }
//         }
//       });
//
//       FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? message) async {
//         if (message != null && message.data.isNotEmpty) {
//           logger.i('Message data: getInitialMessage ${message.data}');
//           final entity = NotificationEntity.fromJson(message.data);
//           Widget? page = await checkTypeMessage(entity);
//           if (page != null) {
//             // Get.offAll(() => const HomePage());
//             Get.to(() => page);
//           }
//         }
//         // else {
//         //   logger.i('payload 2');
//         //   var details = await flutterLocalNotificationsPlugin
//         //       .getNotificationAppLaunchDetails();
//         //   if (details.didNotificationLaunchApp && details.payload != null) {
//         //     final entity = NotificationEntity.fromJson(json.decode(details.payload));
//         //     Widget page = await FirebaseNotifications.checkTypeMessage(entity);
//         //     logger.i('payload 2 ${details.payload}');
//         //     if (page != null) {
//         //       // Get.offAll(() => const HomePage());
//         //       Get.to(() => page);
//         //     }
//         //   }
//         // }
//       });
//     } catch (e) {
//       logger.e(e);
//     }
//   }
//
//   static Future<Widget?> checkTypeMessage(NotificationEntity entity) async {
//     try {
//
//       if (entity.idPersonne == null) {
//         return null;
//       } else {
//         final enfant = await utilsLogic.getEnfantById(entity.idPersonne!);
//         utilsLogic.setEnfant(enfant);
//         await utilsLogic.cacheEnfant(enfant);
//         //! init counter
//         final countsModel = await utilsLogic.getCounter(idPer: entity.idPersonne!);
//         utilsLogic.setMainCountsModel(countsModel);
//       }
//
//
//       if (entity.type == Keys.NOTIFICATION_PARENT) {
//         await utilsLogic.getNotificationById(id: entity.id!);
//         List<ParentNotification> notify = await utilsLogic.getAllParentNotifications();
//         int index = notify.indexWhere((element) => element.id_parent_notification == entity.id);
//         if (notify.isEmpty || index == -1) return null;
//         return DetailsNotifications(notifications: notify, index: index, idPersonne: entity.idPersonne!);
//
//       } else if (entity.type == Keys.NOTIFICATION_EVE) {
//         await evenementLogic.getEvenementById(id: entity.id!, idPer: entity.idPersonne!);
//         List<Evenement> events = await evenementLogic.getAllEvenementByIdPer(entity.idPersonne!);
//         logger.i('events: ${events.length} idPer: ${entity.idPersonne}');
//         int index = events.indexWhere((element) => element.id_evenement == entity.id);
//         if (events.isEmpty || index == -1) return null;
//         return DetailsEvenement(events: events, index: index, idPersonne: entity.idPersonne!);
//
//       } else if (entity.type == Keys.NOTIFICATION_INFO) {
//         await informationsLogic.getInformationById(id: entity.id!, idPer: entity.idPersonne!);
//         List<Information> infos = await informationsLogic.getAllInformationByIdPer(entity.idPersonne!);
//         int index = infos.indexWhere((element) => element.id_information == entity.id);
//         if (infos.isEmpty || index == -1) return null;
//         return DetailsInformations(infos: infos, index: index, idPersonne: entity.idPersonne!);
//
//       } else if (entity.idPersonne == null && entity.type == Keys.NOTIFICATION_AGEN) {
//         await agendaLogic.getAgendaById(id: entity.id!, idPer: entity.idPersonne!);
//         final agenda = await agendaLogic.getAgendasByIdAgendaAndIdPer(idAgenda: entity.id!, idPer: entity.idPersonne!);
//         if (agenda == null) return null;
//         //Todo
//         // return AgendaPage(idPersonne: entity.idPersonne!, dateTime: agenda.date_agenda);
//         return null;
//
//       } else if (entity.type == Keys.NOTIFICATION_NOTE) {
//         await utilsLogic.getNotificationById(id: entity.id!);
//         // List<ParentNotification> notify = await utilsLogic.getAllParentNotifications();
//         // int index = notify.indexWhere((element) => element.id_parent_notification == entity.id);
//         // if (notify.isEmpty) return null;
//         return AgendaNotes(idAgenda: entity.id!);
//       }
//       return null;
//     } catch(e) {
//       utilsLogic.showSnack(type: SnackBarType.error, message: '$e');
//       logger.e(e);
//       return null;
//     }
//   }
//
//   static Future selectNotification(NotificationResponse notificationResponse) async {
//     /*
//     switch (notificationResponse.notificationResponseType) {
//       case NotificationResponseType.selectedNotification:
//         selectNotificationStream.add(notificationResponse.payload);
//         break;
//       case NotificationResponseType.selectedNotificationAction:
//         if (notificationResponse.actionId == navigationActionId) {
//           selectNotificationStream.add(notificationResponse.payload);
//         }
//         break;
//     }
//      */
//
//     if (notificationResponse.notificationResponseType == NotificationResponseType.selectedNotification) {
//       // selectNotificationStream.add(notificationResponse.payload);
//       String? payload = notificationResponse.payload;
//       if (payload != null) {
//         final entity = NotificationEntity.fromJson(json.decode(payload));
//         if (entity.type == 'download') {
//           return await OpenFile.open(entity.body);
//         } else {
//           Widget? page = await FirebaseNotifications.checkTypeMessage(entity);
//           logger.i('payload 1 $payload');
//           if (page != null) {
//             Get.offAll(() => const HomePage());
//             Get.to(() => page);
//           }
//         }
//       } else {
//         var details = await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
//         String? payload = details?.notificationResponse?.payload;
//         if ((details?.didNotificationLaunchApp??false) && payload != null) {
//           final entity = NotificationEntity.fromJson(json.decode(payload));
//           if (entity.type == 'download') {
//             return await OpenFile.open(entity.body);
//           } else {
//             Widget? page = await FirebaseNotifications.checkTypeMessage(entity);
//             if (page != null) {
//               Get.offAll(() => const HomePage());
//               Get.to(() => page);
//             }
//           }
//         }
//       }
//     }
//   }
//
//   static Future selectNotificationIOS(String? payload) async {
//     if (payload != null) {
//       final entity = NotificationEntity.fromJson(json.decode(payload));
//       if (entity.type == 'download') {
//         return await OpenFile.open(entity.body);
//       } else {
//         Widget? page = await FirebaseNotifications.checkTypeMessage(entity);
//         logger.i('payload 1 $payload');
//         if (page != null) {
//           Get.offAll(() => const HomePage());
//           Get.to(() => page);
//         }
//       }
//     } else {
//       var details = await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
//       String? payload = details?.notificationResponse?.payload;
//       if ((details?.didNotificationLaunchApp??false) && payload != null) {
//         final entity = NotificationEntity.fromJson(json.decode(payload));
//         if (entity.type == 'download') {
//           return await OpenFile.open(entity.body);
//         } else {
//           Widget? page = await FirebaseNotifications.checkTypeMessage(entity);
//           if (page != null) {
//             Get.offAll(() => const HomePage());
//             Get.to(() => page);
//           }
//         }
//       }
//     }
//   }
//
//   static Future<void> showNotifications(NotificationEntity entity) async {
//     await flutterLocalNotificationsPlugin.show(
//       0,
//       entity.title,
//       entity.body,
//       NotificationDetails(
//         android: AndroidNotificationDetails(
//           channel.id, channel.name,
//           priority: Priority.high,
//           importance: Importance.max,
//         ),
//         iOS: const DarwinNotificationDetails(
//           presentAlert: true,
//           presentBadge: true,
//           presentSound: true,
//         ),
//       ),
//       payload: json.encode(entity.toJson()),
//     );
//   }
// }
