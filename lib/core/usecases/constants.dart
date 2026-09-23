import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:inoface/core/controllers/utils/utils_state.dart';
import '../../features/DemandeRecuperation/logic/recuperation_logic.dart';
import '../../features/DemandeRecuperation/logic/recuperation_state.dart';
import '../../features/attestations/logic/attestations_logic.dart';
import '../../features/informations/logic/informations_logic.dart';
import '../../features/informations/logic/informations_state.dart';
import '../../features/attestations/logic/attestations_state.dart';
import '../../features/jours_feries/logic/jours_feries_logic.dart';
import '../../features/reservations/logic/reservation_logic.dart';
import '../controllers/notification/notify_firebase_logic.dart';
import '../../features/home/entities/notification_entity.dart';
import '../../features/evenements/logic/evenement_logic.dart';
import 'package:inoface/core/mobx/mobx_home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import '../../features/devoir/logic/devoir_logic.dart';
import '../../features/devoir/logic/devoir_state.dart';
import '../../features/agenda/logic/agenda_logic.dart';
import '../../features/agenda/logic/agenda_state.dart';
import '../../features/survey/logic/survey_logic.dart';
import '../../features/survey/logic/survey_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../controllers/language/language_logic.dart';
import '../controllers/language/language_state.dart';
import '../../features/login/logic/auth_logic.dart';
import '../../features/login/logic/auth_state.dart';
import '../controllers/network/network_logic.dart';
import '../controllers/network/network_state.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:timezone/data/latest.dart' as tz;
import '../controllers/utils/utils_logic.dart';
import '../models/reminder_notification.dart';
import 'package:rate_my_app/rate_my_app.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:rxdart/rxdart.dart';
import '../util/keys.dart';
import 'dart:convert';
import 'dart:io';





///!  --------- Init Controllers ---------

//! JoursFeriesLogic
final JoursFeriesLogic joursFeriesLogic = JoursFeriesLogic.instance;

//! InformationsLogic
final InformationsLogic informationsLogic = InformationsLogic.instance;
final InformationsState informationsState = informationsLogic.state;

//! AgendaLogic
final AgendaLogic agendaLogic = AgendaLogic.instance;
final AgendaState agendaState = agendaLogic.state;

//! EvenementLogic
final EvenementLogic evenementLogic = EvenementLogic.instance;

//! NotificationLogic
final NotifyFirebaseLogic notifyFirebaseLogic = NotifyFirebaseLogic.instance;


//! UtilsLogic
final UtilsLogic utilsLogic = UtilsLogic.instance;
final UtilsState utilsState = UtilsLogic.instance.state;

//! ForgotPassLogic
// final ForgotPassLogic forgotPassLogic = ForgotPassLogic.instance;
// final ForgotPassState forgotPassState = forgotPassLogic.state;

//! AttestationsLogic
final AttestationsLogic attestationsLogic = AttestationsLogic.instance;
final AttestationsState attestationsState = attestationsLogic.state;

//! AuthLogic
final AuthLogic authLogic = AuthLogic.instance;
final AuthState authState = authLogic.state;

//! NotificationsLogic
// final NotificationLogic notificationsLogic = NotificationLogic.instance;
// final NotificationState notificationsState = notificationsLogic.state;

//! LanguageLogic
final LanguageLogic languageLogic = LanguageLogic.instance;
final LanguageState languageState = languageLogic.state;

//! NetworkLogic
final NetworkLogic networkLogic = NetworkLogic.instance;
final NetworkState networkState = networkLogic.state;

//! ReservationLogic
final ReservationLogic reservationLogic = ReservationLogic.instance;

//! RecuperationLogic
final RecuperationLogic recuperationLogic = RecuperationLogic.instance;
final RecuperationState recuperationState = recuperationLogic.state;

//! DevoirLogic
final DevoirLogic devoirLogic = DevoirLogic.instance;
final DevoirState devoirState = devoirLogic.state;

//! SurveyLogic
final SurveyLogic surveyLogic = SurveyLogic.instance;
final SurveyState surveyState = surveyLogic.state;


final FirebaseMessaging firebaseMessaging = GetIt.I.get<FirebaseMessaging>();
final FirebaseFirestore firestore = GetIt.I.get<FirebaseFirestore>();
final SharedPreferences prefs = GetIt.I.get<SharedPreferences>();
final Directory directory = GetIt.I.get<Directory>();
final MobxHome mobxApp = MobxHome();
final Logger logger = Logger();


Future<void> initAppService() async {
  //Init Connection
  await initializeDateFormatting('fr');
  // await FlutterDownloader.initialize(debug: false);
  await initializePlatformSpecifics();
}

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel',
  'High Importance Notifications',
  importance: Importance.max,
  playSound: true,
);

final BehaviorSubject<ReminderNotification> didReceiveNotificationSubject = BehaviorSubject<ReminderNotification>();
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

Future<void> initializePlatformSpecifics() async {
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
  var initializationSettingsAndroid = const AndroidInitializationSettings('@drawable/ic_stat_name');
  var initializationSettingsIOS = const DarwinInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true,
  );
  final initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
  );
  tz.initializeTimeZones();
  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onDidReceiveNotificationResponse: notifyFirebaseLogic.selectNotification,
    // onDidReceiveBackgroundNotificationResponse: notificationLogic.selectNotification,
  );
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  if (message.data.isNotEmpty) {
    logger.i('Message data: ${message.data}');
    final entity = NotificationEntity.fromJson(message.data);
    AndroidNotification? android = message.notification?.android;
    await flutterLocalNotificationsPlugin.show(
      message.hashCode,
      entity.title,
      entity.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
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
      payload: json.encode(message.data),
    );
  }
}

const List<String> videoFormats = [
  '.mp4',
  '.mov',
  '.avi',
  '.wmv',
  '.3gp',
  '.3gpp',
  '.mkv',
  '.flv',
];
const List<String> imageFormats = [
  '.jpeg',
  '.png',
  '.jpg',
  '.gif',
  '.webp',
  '.tif',
  '.heic',
];
const List<String> pdfFormats = ['.pdf'];

bool isLocalFilePath(String path) {
  Uri uri = Uri.parse(path);
  return !uri.scheme.contains('http');
}

bool isVideo(String path) {
  bool output = false;
  for (var videoFormat in videoFormats) {
    if (path.toLowerCase().contains(videoFormat)) output = true;
  }
  return output;
}

RateMyApp rateMyApp = RateMyApp(
  preferencesPrefix: Keys.rateMyApp,
  minDays: 3,
  minLaunches: 7,
  remindDays: 2,
  remindLaunches: 5,
  googlePlayIdentifier: 'com.inoser.inoface_lescopains',
  appStoreIdentifier: 'com.inoser.inoface_lescopains',
);
