import '../../../features/notification/presentation/widgets/details_notifications.dart';
import '../../../features/informations/presentation/widgets/details_informations.dart';
import '../../../features/jours_feries/presentation/pages/jours_feries_page.dart';
import '../../../features/evenements/presentation/widgets/details_evenement.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../../../features/agenda/presentation/pages/agenda_config_page.dart';
import '../../../features/survey/presentation/widgets/details_survey.dart';
import '../../../features/agenda/presentation/widgets/agenda_notes.dart';
import '../../../features/home/entities/notification_entity.dart';
import '../../../features/home/presentation/pages/home_page.dart';
import '../../../features/account/models/account_model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import '../../../features/survey/models/survey_model.dart';
import 'package:inoface/core/util/boxes.dart';
import '../../../features/login/models/input_login.dart';
import '../../../widget_helper/loading_dialog.dart';
import 'package:open_filex/open_filex.dart';
import '../../database/app_database.dart';
import 'package:flutter/foundation.dart';
import '../../usecases/constants.dart';
import 'package:flutter/material.dart';
import '../../usecases/enums.dart';
import '../../util/keys.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'dart:io';



class NotifyFirebaseLogic extends GetxController {
  static NotifyFirebaseLogic instance = Get.find();
  String idHashCode = '';

  @override
  void onInit() {
    registerNotification();
    super.onInit();
  }

  @override
  void onReady() {
    messagingListeners();
    super.onReady();
  }
  

