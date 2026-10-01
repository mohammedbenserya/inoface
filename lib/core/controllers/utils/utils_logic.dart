import '../../../features/notification/models/parent_notifications_by_id_model.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import '../../../features/attestations/models/demande_attestations_model.dart';
import '../../../features/notification/models/input_notification_by_id.dart';
import '../../../features/attestations/models/input_remove_demande.dart';
import '../../../features/attestations/models/remove_demande_model.dart';
import '../../../features/init_home/presentation/pages/init_home.dart';
import '../../../features/attestations/models/input_attestation.dart';
import '../../../features/init_home/models/main_counts_model.dart';
import '../../../features/init_home/models/input_main_counts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../features/account/models/account_model.dart';
import 'package:inoface/core/usecases/enums.dart';
import '../../../features/agenda/models/add_note_model.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../features/survey/models/input_survey.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../../features/login/models/login_model.dart';
import '../../../features/login/models/input_login.dart';
import '../../../features/agenda/models/send_note.dart';
import '../../../widget_helper/loading_dialog.dart';
import 'package:store_redirect/store_redirect.dart';
import 'package:gal/gal.dart';
import 'package:path_provider/path_provider.dart';
import '../../util/generateMaterialColor.dart';
import 'package:open_filex/open_filex.dart';
import '../../database/app_database.dart';
import 'package:flutter/foundation.dart';
import '../../models/enfants_model.dart';
import 'package:http/http.dart' as http;
import '../../usecases/constants.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;
import '../../error/exceptions.dart';
import '../../util/url_service.dart';
import 'package:crypto/crypto.dart';
import '../../util/app_image.dart';
import '../../error/failures.dart';
import 'package:retry/retry.dart';
import 'package:dartz/dartz.dart';
import 'package:intl/intl.dart';
import '../../util/boxes.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import '../../util/keys.dart';
import '../../../main.dart';
import 'utils_state.dart';
import 'dart:developer';
import 'dart:convert';
import 'dart:async';
import 'dart:io';



class UtilsLogic extends GetxController {
  static UtilsLogic instance = Get.find();
  final state = UtilsState();
  final boxSetting = Boxes.settings();


  @override
  void onInit() {
    initVersion();
    super.onInit();
  }

  void setMainCountsModel(MainCountsModel val) {
    state.counters = val;
    update();
  }

  Future<void> initVersion({bool listener = false}) async {
    final packageInfo = await PackageInfo.fromPlatform();
    state.version = packageInfo.version;
    if (listener) {
      update();
    }
  }

  void seIgnoreNotify({String? val}) {
    state.ignoreNotification = val;
    update();
  }

  void showSnack({required SnackBarType type, String? title, String? message, int seconds = 4}) {
    var attempts = 0;
    void tryShow() {
      final overlayContext = Get.overlayContext ?? Get.context;
      if (overlayContext == null || Overlay.maybeOf(overlayContext) == null) {
        if (attempts < 10) {
          attempts++;
          Future.delayed(const Duration(milliseconds: 250), tryShow);
        }
        return;
      }
      late final String snackTitle;
      late final String snackMessage;
      late final IconData icon;
      late final Color color;
      switch (type) {
        case SnackBarType.error:
          snackTitle = title ?? 'oops'.tr;
          snackMessage = message ?? 'error_wrong'.tr;
          icon = MdiIcons.alert;
          color = Colors.red[300]!;
          break;
        case SnackBarType.unconnected:
          snackTitle = title ?? 'oops'.tr;
          snackMessage = 'error_connection'.tr;
          icon = MdiIcons.wifiRemove;
          color = Colors.red[300]!;
          break;
        case SnackBarType.info:
          snackTitle = title ?? '';
          snackMessage = message ?? '';
          icon = MdiIcons.informationOutline;
          color = Colors.blue[600]!;
          break;
        case SnackBarType.success:
          snackTitle = title ?? 'successfully'.tr;
          snackMessage = message ?? '';
          icon = MdiIcons.checkboxMarkedCircleOutline;
          color = Colors.green[300]!;
          break;
        case SnackBarType.warning:
          snackTitle = title ?? 'warning'.tr;
          snackMessage = message ?? '';
          icon = MdiIcons.checkboxMarkedCircleOutline;
          color = Colors.orange[300]!;
          break;
      }
      try {
        Get.snackbar(
          snackTitle,
          snackMessage,
          icon: Icon(icon, color: color),
          backgroundColor: Colors.white,
          shouldIconPulse: true,
          barBlur: 20,
          isDismissible: true,
          snackPosition: SnackPosition.BOTTOM,
          borderColor: color,
          borderWidth: 0.5,
          margin: const EdgeInsets.only(bottom: 5, left: 5, right: 5),
          duration: Duration(seconds: seconds),
        );
      } catch (e, st) {
        logger.e('Snackbar failed: $e', stackTrace: st);
      }
    }

    WidgetsBinding.instance.addPostFrameCallback((_) => tryShow());
  }

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


  bool isImage(String path) {
    bool output = false;
    for (var imageFormat in imageFormats) {
      if (path.toLowerCase().contains(imageFormat)) output = true;
    }
    return output;
  }

  bool isPdf(String path) {
    bool output = false;
    for (var pdfFormat in pdfFormats) {
      if (path.toLowerCase().contains(pdfFormat)) output = true;
    }
    return output;
  }

  String getUrl(String service) {
    final codeSchool = prefs.getString(Keys.CODE_SCHOOL) ?? '';
    return UrlService.schoolJson(codeSchool, service);
  }

  Future<String> prepareSaveDir() async {
    final localPath = (await _findLocalPath())!;
    final savedDir = Directory(localPath);
    bool hasExisted = await savedDir.exists();
    if (!hasExisted) {
      savedDir.create();
    }
    return localPath;
  }

  Future<String?> _findLocalPath() async {
    String? externalStorageDirPath;
    if (Platform.isAndroid) {
      final directory = await getExternalStorageDirectory();
      externalStorageDirPath = directory?.path;
    } else if (Platform.isIOS) {
      externalStorageDirPath = (await getApplicationDocumentsDirectory()).absolute.path;
    }
    return externalStorageDirPath;
  }

  Future<void> download(String url) async {
    try {
      url = UrlService.rewriteInoserUri(url);
      String fileName = Uri.decodeFull(p.basename(url)).replaceAll(RegExp(r'(\?alt).*'), '');
      String formatName = fileName.split('/').last;
      final savePath = await _findLocalPath();
      var response = await Dio().get(
        url,
        onReceiveProgress: updateProgress,
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }),
      );
      var file = File('$savePath/$formatName').openSync(mode: FileMode.write);
      file.writeFromSync(response.data);
      await file.close();

