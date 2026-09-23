import 'package:inoface/features/DemandeRecuperation/presentation/pages/demande_recuperation_page.dart';
import 'package:inoface/features/reservations/presentation/pages/reservations_data_page.dart';
import 'package:inoface/features/notification/presentation/pages/notifications_page.dart';
import 'package:inoface/features/attestations/presentation/pages/attestations_page.dart';
import 'package:inoface/features/informations/presentation/pages/informations_page.dart';
import 'package:inoface/features/jours_feries/presentation/pages/jours_feries_page.dart';
import 'package:inoface/features/evenements/presentation/pages/evenements_page.dart';
import 'package:inoface/features/agenda/presentation/pages/agenda_config_page.dart';
import 'package:inoface/features/timetable/presentation/pages/timetable_page.dart';
import 'package:inoface/features/settings/presentation/pages/settings_page.dart';
import 'package:inoface/features/home/presentation/pages/gallery_page.dart';
import 'package:inoface/features/chat/presentation/pages/chat_page.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:inoface/features/account/models/account_model.dart';
import 'package:inoface/widget_helper/responsive_safe_area.dart';
import 'package:inoface/features/home/models/circle_select.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';
import '../../../devoir/presentation/pages/date_devoir_page.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../notes/presentation/screens/notes_screen.dart';
import 'package:inoface/core/util/str_helper.dart';
import 'package:inoface/core/usecases/enums.dart';
import '../../../survey/presentation/pages/survey_page.dart';
import '../../../../core/controllers/utils/utils_logic.dart';
import '../../../../core/util/generateMaterialColor.dart';
import 'package:inoface/core/util/boxes.dart';
import 'package:inoface/core/util/keys.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../../../../core/usecases/constants.dart';
import '../../entities/notification_entity.dart';
import 'package:after_layout/after_layout.dart';
import 'package:showcaseview/showcaseview.dart';
import '../../../../core/util/app_image.dart';
import 'package:badges/badges.dart' as badge;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';