  Future<void> registerNotification() async {
    final settings = await firebaseMessaging.requestPermission(
      criticalAlert: false,
      announcement: false,
      provisional: false,
      carPlay: false,
      badge: true,
      alert: true,
      sound: true,
    );

    await firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    if (kDebugMode) {
      logger.i('User granted permission: ${settings.authorizationStatus}');
      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        logger.i('User granted permission');
      } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
        logger.i('User granted provisional permission');
      } else {
        logger.i('User declined or has not accepted permission');
      }
    }
  }


  Future<String?> getToken() async {
    return await firebaseMessaging.getToken();
  }

  Future<void> deleteToken() async {
    return await firebaseMessaging.deleteToken();
  }


  void messagingListeners() {
    try {
      FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
        if(message.data.isNotEmpty && Platform.isAndroid) {
          AndroidNotification? android = message.notification?.android;
          RemoteNotification? notification = message.notification;
          final model = NotificationEntity.fromJson(message.data).copyWith(
            title: message.notification?.title,
            body: message.notification?.body,
          );
          if (kDebugMode) {
            logger.i('Message data: onMessage ${message.data}');
            logger.i('Message data: onMessage ${model.toJson()}');
          }
          await flutterLocalNotificationsPlugin.show(
            message.hashCode,
            notification?.title??'',
            notification?.body??'',
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id, channel.name,
                priority: Priority.high,
                importance: Importance.max,
                icon: android?.smallIcon,
              ),
              iOS: const DarwinNotificationDetails(
                presentAlert: true,
                presentBadge: true,
                presentSound: true,
              ),
            ),
            // payload: json.encode(message.data),
            payload: json.encode(model.toJson()),
          );
        }
      });

      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
        if (message.data.isNotEmpty) {
          if (kDebugMode) {
            logger.i('Message data: onMessageOpenedApp ${message.data}');
            logger.i('Message data: hashCode ${message.hashCode}');
          }
          final entity = NotificationEntity.fromJson(message.data);
          idHashCode = '${entity.type}${entity.id}';
          Widget? page = await checkTypeMessage(entity.copyWith(
            title: message.notification?.title,
            body: message.notification?.body,
          ));

          if (page != null) {
            Get.offAll(() => const HomePage());
            Get.to(() => page);
          }

        } else {
          var details = await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
          String? payload = details?.notificationResponse?.payload;
          if ((details?.didNotificationLaunchApp??false) && payload != null) {
            final entity = NotificationEntity.fromJson(json.decode(payload));
            Widget? page = await checkTypeMessage(entity);
            if (page != null) {
              Get.offAll(() => const HomePage());
              Get.to(() => page);
            }
          }
        }
      });
    } catch(e) {
      logger.e(e);
    }
  }

  void getNotificationAppLaunch(BuildContext context) {
    FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? message) async {
      if (message != null && message.data.isNotEmpty) {
        if (kDebugMode) {
          logger.i('Message data: getInitialMessage ${message.data}');
          logger.i('Message data: hashCode ${message.hashCode}');
        }
        final entity = NotificationEntity.fromJson(message.data).copyWith(
          title: message.notification?.title,
          body: message.notification?.body,
        );
        String type = '${entity.type}${entity.id}';
        Widget? page = await checkTypeMessage(entity);
        final ctx = Get.overlayContext ?? context;
        if (page != null && idHashCode != type) {
          if (ctx.mounted) Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
        }
      }
    });
  }
  

  Future<Widget?> checkTypeMessage(NotificationEntity entity) async {
    // try {

      final boxAccount = Boxes.account();
      final boxSetting = Boxes.settings();
      final identifiant = authState.inputLogin?.identifiant;
      final account = boxAccount.get('${entity.identifiant}${entity.codeSchool}');
      if (account?.identifiant != identifiant) {
        if (account != null) {
          final ctx = Get.overlayContext;
          if (ctx != null) LoadingDialog.show(context: ctx);
          final login = InputLogin(
            identifiant: account.identifiant,
            tokenmobile: account.tokenmobile,
            motdepasse: account.motdepasse,
            codeSchool: account.codeSchool,
            ecolename: account.nameSchool,
          );
          final loginModel = await authLogic.checkAuthInputLogin(login);
          if (ctx != null && ctx.mounted) LoadingDialog.hide(context: ctx);
          if (ctx != null && ctx.mounted && loginModel.erreur == false) {
            await boxSetting.put(Keys.cacheNotify, json.encode(entity.toJson()));
            await utilsLogic.changeAccount(account: account);
          } else {
            utilsLogic.showSnack(type: SnackBarType.error, message: loginModel.message);
            final key ='${account.identifiant}${account.codeSchool}';
            await boxAccount.delete(key);
            await boxSetting.delete(key+Keys.event);
            await boxSetting.delete(key+Keys.info);
            await boxSetting.delete(key+Keys.holiday);
            await boxSetting.delete(key+Keys.notify);
            await boxSetting.delete(key+Keys.survey);
          }
          return null;
        }
      }

      //! init counter
      if (entity.idPersonne != null) {
        await utilsLogic.updateCounter(idPer: int.parse('${entity.idPersonne}'));
      }

      if (entity.type == Keys.joursFeries && entity.id != null) {
        return JoursFeriesPage(id: int.parse('${entity.id}'));
      } else if (entity.type == Keys.NOTIFICATION_PARENT && entity.id != null) {
        await utilsLogic.getNotificationById(id: int.parse('${entity.id}'));
        List<ParentNotification> notify = await utilsLogic.getAllParentNotifications();
        int index = notify.indexWhere((element) => element.id_parent_notification == int.parse('${entity.id}'));
        if (notify.isEmpty || index == -1) return null;
        return DetailsNotifications(notifications: notify, index: index);
      }

      if (entity.idPersonne == null || entity.id == null) return null;

      final enfant = await utilsLogic.getEnfantById(int.parse('${entity.idPersonne}'));
      utilsLogic.setEnfant(enfant);
      await utilsLogic.cacheEnfant(enfant);

      if (entity.type == Keys.NOTIFICATION_EVE) {
        await evenementLogic.getEvenementById(id: int.parse('${entity.id}'), idPer: int.parse('${entity.idPersonne}'));
        List<Evenement> events = await evenementLogic.getAllEvenementByIdPer(int.parse('${entity.idPersonne}'));
        if (kDebugMode) {
          logger.i('events: ${events.length} idPer: ${entity.idPersonne}');
        }
        int index = events.indexWhere((element) => element.id_evenement == int.parse('${entity.id}'));
        if (events.isEmpty || index == -1) return null;
        return DetailsEvenement(events: events, index: index, idPersonne: int.parse('${entity.idPersonne}'));
      } else if (entity.type == Keys.NOTIFICATION_INFO) {
        await informationsLogic.getInformationById(id: int.parse('${entity.id}'), idPer: int.parse('${entity.idPersonne}'));
        List<Information> infos = await informationsLogic.getAllInformationByIdPer(int.parse('${entity.idPersonne}'));
        int index = infos.indexWhere((element) => element.id_information == int.parse('${entity.id}'));
        if (infos.isEmpty || index == -1) return null;
        return DetailsInformations(infos: infos, index: index, idPersonne: int.parse('${entity.idPersonne}'));
      } else if (entity.type == Keys.NOTIFICATION_AGEN) {
        await agendaLogic.getAgendaById(id: int.parse('${entity.id}'), idPer: int.parse('${entity.idPersonne}'));
        final agenda = await agendaLogic.getAgendasByIdAgendaAndIdPer(idAgenda: int.parse('${entity.id}'), idPer: int.parse('${entity.idPersonne}'));
        if (agenda == null) return null;
        agendaLogic.updateDateTime(agenda.date_agenda);
        return const AgendaConfigPage();
      } else if (entity.type == Keys.NOTIFICATION_NOTE) {
        await utilsLogic.getNotificationById(id: int.parse('${entity.id}'));
        return AgendaNotes(idAgenda: int.parse('${entity.id}'));
      } else if (entity.type == Keys.sondage) {
        final input = surveyLogic.getInputSurvey(idPersonne: int.parse('${entity.idPersonne}'));
        if (input != null) {
          SurveyModel model = await surveyLogic.getConcreteSurveyModel(input);
          await surveyLogic.cacheSurvey(model);
          Sondage? sondage = await surveyLogic.fetchSurveyById(int.parse('${entity.id}'));
          if (sondage != null) {
            return DetailsSurvey(sondage: sondage);
          }
        }
      }
      return null;
    // } catch(e) {
    //   utilsLogic.showSnack(type: SnackBarType.error, message: '$e');
    //   logger.e(e);
    //   return null;
    // }
  }

  Future selectNotification(NotificationResponse notificationResponse) async {
    String? payload = notificationResponse.payload;
    if (payload != null) {
      final entity = NotificationEntity.fromJson(json.decode(payload));
      final codeSchool = authState.inputLogin?.codeSchool;
      if (entity.codeSchool == codeSchool) {

      } else {
        final box = Boxes.account();
        AccountModel? account = box.get(entity.identifiant);
        if (account == null) return;
        utilsLogic.changeAccount(account: account);
      }
    }


    if (notificationResponse.notificationResponseType == NotificationResponseType.selectedNotification) {
      String? payload = notificationResponse.payload;
      if (payload != null) {
        final entity = NotificationEntity.fromJson(json.decode(payload));
        if (entity.type == 'download') {
          final path = entity.body;
          if (path != null) {
            OpenFilex.open(path);
          }
        } else {
          Widget? page = await checkTypeMessage(entity);
          if (page != null) {
            Get.offAll(() => const HomePage());
            Get.to(() => page);
          }
        }
      } else {
        var details = await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
        String? payload = details?.notificationResponse?.payload;
        if ((details?.didNotificationLaunchApp??false) && payload != null) {
          final entity = NotificationEntity.fromJson(json.decode(payload));
          if (entity.type == 'download') {
            final path = entity.body;
            if (path != null) {
              await OpenFilex.open(path);
            }
          } else {
            Widget? page = await checkTypeMessage(entity);
            if (page != null) {
              Get.offAll(() => const HomePage());
              Get.to(() => page);
            }
          }
        }
      }
    }
  }

  Future selectNotificationIOS(String? payload) async {
    if (payload != null) {
      final entity = NotificationEntity.fromJson(json.decode(payload));
      if (entity.type == 'download') {
        final path = entity.body;
        if (path != null) {
          await OpenFilex.open(path);
        }
      } else {
        Widget? page = await checkTypeMessage(entity);
        if (page != null) {
          Get.offAll(() => const HomePage());
          Get.to(() => page);
        }
      }
    } else {
      var details = await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
      String? payload = details?.notificationResponse?.payload;
      if ((details?.didNotificationLaunchApp??false) && payload != null) {
        final entity = NotificationEntity.fromJson(json.decode(payload));
        if (entity.type == 'download') {
          final path = entity.body;
          if (path != null) {
            return await OpenFilex.open(path);
          }
        } else {
          Widget? page = await checkTypeMessage(entity);
          if (page != null) {
            Get.offAll(() => const HomePage());
            Get.to(() => page);
          }
        }
      }
    }
  }

  Future<void> showNotifications(NotificationEntity entity) async {
    await flutterLocalNotificationsPlugin.show(
      entity.hashCode,
      entity.title,
      entity.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id, channel.name,
          priority: Priority.high,
          importance: Importance.max,
        ),
        iOS: const DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        ),
      ),
      payload: json.encode(entity.toJson()),
    );
  }
}