      logger.i(file.path);
      await OpenFilex.open(file.path);
    } catch (e) {
      logger.e(e);
      showSnack(
        type: SnackBarType.error,
        message: '$e',
      );
    }
  }

  void updateProgress(done, total) {
    String progressString = 'File has not been downloaded yet.';
    double progress = done / total;
    bool didDownloadPDF = false;
    if (progress >= 1) {
      progressString = '✅ File has finished downloading. Try opening the file.';
      didDownloadPDF = true;
    } else {
      progressString = 'Download progress: ${(progress * 100).toStringAsFixed(0)}% done.';
    }
    logger.i('$progressString, $didDownloadPDF');
  }

  void rateApp(BuildContext context) async {
    await rateMyApp.showRateDialog(
      context,
      title: 'rate_app'.tr,
      message: 'msg_rate_app'.tr,
      rateButton: 'rate_but'.tr,
      noButton: 'no_thanks'.tr,
      laterButton: 'maybe_later'.tr,
    );
  }

  int generateHash(String s1) => (<String>[s1]..sort()).join().hashCode;

  String shortenName(String nameRaw, {int nameLimit = 10, bool addDots = false}) {
    //* Limiting val should not be gt input length (.substring range issue)
    final max = nameLimit < nameRaw.length ? nameLimit : nameRaw.length;
    //* Get short name
    final name = nameRaw.substring(0, max);
    //* Return with '..' if input string was sliced
    if (addDots && nameRaw.length > max) return '$name..';
    return name;
  }

  String formatTag(String val) {
    try {
      List<String> list = [];
      var listSkills = (val.split(','));
      for (var val in listSkills) {
        list.add(
            '#${val.replaceAll(" ", "").replaceAll("-", "").replaceAll(".", "").replaceAll("&", "").replaceAll("'", "")}');
      }
      var stringList = list.join("");
      return stringList.replaceAll("#", " #");
    } catch (e) {
      logger.e(e);
      return val;
    }
  }

  List<String> formatStringToList(String val) {
    try {
      var listSkills = (val.split(' '));
      listSkills.removeWhere((item) => ["", null, false, 0].contains(item));
      return listSkills;
    } catch (e) {
      logger.e(e);
      return [];
    }
  }

  bool isUpperCase(String letter) {
    final regExp = RegExp('[A-Z]');
    return regExp.hasMatch(letter);
  }

  Future<void> checkVersion(BuildContext context) async {
    try {
      Map<String, dynamic> map = await getVersionStatus(context);
      if (map['canUpdate'] && context.mounted) {
        bool openStore = await showDialog(barrierDismissible: false,
            context: context, builder: (context) {
          return AlertDialog(
            title: Text('update_app'.tr,
              textAlign: TextAlign.center,
            ),
            content: Text('old_version'.trArgs([map['version']]),
              textAlign: TextAlign.center,
            ),
            actions: [
              TextButton(
                child: Text('update'.tr),
                onPressed: () => Navigator.pop(context, true),
              ),
            ],
          );
        }) ?? false;
        if (openStore) {
          StoreRedirect.redirect(
            androidAppId: "com.inoser.inoface_lescopains",
            iOSAppId: "1548915802",
          );
        }
      }
    } catch(e) {
      logger.e('$e');
    }
  }

  Future<Map<String, dynamic>> getVersionStatus(BuildContext context) async {
    try {
      if (networkState.isConnected) {
        final doc = await firestore.doc('Inoface/config').get();
        if (doc.exists) {
          final json = doc.data() as Map<String, dynamic>;
          int buildNumberStore = json['buildNumber'] ?? 0;
          String versionStore = json['version'] ?? '1.0.0';
          bool platform = false;
          if (Platform.isAndroid) {
            platform = json['android'];
          } else if (Platform.isIOS) {
            platform = json['ios'];
          }
          final packageInfo = await PackageInfo.fromPlatform();
          int buildNumber = int.parse(packageInfo.buildNumber);
          if (buildNumberStore > buildNumber && platform) {
            return {"canUpdate": true, "version": versionStore};
          }
        }
      }
    } catch(e) {
      logger.e('$e');
    }
    return {"canUpdate": false, "version": '1.0.0'};
  }

  Future<void> askForPermissions() async {
    var cameraStatus = await Permission.camera.status;
    var notificationStatus = await Permission.notification.status;
    if (cameraStatus.isDenied || notificationStatus.isDenied) {
      await [
        Permission.camera,
        Permission.notification,
      ].request();
    }
  }

  /*
  Future<MainCountsModel> getCounter({required int idPer}) async {
    try {
      final jsonString = prefs.getString('${Keys.CACHED_COUNT}$idPer');
      if (jsonString != null) {

        MainCountsModel model = mainCountsModelFromJson(jsonString);
        List<CountJoursFerie> jours = await appDatabase.countJoursFeriesDao.getCountJoursFerieByIdPer(idPer: idPer);
        List<CountNotification> notifications = await appDatabase.countNotificationsDao.getAllCountNotification();
        List<CountInformation> info = await appDatabase.countInformationsDao.getCountInformationByIdPer(idPer: idPer);
        List<CountEvenement> even = await appDatabase.countEvenementsDao.getCountEvenementByIdPer(idPer: idPer);
        // List<CountSondage> sondage = await appDatabase.countSondagesDao.getCountSondageByIdPer(idPer: idPer);

        final joursFeriesLength = model.countJoursFeries - jours.length;
        final notifyLength = model.countNotifications - notifications.length;
        final evenementLength = model.countEvenements - even.length;
        final infoLength = model.countInformations - info.length;
        // final sondageLength = model.countSondages - sondage.length;
        log('counter: ======> $infoLength, ${model.countInformations}, ${info.length}');
        return MainCountsModel(
          idPersonne: idPer,
          countJoursFeries: (joursFeriesLength <= 0) ? 0 : joursFeriesLength,
          countNotifications: (notifyLength <= 0) ? 0 : notifyLength,
          countEvenements: (evenementLength <= 0) ? 0 : evenementLength,
          countInformations: (infoLength <= 0) ? 0 : infoLength,
          countSondages: 0//(sondageLength < 0) ? 0 : sondageLength
        );
      } else {
        return state.counters;
      }
    } catch (e) {
      logger.e('$e');
      return state.counters;
    }
  }
  */

  Future<void> updateCounter({required int idPer}) async {
    try {

      Counter? model = await appDatabase.countersDao.getCounterByIdPersonne(idPer);
      log('updateCounter: $idPer, ${state.enfant?.prenom}, $model');
      if (model != null) {

        //! Jours
        List<CountJoursFerie> jours = await appDatabase.countJoursFeriesDao.getAllCountJoursFerie();

        //! Notification
        List<CountNotification> notifications = await appDatabase.countNotificationsDao.getAllCountNotification();

        //! Information
        List<CountInformation> allInfoCount = await appDatabase.countInformationsDao.getAllCountInformation();
        List<Information> informations = await appDatabase.informationsDao.getAllInformationByIdPer(idPer);
        List<CountInformation> infos = [];
        if (informations.isNotEmpty) {
          for (CountInformation all in allInfoCount) {
            for (Information info in informations) {
              if (all.idInformation == info.id_information) {
                infos.add(all);
                // break;
              }
            }
          }
        } else {
          infos.addAll(allInfoCount);
        }

        if (kDebugMode) {
          log('============================================');
          log('AllInformation: ${informations.length} allinfoCount: ${allInfoCount.length} '
              '(count: ${model.count_informations} - cached: ${infos.length}) = ${model.count_informations - infos.length}');
        }

        //! Evenement
        List<CountEvenement> allEvenCount = await appDatabase.countEvenementsDao.getAllCountEvenement();
        List<Evenement> evenements = await appDatabase.evenementsDao.getAllEvenementByIdPer(idPer);
        List<CountEvenement> evens = [];
        if (evenements.isNotEmpty) {
          for (CountEvenement event1 in allEvenCount) {
            for (Evenement event2 in evenements) {
              if (event1.idEvenement == event2.id_evenement) {
                evens.add(event1);
                break;
              }
            }
          }
        } else {
          evens.addAll(allEvenCount);
        }

        if (kDebugMode) {
          log('Evenement: length: ${model.count_evenements} - cached: ${evens.length} = (${model.count_evenements - evens.length})');
        }

        // List<CountSondage> sondage = await appDatabase.countSondagesDao.getCountSondageByIdPer(idPer: idPer);

        // select count (*) from tabInfo where idInfo in (select idInfo from tabAPIsInfon where idPer ==:$id)
        final joursFeriesLength = model.count_jours_feries - jours.length;
        final notifyLength = model.count_notifications - notifications.length;
        final evenementLength = model.count_evenements - evens.length;
        final infoLength = model.count_informations - infos.length;
        // final sondageLength = model.countSondages - sondage.length;
        state.counters = MainCountsModel(
          countJoursFeries: (joursFeriesLength <= 0) ? 0 : joursFeriesLength,
          countNotifications: (notifyLength <= 0) ? 0 : notifyLength,
          countEvenements: (evenementLength <= 0) ? 0 : evenementLength,
          countInformations: (infoLength <= 0) ? 0 : infoLength,
          countSondages: 0, //(sondageLength < 0) ? 0 : sondageLength
          idPersonne: idPer,
        );
        log('counters========> ${state.counters.toJson()}');
        update();
      }
    } catch (e) {
      logger.e('$e');
    }
  }

  int createUniqueId() {
    return UniqueKey().hashCode;
  }

  String convertDate(DateTime date) {
    return DateFormat('dd MMMM yyyy', 'fr').format(date);
  }

  String generateMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }

  Future<bool> getNotificationById({required int id}) async {
    try {
      final checkNotify = await appDatabase.parentNotificationsDao.getParentNotificationsById(idNotify: id);
      if (checkNotify != null) return true;

      final InputLogin? inputLogin = authLogic.getCashLogin();
      if (networkState.isConnected && inputLogin != null) {

        final input = InputNotificationById(
          id_parent_notification: '$id',
          motdepasse: inputLogin.motdepasse,
          tokenmobile: inputLogin.tokenmobile,
          identifiant: inputLogin.identifiant,
        );

        final url = getUrl(UrlService.PARENT_NOTIFICATIONS_BY_ID);
        final response = await retryPost(
          url: url, body: {'inoface_ws': input.toString()},
        );

        // final response = await http.post(Uri.parse(url), body: {
        //   'inoface_ws': input.toString(),
        // });

        log('response.body: ${{'inoface_ws': input.toString()}}');
        log('response.body: ${response.body}');
        ParentNotificationsByIdModel modelById = parentNotificationsByIdModelFromJson(response.body);
        if (modelById.erreur) {
          showSnack(type: SnackBarType.error, message: modelById.message);
          return false;
        }

        await appDatabase.parentNotificationsDao.insertParentNotifications(modelById.notification!);
        return true;
      } else {
        showSnack(type: SnackBarType.unconnected);
        return false;
      }
    } catch (e) {
      logger.e(e);
      showSnack(type: SnackBarType.error, message: '$e');
      return false;
    }
  }

  Future<bool> introIsFirstTime() async {
    return prefs.getBool(Keys.intro) ?? true;
  }

  Future<bool> setIntroFirstTime(bool val) async {
    return await prefs.setBool(Keys.intro, val);
  }


  Future<bool> requestDownload({required BuildContext context, required String url}) async {
    try {
      url = UrlService.rewriteInoserUri(url);
      if (networkState.isConnected) {
        if (url.toLowerCase().contains('.pdf')) {
          final String name = p.basename(url);
          showSnack(type: SnackBarType.info,
            title: 'downloading'.tr,
            message: 'download_progress'.tr
          );
          var dio = Dio();
          final fullPath = await _getPath(name);
          final response = await dio.get(
            url,
            onReceiveProgress: showDownloadProgress,
            options: Options(
              responseType: ResponseType.bytes,
              followRedirects: false,
              validateStatus: (status) {
                return (status??0) < 500;
              },
            ),
          );
          File file = File(fullPath);
          var raf = file.openSync(mode: FileMode.write);
          raf.writeFromSync(response.data);
          await raf.close();
          await OpenFilex.open(fullPath);
          // final notify = NotificationEntity(
          //   title: 'downloading_successfully'.tr,
          //   body: fullPath,
          //   type: 'download',
          // );
          // notifyFirebaseLogic.showNotifications(notify);
          return Future.value(true);
        } else if (Platform.isIOS && isImage(url)) {
          showSnack(type: SnackBarType.success,
            title: 'downloading'.tr,
            message: 'download_progress'.tr
          );
          final String name = p.basename(url);
          var dio = Dio();
          final fullPath = await _getPath(name);
          final response = await dio.get(
            url,
            onReceiveProgress: showDownloadProgress,
            options: Options(
              responseType: ResponseType.bytes,
              followRedirects: false,
              validateStatus: (status) {
                return (status??0) < 500;
              },
            ),
          );
          File file = File(fullPath);
          var raf = file.openSync(mode: FileMode.write);
          raf.writeFromSync(response.data);
          await raf.close();
          await Gal.putImage(fullPath);
          showSnack(type: SnackBarType.success, title: 'successfully'.tr);
          return Future.value(true);
        } else {
          final String name = p.basename(url);
          showSnack(type: SnackBarType.success,
            title: 'downloading'.tr,
            message: 'download_progress'.tr
          );
          var dio = Dio();
          final fullPath = await _getPath(name);
          final response = await dio.get(
            url, onReceiveProgress: showDownloadProgress,
            options: Options(
              responseType: ResponseType.bytes,
              followRedirects: false,
              validateStatus: (status) {
                return (status??0) < 500;
              },
            ),
          );
          File file = File(fullPath);
          var raf = file.openSync(mode: FileMode.write);
          raf.writeFromSync(response.data);
          await raf.close();
          // await OpenFilex.open(fullPath);
          // final notify = NotificationEntity(
          //   title: 'downloading_successfully'.tr,
          //   body: fullPath,
          //   type: 'download',
          // );
          // notifyFirebaseLogic.showNotifications(notify);
          if (isImage(url)) {
            await Gal.putImage(fullPath);
          }
          await OpenFilex.open(fullPath);
          return Future.value(true);
        }
      } else {
        await _checkPermission();
      }
    } catch (e) {
      logger.e(e);
      showSnack(type: SnackBarType.error, message: '$e');
    }
    return Future.value(false);
  }

  Future<String> _getPath(String name) async {
    if (Platform.isIOS) {
      var tempDir = await getTemporaryDirectory();
      return "${tempDir.path}/$name";
    } else {
      final tempDir = await getExternalStorageDirectory();
      return "${tempDir?.path}/$name";
    }
  }

  void showDownloadProgress(received, total) {
    if (total != -1) {
      logger.i((received / total * 100).toStringAsFixed(0) + "%");
    }
  }

  Future<bool> _checkPermission() async {
    if (Platform.isIOS) {
      return Gal.requestAccess();
    }
    return true;
  }

  String convertDateNotes(DateTime date) {
    return DateFormat('d MMMM yyyy hh:mm', 'fr').format(date);
  }

  Color colorPlatform() {
    if (Platform.isAndroid) {
      return Colors.pink;
    }
    return Colors.white;
  }

  bool checkRole(LoginModel entity) {
    try {
      for (Role role in entity.personneModel?.roles??[]) {
        if ('${role.role_description}'.contains('Parent')) {
          return true; // Get enfants
        }
      }
      return false; // Get main
    } catch (e) {
      return false;
    }
  }

  bool checkInitHome(List<Role> roles) {
    try {
      for (Role role in roles) {
        if ('${role.role_description}'.contains('Parent')) {
          return true;
        }
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  String getName(Personne data) {
    try {
      if (Get.locale.toString().contains('fr')) {
        return '${data.prenom} ${data.nom}';
      } else {
        return '${data.prenom_arabe} ${data.nom_arabe}';
      }
    } catch (e) {
      logger.e(e);
      showSnack(type: SnackBarType.error, message: '$e');
      return '--';
    }
  }

  String formatData(DateTime? data) {
    if (data != null) {
      final f = DateFormat('dd-MM-yyyy');
      final dateformat = f.format(data);
      return dateformat;
    } else {
      return '---';
    }
  }

  bool isFirstShowCase() {
    return prefs.getBool(Keys.SHOW_CASE1) ?? true;
  }

  Future<void> sendNotes({required String msg, required int idAgenda}) async {
    try {

      final noteLimit = await appDatabase.agendaNotesDao.getAgendaNoteByDate(DateTime.now());
      final id = createUniqueId();
      if (noteLimit.length < 2) {
        await appDatabase.agendaNotesDao.insertAgendaNote(AgendaNote(
          date_agenda_note: DateTime.now(),
          id_agenda_note: id,
          id_agenda: idAgenda,
          send: false,
          note: msg,
        ));

        final login = authState.inputLogin;
        if (networkState.isConnected && login != null) {
          final response = await http.post(Uri.parse(getUrl(UrlService.ADD_NOTE)), body: {
            'inoface_ws': SendNote(
              identifiant: login.identifiant,
              motdepasse: login.motdepasse,
              tokenmobile: login.tokenmobile,
              id_agenda: idAgenda,
              note: msg,
            ).toString(),
          });

          AddNoteModel model = addNoteModelFromJson(response.body);
          if (model.erreur == false) {
            await appDatabase.agendaNotesDao.deleteAgendaNoteById(id);
            await appDatabase.agendaNotesDao.insertAgendaNote(AgendaNote(
              date_agenda_note: model.agendaNote!.date_agenda_note,
              id_agenda_note: model.agendaNote!.id_agenda_note,
              id_agenda: model.agendaNote!.id_agenda,
              note: model.agendaNote!.note,
              send: true,
            ));
          } else {
            showSnack(type: SnackBarType.error, message: model.message);
          }
        }
      } else {
        logger.w("limit: ${noteLimit.length}");
        showSnack(type: SnackBarType.warning, message: 'limit_note'.tr);
      }
    } catch(e) {
      logger.e(e);
      showSnack(type: SnackBarType.error, message: '$e');
    }
  }

  /*
  static List<DateTime> _getListDate(DateTime start, DateTime end) {
    var lastDat = _lastDayOfWeek(end);
    var newLastDate = DateTime(lastDat.year, lastDat.month, lastDat.day);
    return _daysInRange(start, newLastDate).toList();
  }
  */

  /// Returns a [DateTime] for each day the given range.
  /*
  static Iterable<DateTime> _daysInRange(DateTime start, DateTime end) sync* {
    var i = start;
    var offset = start.timeZoneOffset;
    while (i.isBefore(end)) {
      yield i;
      i = i.add(const Duration(days: 1));
      var timeZoneDiff = i.timeZoneOffset - offset;
      if (timeZoneDiff.inSeconds != 0) {
        offset = i.timeZoneOffset;
        i = i.subtract(Duration(seconds: timeZoneDiff.inSeconds));
      }
    }
  }
  */

  /*
  static DateTime _lastDayOfWeek(DateTime day) {
    day = DateTime.utc(day.year, day.month, day.day);
    return day.add(const Duration(days: 1));
  }
  */

  Future<void> logOut({
    bool listener = true,
    bool logoutApi = false,
    String? identifiant,
  }) async {
    if (logoutApi && identifiant != null) {
      var body = {
        'identifiant': identifiant
      };
      final url = Uri.parse(getUrl(UrlService.logout));
      final response = await http.post(url,
        body: {'inoface_ws': json.encode(body)},
      );
      log('logOut -> response: ${response.body}');
    }
    await appDatabase.deleteAllData();
    authLogic.setInputLogin(null);
    state.enfants.clear();
    setEnfant(null, listener);
    bool isFirstRun = prefs.getBool(Keys.intro) ?? true;
    await prefs.clear();
    await prefs.setBool(Keys.intro, isFirstRun);
  }

  /*
  static void _downloadCallback(String id, DownloadTaskStatus status, int progress) {
    logger.i('Background Isolate Callback: task ($id) is in status ($status) and process ($progress)');
    final SendPort? send = IsolateNameServer.lookupPortByName('downloader_send_port');
    send?.send([id, status, progress]);
  }
  */

  Future<void> checkNotes(BuildContext context) async {
    try {
      InputLogin? login = authState.inputLogin;
      final notes = await appDatabase.agendaNotesDao.getAgendaNoteBySend(false);
      if (login != null && networkState.isConnected) {
        for (var not in notes) {
          final response = await utilsLogic.retryPost(
              url: getUrl(UrlService.ADD_NOTE),
              body: {
                'inoface_ws': SendNote(
                  identifiant: login.identifiant,
                  motdepasse: login.motdepasse,
                  tokenmobile: login.tokenmobile,
                  id_agenda: not.id_agenda,
                  note: not.note,
                ).toString(),
              }
          );
          /*
          final response = await http.post(Uri.parse(getUrl(UrlService.ADD_NOTE)), body: {
            'inoface_ws': SendNote(
              identifiant: login.identifiant,
              motdepasse: login.motdepasse,
              tokenmobile: login.tokenmobile,
              id_agenda: not.id_agenda,
              note: not.note,
            ).toString(),
          });
          */

          AddNoteModel model = addNoteModelFromJson(response.body);
          if (!model.erreur) {
            await appDatabase.agendaNotesDao.deleteAgendaNoteById(not.id_agenda_note);
            await appDatabase.agendaNotesDao.insertAgendaNote(AgendaNote(
              date_agenda_note: model.agendaNote!.date_agenda_note,
              id_agenda_note: model.agendaNote!.id_agenda_note,
              id_agenda: model.agendaNote!.id_agenda,
              note: model.agendaNote!.note,
              send: true,
            ));
          }
        }
      }
    } catch (e) {
      logger.e(e);
      showSnack(type: SnackBarType.error, message: '$e');
    }
  }


  Future<void> viewJourFeriesById({required int idPer, required int idJour}) async {
    try {

      final count = CountJoursFerie(
        idJoursFeries: idJour,
        id_personne: idPer,
      );
      await appDatabase.countJoursFeriesDao.insertCountJoursFerie(count);
    } catch (e) {
      logger.e(e);
      showSnack(type: SnackBarType.error, message: '$e');
    }
  }

  Future<void> viewNotificationById({required int idNotiy}) async {
    try {
      final count = CountNotification(idNotifications: idNotiy);
      await appDatabase.countNotificationsDao.insertCountNotification(count);
    } catch (e) {
      logger.e('e');
      showSnack(type: SnackBarType.error, message: '$e');
    }
  }

  Future<bool> getDisplayGallery() async {
    return prefs.getBool(Keys.DISPLAY_GALLERY) ?? false;
  }


  Future<bool> setDisplayGallery(bool val) async {
    return await prefs.setBool(Keys.DISPLAY_GALLERY, val);
  }

  bool checkList(List list, String val) {
    try {
      for (String file in list) {
        if (val.contains(file)) {
          return true;
        }
      }
      return false;
    } catch (e) {
      logger.e(e);
      showSnack(type: SnackBarType.error, message: '$e');
      return false;
    }
  }

  Future<File> createFileOfPdfUrl(String url) async {
    final filename = url.substring(url.lastIndexOf("/") + 1);
    var request = await HttpClient().getUrl(Uri.parse(url));
    var response = await request.close();
    var bytes = await consolidateHttpClientResponseBytes(response);
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = File('$dir/$filename');
    await file.writeAsBytes(bytes);
    return file;
  }


  Future<bool> checkDateDemande(int idPersonne) async {
    final listStatut = await appDatabase.demandesAttestationsDao.getAllDemandesAttestationsByStatut(
      idPersonne: idPersonne,
      idstatut: 3,
    );

    logger.i("listStatut: ${listStatut.length}");

    final allList = await appDatabase.demandesAttestationsDao.getAllDemandesAttestationsById(idPersonne);

    logger.i("listStatut: ${allList.length}");

    if (listStatut.length == allList.length || allList.isEmpty) {
      return true;
    }
    return false;
  }

  String? numberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'required_field'.tr;
    }
    final n = num.tryParse(value);
    if (n == null) {
      return 'required_field'.tr;
    }
    return null;
  }

  Future<void> removeDemande({
    required NavigatorState navigator,
    required BuildContext context,
    required int idEleveScolaire,
    required int idPersonne,
  }) async {
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          titlePadding: const EdgeInsets.all(0),
          title: Container(
            //height: 60, width: size.width - 100,
            padding: const EdgeInsets.symmetric(vertical: 20),
            color: Colors.pink.shade700,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
                'delete_selection'.tr,
                textAlign: TextAlign.center,
                maxLines: 2,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          content: Text('delete_demande'.tr),
          actions: <Widget>[
            TextButton(
              child: Text('cancel'.tr),
              onPressed: () => navigator.pop(),
            ),
            TextButton(
                child: Text('delete'.tr),
                onPressed: () async {
                  LoadingDialog.show(context: context);
                  await _removeDemande(
                      context: context,
                    idPers: idPersonne,
                    idEleveScolaire: idEleveScolaire,
                  ).whenComplete(() {
                    LoadingDialog.hide(context: context);
                  });
                  navigator.pop();
                },
            ),
          ],
        ),
    );
  }

  Future<void> _removeDemande({
    required BuildContext context,
    required int idEleveScolaire,
    required int idPers,
  }) async {

    final demandesAttestation =
    await appDatabase.demandesAttestationsDao.getDemandesAttestationsById(idEleveScolaire);
    if (demandesAttestation?.send == false) {
      return await appDatabase.demandesAttestationsDao.deleteDemandesAttestations(demandesAttestation!);
    }

    InputLogin login = authState.inputLogin!;
    final input = InputAttestation(
      id_personne: idPers,
      identifiant: login.identifiant,
      motdepasse: login.motdepasse,
      tokenmobile: login.tokenmobile,
      nombre_de_copies: 0,
    );

    final inputRemove = InputRemoveDemande(
      id_eleve_attestation_scolaire: idEleveScolaire,
      identifiant: login.identifiant,
      motdepasse: login.motdepasse,
      tokenmobile: login.tokenmobile,
    );

    if (networkState.isConnected) {
      final response = await http.post(Uri.parse(getUrl(UrlService.REMOVE_ATTESTATION)), body: {
        'inoface_ws': inputRemove.toString(),
      });

      RemoveDemandeModel model = removeDemandeModelFromJson(response.body);
      if (model.erreur) {
        showSnack(type: SnackBarType.error, message: model.message);
      } else {
        final attestationsModel = await attestationsLogic.getConcreteAttestations(input);
        await attestationsLogic.cacheAttestations(attestationsModel, idPers);
        showSnack(type: SnackBarType.success, title: model.message);
      }
    } else {
      final removeDemande = RemoveDemandesAttestation(
        send: false,
        id_personne: idPers,
        id_eleve_scolaire: idEleveScolaire,
      );
      await appDatabase.removeDemandesAttestationsDao.insertRemoveDemandesAttestations(removeDemande);
      final domand = await appDatabase.demandesAttestationsDao.getDemandesAttestationsById(idEleveScolaire);
      if (domand != null) {
        return await appDatabase.demandesAttestationsDao
            .updateDemandesAttestationById(
          idEleveScolaire: idEleveScolaire,
          remove: true, demand: domand,
        );
      }
    }
  }

  Future<void> checkSendAndRemoveDemandes([int? idPersonne]) async {
    InputLogin login = authState.inputLogin!;
    List<DemandesAttestation> demandesAttestation =
    await appDatabase.demandesAttestationsDao.getAllDemandesAttestationsBySend(false);
    if (demandesAttestation.isNotEmpty) {
      for (DemandesAttestation demande in demandesAttestation) {
        final input = InputAttestation(
          nombre_de_copies: demande.nombre_de_copies,
          id_personne: demande.id_personne_eleve,
          identifiant: login.identifiant,
          tokenmobile: login.tokenmobile,
          motdepasse: login.motdepasse,
        );
        await attestationsLogic.addAttestations(input);

        DemandeAttestationsModel attestationsModel = await attestationsLogic.getConcreteAttestations(input);
        logger.i("attestationsModel: ${attestationsModel.demandesAttestations}");
        await attestationsLogic.cacheAttestations(attestationsModel, demandesAttestation.first.id_personne_eleve);
      }
    }

    List<RemoveDemandesAttestation> listRemove = await appDatabase.removeDemandesAttestationsDao.getAllRemoveDemandesAttestations();
    logger.i('listRemove: ${listRemove.length}');

    if (listRemove.isNotEmpty) {
      for (RemoveDemandesAttestation val in listRemove) {
        final input = InputAttestation(
          id_personne: val.id_personne,
          identifiant: login.identifiant,
          motdepasse: login.motdepasse,
          tokenmobile: login.tokenmobile,
          nombre_de_copies: 0,
        );

        final inputRemove = InputRemoveDemande(
            id_eleve_attestation_scolaire: val.id_eleve_scolaire,
            identifiant: login.identifiant,
            motdepasse: login.motdepasse,
            tokenmobile: login.tokenmobile);

        await _sendRemove(inputRemove, input, val.id_personne);
      }
    } else if (idPersonne != null) {
      final input = InputAttestation(
        id_personne: idPersonne,
        identifiant: login.identifiant,
        motdepasse: login.motdepasse,
        tokenmobile: login.tokenmobile,
        nombre_de_copies: 0,
      );

      DemandeAttestationsModel model = await attestationsLogic.getConcreteAttestations(input);
      if (!model.erreur) {
        await attestationsLogic.cacheAttestations(model, idPersonne);
      }
    }
  }

  Future<void> _sendRemove(InputRemoveDemande inputRemove, InputAttestation input, int idPers) async {
    try {

      final response = await http.post(Uri.parse(getUrl(UrlService.REMOVE_ATTESTATION)), body: {
        'inoface_ws': inputRemove.toString(),
      });

      logger.i("response: ${response.body}");
      RemoveDemandeModel model = removeDemandeModelFromJson(response.body);
      if (model.erreur) {
        showSnack(type: SnackBarType.error, message: model.message);
      } else {
        // await appDatabase.deleteAllRemoveDemandesAttestationsByIdEleveScolaire(inputRemove.id_eleve_attestation_scolaire);
        await appDatabase.removeDemandesAttestationsDao.deleteAllByIdEleve(id: inputRemove.id_eleve_attestation_scolaire);
        DemandeAttestationsModel attestationsModel = await attestationsLogic.getConcreteAttestations(input);
        await attestationsLogic.cacheAttestations(attestationsModel, idPers);
      }
    } catch (e) {
      logger.e('e');
    }
  }


  Future<List<ParentNotification>> getAllParentNotifications() async {
    return await appDatabase.parentNotificationsDao.getAllParentNotifications();
  }

  Future<ParentNotification?> getParentNotificationsById({required int idNotify}) async {
    return await appDatabase.parentNotificationsDao.getParentNotificationsById(idNotify: idNotify);
  }

  Future<EnfantsModel> getConcreteEnfants(InputLogin login) async {
    try {
      final response = await http.post(
          Uri.parse(utilsLogic.getUrl(UrlService.enfants)),
          body: {'inoface_ws': login.toString()},
      );

      if (kDebugMode) {
        logger.i('getConcreteEnfants: ${response.statusCode}');
        logger.i('getConcreteEnfants: ${response.body}');
      }

      if (response.statusCode == 200) {
        await cacheEnfantsResponse(response.body);
      }
      return enfantsModelFromJson(response.body);
    } catch (e) {
      throw ServerException(
        message: '$e',
        state: RequestState.error,
      );
    }
  }

  Future<MainCountsModel> getConcreteMainCount(InputMainCounts mainCounts) async {
    try {
      final response = await http.post(
         Uri.parse(utilsLogic.getUrl(UrlService.mainCount)), body: {
         'inoface_ws': mainCounts.toString(),
      });

      if (kDebugMode) {
        log('getConcreteMainCount: ${response.body}');
      }

      return mainCountsModelFromJson(response.body);
    } catch (e) {
      throw ServerException(
        message: '$e',
        state: RequestState.error,
      );
    }
  }

  Future<void> cacheEnfantsResponse(String body) async {
    await prefs.setString(Keys.CACHED_ENFANTS_RESPONSE, body);
  }

  Future<void> cacheEnfants(EnfantsModel enfants) async {
    try {
      await prefs.setBool(
        Keys.RECUPERATION_ENFANT_OPTION,
        enfants.recuperation_enfant_option,
      );

      // await db.deleteAllEnfants();
      await appDatabase.delete(appDatabase.enfants).go();
      await appDatabase.delete(appDatabase.emploitemps).go();
      await appDatabase.delete(appDatabase.seances).go();
      await appDatabase.delete(appDatabase.enseignants).go();

      await appDatabase.enfantsDao.insertAllEnfant(enfants.enfants);
      for (EnfantModel model in enfants.enfants) {
        await appDatabase.emploitempsDao.insertAllEmploitemp(model.emploitemps);
        for(EmploitempModel emploitemp in model.emploitemps) {
          await appDatabase.seancesDao.insertAllSeance(emploitemp.seances);
          for (SeanceModel seance in emploitemp.seances) {
            if (seance.enseignant != null) {
              await appDatabase.enseignantsDao.insertEnseignant(seance.enseignant!);
            }
          }
        }
      }

    } catch(e) {
      throw CacheException(
        message: "$e",
        state: RequestState.cache,
      );
    }
  }

  Future<EnfantsModel> getLastEnfantsResponse() {
    final jsonString = prefs.getString(Keys.CACHED_ENFANTS_RESPONSE);
    if (jsonString != null) {
      logger.i(jsonString);
      return Future.value(enfantsModelFromJson(jsonString));
    } else {
      throw CacheFailure(
        message: "no_data_failure".tr,
        state: RequestState.error,
      );
    }
  }

  Future<void> cacheCounterByIdPersonne(MainCountsModel countsModel) async {
    await appDatabase.countersDao.insertCounter(countsModel);
    log('counts--> ${countsModel.toJson()}');
  }

  Future<Either<Failure, EnfantsModel>> getInit(InputLogin login) async {
    await networkLogic.hasConnection();
    if (networkState.isConnected) {
      try {
        LoginModel model = await authLogic.getConcreteLogin(login);
        await authLogic.cachePersonnes(model);
        await authLogic.cacheRoles(model);
        List<Role> roles = await appDatabase.rolesDao.getAllRole();
        if (utilsLogic.checkInitHome(roles)) {
          EnfantsModel enfants = await getConcreteEnfants(login);
          await cacheEnfants(enfants);
          if (checkEnfants(enfants)) {
            for (Enfant enf in enfants.enfants) {
              logger.i('has_devoir: ${enf.has_devoir}');
              final inputMain = InputMainCounts(
                identifiant: login.identifiant,
                motdepasse: login.motdepasse,
                tokenmobile: login.tokenmobile,
                id_personne: enf.id_personne,
              );
              final countsModel = await getConcreteMainCount(inputMain);
              await cacheCounterByIdPersonne(countsModel);
              // await cacheCounterModel(countsModel);
            }
            await checkSendAndRemoveDemandes();

            //! Get Counters If Saved
            final identifiant = '${login.identifiant}${login.codeSchool}';
            await initCounters(identifiant);
            await initEnfants();
          }
          return Right(enfants);
        }
        return Left(NoDataFailure(
          message: 'no_data_failure'.tr,
          state: RequestState.cache,
        ));
      } on ServerException catch (failure) {
        return Left(ServerFailure(
          message: failure.message,
          state: failure.state,
        ));
      }
    } else {
      try {
        EnfantsModel enfants = await getLastEnfantsResponse();
        return Right(enfants);
      } on CacheException catch (failure) {
        logger.e("error_connection".tr);
        return Left(CacheFailure(
          message: failure.message,
          state: failure.state,
        ));
      }
    }
  }

  Future<void> initCounters(String identifiant) async {
    try {
      //! Init Counters
      final stringEvent = boxSetting.get(identifiant+Keys.event);
      logger.i('Get Counters: $stringEvent');
      if (stringEvent != null) {
        List<CountEvenement> rows = List<CountEvenement>.from(json.decode(stringEvent).map((x) => CountEvenement.fromJson(x)));
        await appDatabase.delete(appDatabase.countEvenements).go();
        await appDatabase.countEvenementsDao.insertAllCountEvenement(rows);
        await boxSetting.delete(identifiant+Keys.event);
      }

      final stringInfo = boxSetting.get(identifiant+Keys.info);
      logger.i('Get Counters: $stringInfo');
      if (stringInfo != null) {
        List<CountInformation> rows = List<CountInformation>.from(json.decode(stringInfo).map((x) => CountInformation.fromJson(x)));
        logger.i('CountInformation: $rows');
        await appDatabase.delete(appDatabase.countInformations).go();
        await appDatabase.countInformationsDao.insertAllCountInformation(rows);
        await boxSetting.delete(identifiant+Keys.info);
      }

      final stringHoliday = boxSetting.get(identifiant+Keys.holiday);
      logger.i('Get Counters: $stringHoliday');
      if (stringHoliday != null) {
        List<CountJoursFerie> rows = List<CountJoursFerie>.from(json.decode(stringHoliday).map((x) => CountJoursFerie.fromJson(x)));
        logger.i('CountJoursFerie: $rows');
        await appDatabase.delete(appDatabase.countJoursFeries).go();
        await appDatabase.countJoursFeriesDao.insertAllCountJoursFerie(rows);
        await boxSetting.delete(identifiant+Keys.holiday);
      }

      final stringNotify = boxSetting.get(identifiant+Keys.notify);
      logger.i('Get Counters: $stringNotify');
      if (stringNotify != null) {
        List<CountNotification> rows = List<CountNotification>.from(json.decode(stringNotify).map((x) => CountNotification.fromJson(x)));
        logger.i('CountNotification: $rows');
        await appDatabase.delete(appDatabase.countNotifications).go();
        await appDatabase.countNotificationsDao.insertAllCountNotification(rows);
        await boxSetting.delete(identifiant+Keys.notify);
      }

      final stringSurvey = boxSetting.get(identifiant+Keys.survey);
      logger.i('Get Counters: $stringSurvey');
      if (stringSurvey != null) {
        List<CountSondage> rows = List<CountSondage>.from(json.decode(stringSurvey).map((x) => CountSondage.fromJson(x)));
        logger.i('CountSondage: $rows');
        await appDatabase.delete(appDatabase.countSondages).go();
        await appDatabase.countSondagesDao.insertAllCountSondage(rows);
        await boxSetting.delete(identifiant+Keys.survey);
      }
      logger.i('Get Counters');

    } catch(e) {
      logger.e(e);
    }
  }

  void setEnfant(Enfant? val, [bool listener = true]) {
    state.enfant = val;
    if (listener) {
      update();
    }
    if (kDebugMode) log('=== Enfant ${state.enfant?.id_personne}');
  }

  void setEnfants(List<Enfant> val) {
    state.enfants.clear();
    state.enfants.addAll(val);
  }

  Future<String?> getEmploitempsPdfById({required int idPersonne}) async {
    final enfant = await appDatabase.enfantsDao.getEnfantById(idPersonne);
    if (enfant != null && enfant.emploitempspdf != null) {
      return enfant.emploitempspdf;
    } else {
      return null;
    }
  }

  Future<void> initEnfants() async {
    List<Enfant> resultList = await appDatabase.enfantsDao.getEnfantByDate();
    if (resultList.isNotEmpty) setEnfants(resultList);

    //! init enfant cache
    final result = getCacheEnfant();
    if (result != null) {
      setEnfant(result);
      await updateCounter(idPer: result.id_personne);
    } else if (resultList.isNotEmpty) {
      await cacheEnfant(resultList.first);
      setEnfant(resultList.first);
      await updateCounter(idPer: resultList.first.id_personne);
    } else {
      throw CacheException(
        message: "no_data_failure".tr,
        state: RequestState.cache,
      );
    }

    if (state.enfant != null) {
      final idPersonne = state.enfant!.id_personne;
      await updateCounter(idPer: idPersonne);

      InputSurvey? input = surveyLogic.getInputSurvey(idPersonne: idPersonne);
      if (input != null) {
        final model = await surveyLogic.getConcreteSurveyModel(input);
        await surveyLogic.cacheSurvey(model);
      }
    } else {
      throw CacheException(
        message: "no_data_failure".tr,
        state: RequestState.cache,
      );
    }
  }

  Enfant? getCacheEnfant() {
    final inputLogin = authState.inputLogin;
    final identifiant = '${inputLogin?.identifiant}${inputLogin?.codeSchool}';
    final json = prefs.getString(Keys.CACHE_ENFANT) ?? boxSetting.get(Keys.CACHE_ENFANT2+identifiant);
    logger.i('getCacheEnfant: $json');
    if (json != null) {
      return Enfant.fromJson(jsonDecode(json));
    } else {
      return null;
    }
  }

  Future<Enfant?> getEnfantById(int idPersonne) async {
    return await appDatabase.enfantsDao.getEnfantById(idPersonne);
  }


  Future<void> cacheEnfant(Enfant? enf) async {
    if (enf != null) {
      await prefs.setString(Keys.CACHE_ENFANT, enf.toJsonString());
      final inputLogin = authState.inputLogin;
      if (inputLogin != null) {
        final identifiant = '${inputLogin.identifiant}${inputLogin.codeSchool}';
        await boxSetting.put(Keys.CACHE_ENFANT2+identifiant, enf.toJsonString());
      }
    }
  }

  bool checkEnfants(EnfantsModel entity) {
    try {
      if (!entity.erreur) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      utilsLogic.showSnack(type: SnackBarType.error, message: '$e');
      return false;
    }
  }

  Future<void> checkInfoEnfants() async {
    try {
      final login = authState.inputLogin;
      if (login != null) {
        await authLogic.getAuth(login);
      }
    } catch (e) {
      utilsLogic.showSnack(type: SnackBarType.error, message: '$e');
      logger.e(e);
    }
  }

  String checkTextEnfant(Enfant? enfant) {
    try {
      if (enfant != null) {
        return enfant.prenom;
      } else {
        return '---';
      }
    } catch (e) {
      return '---';
    }
  }

  Future<bool> cacheDialog(BuildContext context, NavigatorState navigator) async {
    return await showDialog(context: context,
      builder: (context) => AlertDialog(
        title: Text('delete_selection'.tr),
        content: Text('delete_cache'.tr),
        actions: <Widget>[
          TextButton(
            child: Text('cancel'.tr),
            onPressed: () => navigator.pop(false),
          ),
          TextButton(
            child: Text('delete'.tr),
            onPressed: () => navigator.pop(true),
          ),
        ],
      ),
    ) ?? false;
  }

  Future<bool> logoutDialog(BuildContext context) async {
    return await showDialog(context: context,
      builder: (context) => AlertDialog(
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          color: Colors.pink,
          height: 55,
          child: Center(child: Icon(MdiIcons.logout, color: Colors.white)),
        ),
        content: Text('log_out_msg'.tr,
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          TextButton(
            child: Text('cancel'.tr),
            onPressed: () => Navigator.pop(context, false),
          ),
          TextButton(
            child: Text('log_out'.tr),
            onPressed: () => Navigator.pop(context, true)
          ),
        ],
      ),
    ) ?? false;
  }

  Future<void> changeEnfant({
    required BuildContext context,
    required NavigatorState navigator,
  }) async {
    return await showDialog(context: context,
      builder: (context) => AlertDialog(
        titlePadding: const EdgeInsets.all(0),
        contentPadding: const EdgeInsets.all(2),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        title: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.pink,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ClipOval(
                child: CachedNetworkImage(
                  height: 45, width: 45,
                  imageUrl: UrlService.rewriteInoserUri('${utilsState.enfant?.photo}'),
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => Center(
                    child: Image.asset(AppImage.defaultPhoto,
                      height: 45, width: 45,
                    ),
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '${utilsState.enfant?.prenom}',
                textAlign: TextAlign.center,
                style: titleTextStyle.copyWith(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: utilsState.enfants.map((element) => Center(
            child: utilsState.enfant?.id_personne == element.id_personne
                ? const SizedBox.shrink()
                : InkWell(
              onTap: () async {
                LoadingDialog.show(context: context);
                setEnfant(element);
                await initSwitchEleve(idPer: element.id_personne);
                await updateCounter(idPer: element.id_personne);
                await cacheEnfant(element);
                if (context.mounted) LoadingDialog.hide(context: context);
                navigator.pop();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          ClipOval(
                            child: CachedNetworkImage(
                              height: 45, width: 45,
                              imageUrl: UrlService.rewriteInoserUri('${element.photo}'),
                              placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) => Center(
                                child: Image.asset(AppImage.defaultPhoto,
                                  height: 45, width: 45,
                                ),
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            element.prenom,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.circle_outlined)
                  ],
                ),
              ),
            ),
          )).toList(),
        ),
      ),
    );
  }


  /*
  void onError(Object error) async {
    String deviceName = '';
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidDeviceInfo = await state.deviceInfo.androidInfo;
      deviceName = androidDeviceInfo.manufacturer;
      deviceName = '${androidDeviceInfo.manufacturer}, '
          'systemVersion: ${androidDeviceInfo.version.sdkInt}, ${androidDeviceInfo.version.release}';
    } else if (Platform.isIOS) {
      IosDeviceInfo iosDeviceInfo = await state.deviceInfo.iosInfo;
      deviceName = '${iosDeviceInfo.utsname.nodename}, systemVersion: ${iosDeviceInfo.systemVersion}';
    }

    firestore.collection(Keys.error).add({
      'loginInfo': '${authLogic.getCashLogin()}',
      'enfant': '${utilsLogic.state.enfant?.toJson()}',
      'timestamp': FieldValue.serverTimestamp(),
      'codeSchool': '${prefs.getString(Keys.CODE_SCHOOL)}',
      'deviceName': deviceName,
      'platform': Platform.isAndroid ? 'Android' : 'iOS',
      'osVersion': Platform.operatingSystemVersion,
      'version': state.version,
      'message': '$error',
    });
  }
  */



  Future<http.Response> retryPost({
    required String url,
    required Map<String, dynamic> body,
  }) async {
    Future<http.Response> post(String requestUrl) {
      return http.post(Uri.parse(requestUrl), body: body)
          .timeout(const Duration(seconds: 20));
    }

    bool shouldRetry(Object e) =>
        e is SocketException ||
        e is TimeoutException ||
        e is HandshakeException ||
        e is http.ClientException;

    try {
      return await retry(
        () => post(url),
        retryIf: shouldRetry,
        maxAttempts: 2,
      );
    } catch (e) {
      final fallbackUrl = UrlService.httpFallback(url);
      if (fallbackUrl != url) {
        logger.w('HTTPS request failed ($e). Retrying over HTTP: $fallbackUrl');
        return await retry(
          () => post(fallbackUrl),
          retryIf: shouldRetry,
          maxAttempts: 2,
        );
      }
      rethrow;
    }
  }


  Future<void> initSwitchEleve({required int idPer}) async {
    //! Informations
    final infoInput = await informationsLogic.getInputInformations(idPer);
    final modelInfo = await informationsLogic.getConcreteInformations(infoInput);
    await informationsLogic.cacheInformations(modelInfo, idPer);

    //! Evenements
    final eventInput = await evenementLogic.getInputEvenements(idPer);
    final modelEvent = await evenementLogic.getConcreteEvenements(eventInput);
    await evenementLogic.cacheEvenements(modelEvent, idPer);
  }


  Future<void> changeAccount({required AccountModel account}) async {
    if (account.codeSchool != null) {

      //! Save Counters Before Logout
      final inputLogin = authState.inputLogin;
      if (inputLogin != null) {
        final identifiant = '${inputLogin.identifiant}${inputLogin.codeSchool}';

        List<CountEvenement> countEvenement = await appDatabase.countEvenementsDao.getAllCountEvenement();
        if (countEvenement.isNotEmpty) {
          var jsonEvenement = jsonEncode(countEvenement.map((e) => e.toJson()).toList());
          await boxSetting.put(identifiant+Keys.event, jsonEvenement);
          logger.i('Save Counters: $jsonEvenement');
        }

        List<CountInformation> countInformation = await appDatabase.countInformationsDao.getAllCountInformation();
        if (countInformation.isNotEmpty) {
          var jsonInformation = jsonEncode(countInformation.map((e) => e.toJson()).toList());
          await boxSetting.put(identifiant+Keys.info, jsonInformation);
          logger.i('Save Counters: $jsonInformation');
        }

        List<CountJoursFerie> countJoursFerie = await appDatabase.countJoursFeriesDao.getAllCountJoursFerie();
        if (countJoursFerie.isNotEmpty) {
          var jsonJoursFerie = jsonEncode(countJoursFerie.map((e) => e.toJson()).toList());
          await boxSetting.put(identifiant+Keys.holiday, jsonJoursFerie);
          logger.i('Save Counters: $jsonJoursFerie');
        }

        List<CountNotification> countNotification = await appDatabase.countNotificationsDao.getAllCountNotification();
        if (countNotification.isNotEmpty) {
          var jsonNotification = jsonEncode(countNotification.map((e) => e.toJson()).toList());
          await boxSetting.put(identifiant+Keys.notify, jsonNotification);
          logger.i('Save Counters: $jsonNotification');
        }

        List<CountSondage> countSondage = await appDatabase.countSondagesDao.getAllCountSondage();
        if (countSondage.isNotEmpty) {
          var jsonSondage = jsonEncode(countSondage.map((e) => e.toJson()).toList());
          await boxSetting.put(identifiant+Keys.survey, jsonSondage);
          logger.i('Save Counters: $jsonSondage');
        }
       logger.i('Save Counters');
      }

      
      await logOut(listener: false).then((_) async {

        String? nameSchool = account.nameSchool;
        if (nameSchool != null) {
          await prefs.setString(Keys.ECOLE_NAME, nameSchool);
        }

        await prefs.setString(Keys.CODE_SCHOOL, account.codeSchool!);
        await authLogic.cacheLoginInput(InputLogin(
          identifiant: account.identifiant,
          tokenmobile: account.tokenmobile,
          motdepasse: account.motdepasse,
          codeSchool: account.codeSchool,
          ecolename: account.nameSchool,
        ));

        Get.offAll(() => const InitHome());
      });
    }
  }

}