BuildContext? globalContext;


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> with
    SingleTickerProviderStateMixin, AfterLayoutMixin<HomePage>,
    AutomaticKeepAliveClientMixin {

  final boxSettings = Boxes.settings();
  final GlobalKey _one = GlobalKey();
  BuildContext? myContext;
  late AssetImage bgImage;

  @override
  void initState() {
    bgImage = const AssetImage(AppImage.bg);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyFirebaseLogic.getNotificationAppLaunch(context);
    });
    super.initState();
  }


  @override
  bool get wantKeepAlive => true;

  @override
  void didChangeDependencies() {
    precacheImage(bgImage, context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    globalContext = context;
    return ResponsiveSafeArea(
      builder: (context) {
        return Scaffold(
          backgroundColor: backgroundColor,
          body: Column(
            children: <Widget>[
              Container(
                color: primaryColor,
                child: ShowCaseWidget(
                  onFinish: () => boxSettings.put(Keys.SHOW_CASE1, false),
                  builder: Builder(
                    builder: (BuildContext context) {
                      if (utilsState.enfants.length > 1) {
                        myContext = context;
                      }
                      return Padding(
                        padding: const EdgeInsets.only(top: 16, left: 8, right: 8, bottom: 6),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Container(
                                margin: const EdgeInsets.only(top: 6, left: 20),
                                child: Showcase(
                                  key: _one,
                                  description: 'show_case1'.tr,
                                  child: InkWell(
                                      borderRadius: BorderRadius.circular(100),
                                      onTap: () async {
                                        if (networkState.isConnected == false) {
                                          return utilsLogic.showSnack(type: SnackBarType.unconnected);
                                        } else if (myContext != null) {
                                          final navigator = Navigator.of(context);
                                          await utilsLogic.changeEnfant(
                                            navigator: navigator,
                                            context: context,
                                          ).then((value) async {
                                            final idPersonne = utilsState.enfant?.id_personne;
                                            if (idPersonne != null) {
                                              await surveyLogic.initSurveyByIdPersonne(
                                                idPersonne: idPersonne,
                                                context: context,
                                              );
                                            }
                                          });
                                        }
                                      },
                                      child: GetBuilder<UtilsLogic>(
                                        builder: (logic) {
                                          final enfant = logic.state.enfant;
                                          return Wrap(
                                            children: [
                                              RippleAnimation(
                                                repeat: true,
                                                color: Colors.white,
                                                minRadius: 13,
                                                ripplesCount: 30,
                                                child: ClipRRect(
                                                  borderRadius: const BorderRadius.all(Radius.circular(100)),
                                                  child: Container(
                                                    padding: const EdgeInsets.all(0),
                                                    margin: const EdgeInsets.all(0),
                                                    color: Colors.white,
                                                    width: 60,
                                                    height: 60,
                                                    child: CachedNetworkImage(
                                                      cacheManager: DefaultCacheManager(),
                                                      imageUrl: '${enfant?.photo}',
                                                      progressIndicatorBuilder: (context, url, downloadProgress) =>
                                                          CircularProgressIndicator(value: downloadProgress.progress),
                                                      // placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                                                      errorWidget: (context, url, error) => Center(
                                                        child: Image.asset(AppImage.defaultPhoto),
                                                      ),
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    AutoSizeText(
                                                      '${enfant?.prenom} ${enfant?.nom}',
                                                      textAlign: TextAlign.center,
                                                      maxLines: 1,
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                    AutoSizeText(
                                                      '${enfant?.classe}',
                                                      textAlign: TextAlign.center,
                                                      maxLines: 1,
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 16,
                                                        height: 1.2,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      )
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (prefs.getBool(Keys.RECUPERATION_ENFANT_OPTION)??false)
                                  IconButton(
                                    icon: Icon(
                                      MdiIcons.carSide,
                                      color: Colors.white,
                                      size: 28,
                                    ),
                                    onPressed: () => Get.to(() => const DemandeRecuperationPage()),
                                  ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.menu,
                                    color: Colors.white,
                                    size: 28,
                                  ),
                                  onPressed: () => Get.to(() => const SettingsPage()),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),

              Expanded(
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: bgImage,
                            opacity: 0.6,
                          ),
                        ),
                      ),
                    ),
                    ListView(
                      shrinkWrap: true,
                      children: <Widget>[
                        const SizedBox(height: 8),
                        GetBuilder<UtilsLogic>(
                          builder: (logic) {
                            final counters = logic.state.counters;
                            final enfant = logic.state.enfant;
                            if (enfant != null) {
                              return Wrap(
                                spacing: 30,
                                alignment: WrapAlignment.center,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: CircleSelect.initCircles(counters, enfant).map((element) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.all(Radius.circular(100)),
                                      child: Container(
                                        padding: const EdgeInsets.all(0),
                                        margin: const EdgeInsets.all(0),
                                        width: 120,
                                        height: 120,
                                        color: Colors.white,
                                        child: InkWell(
                                          onTap: () {
                                            switch (element.id) {
                                              case 1:
                                                Get.to(() => const JoursFeriesPage());
                                                break;
                                              case 2:
                                                Get.to(() => const EvenementsPage());
                                                break;
                                              case 3:
                                                Get.to(() => const InformationsPage());
                                                break;
                                              case 4:
                                                Get.to(() => const ChatPage());
                                                break;
                                              case 5:
                                                Get.to(() => const AgendaConfigPage());
                                                break;
                                              case 6:
                                                Get.to(() => const GalleryPage());
                                                break;
                                              case 8:
                                                Get.to(() => const AttestationsPage());
                                                break;
                                              case 9:
                                                Get.to(() => const TimetablePage());
                                                break;
                                              case 10:
                                                Get.to(() => const ReservationsDataPage());
                                                break;
                                              case 11:
                                                Get.to(() => const DateDevoirPage());
                                                break;
                                              case 12:
                                                Get.to(() => const NotificationsPage());
                                                break;
                                              case 13:
                                                Get.to(() => const SurveyPage());
                                                break;
                                              case 14:
                                                Get.to(() => const NotesScreen());
                                                break;
                                            }
                                          },
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: <Widget>[
                                              element.counts == 0
                                                  ? Icon(
                                                element.iconData,
                                                color: Colors.pink,
                                                size: 45,
                                              ) : badge.Badge(
                                                badgeContent: Text(
                                                  "${element.counts}",
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                // badgeColor: Colors.pink,
                                                badgeStyle: const badge.BadgeStyle(
                                                  badgeColor: Colors.pink,
                                                ),
                                                child: Icon(
                                                  element.iconData,
                                                  color: Colors.pink,
                                                  size: 45,
                                                ),
                                              ),
                                              Flexible(
                                                child: Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 8),
                                                  child: AutoSizeText(
                                                    element.name,
                                                    textAlign: TextAlign.center,
                                                    maxLines: 2,
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              );
                            } else {
                              return const SizedBox.shrink();
                            }
                          },
                        ),
                        const SizedBox(height: 90),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: ClipPath(
                        clipper: OvalTopBorderClipper(),
                        child: Container(
                          height: 70,
                          // color: prim,
                          color: primaryColor,
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  StrHelper.INOFACE,
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                                if (prefs.getString(Keys.ECOLE_NAME) != null)
                                  Text(
                                    '${prefs.getString(Keys.ECOLE_NAME)}',
                                    maxLines: 1,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }


  @override
  void afterFirstLayout(BuildContext context) async {
    final boxAccount = Boxes.account();
    bool isFirst = boxSettings.get(Keys.SHOW_CASE1, defaultValue: utilsLogic.isFirstShowCase());
    if (isFirst) {
      Future.delayed(const Duration(milliseconds: 1000), () {
        if (myContext != null) {
          ShowCaseWidget.of(myContext!).startShowCase([_one]);
        }
      });
    }

    utilsLogic.checkInfoEnfants();
    await utilsLogic.askForPermissions();

    if (!mounted) return;
    await utilsLogic.checkNotes(context);

    if (!mounted) return;
    await utilsLogic.checkVersion(context);

    if (!mounted) return;
    surveyLogic.checkSurveyStatue(context);


    // bool initAccount = boxSettings.get(Keys.initAccount, defaultValue: false);
    if (authState.inputLogin != null) {
      final account = AccountModel(
        identifiant: authState.inputLogin!.identifiant,
        motdepasse: authState.inputLogin!.motdepasse,
        tokenmobile: authState.inputLogin?.tokenmobile,
        codeSchool: authState.inputLogin?.codeSchool ?? prefs.getString(Keys.CODE_SCHOOL),
        nameSchool: authState.inputLogin?.ecolename ?? prefs.getString(Keys.ECOLE_NAME),
      );

      final key = '${account.identifiant}${account.codeSchool}';
      if (boxAccount.containsKey(key) == false) {
        await boxAccount.put(key, account);
      }
      // await boxSettings.put(Keys.initAccount, true);
    }

    final cacheNotify = await boxSettings.get(Keys.cacheNotify);
    if (cacheNotify != null) {
      logger.i('cacheNotify: $cacheNotify');
      await boxSettings.delete(Keys.cacheNotify);
      final entity = NotificationEntity.fromJson(json.decode(cacheNotify));
      final page = await notifyFirebaseLogic.checkTypeMessage(entity);
      if (page != null) {
        Get.to(() => page);
      }
    }
  }
}
