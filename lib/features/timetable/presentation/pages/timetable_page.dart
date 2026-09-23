import 'package:inoface/features/timetable/presentation/widgets/build_timetable.dart';
import 'package:inoface/features/timetable/presentation/widgets/timetable_pdf.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:inoface/widget_helper/responsive_safe_area.dart';
import 'package:inoface/core/database/app_database.dart';
import 'package:inoface/core/usecases/constants.dart';
import 'package:inoface/core/mobx/mobx_home.dart';
import 'package:inoface/core/util/app_image.dart';
import '../../../../core/util/generateMaterialColor.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:after_layout/after_layout.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../../main.dart';
import 'package:get/get.dart';
import 'dart:async';

class TimetablePage extends StatefulWidget {
  const TimetablePage({Key? key}) : super(key: key);

  @override
  State<TimetablePage> createState() => _TimetablePageState();
}

class _TimetablePageState extends State<TimetablePage>
    with AfterLayoutMixin<TimetablePage> {
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();
  final ScrollOffsetListener scrollOffsetListener =
      ScrollOffsetListener.create();
  final ItemScrollController itemScrollController = ItemScrollController();
  final MobxHome _mobx = MobxHome();
  DateTime now = DateTime.now();
  int? indexClickable;
  int index = 0;


  @override
  Widget build(BuildContext context) {
    final enfant = utilsState.enfant!;
    return ResponsiveSafeArea(
      builder: (_) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('timetable_page'.tr),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.picture_as_pdf,
                size: 35,
              ),
              onPressed: () =>
                  Get.to(() => TimetablePdf(idPersonne: enfant.id_personne)),
            ),
          ],
        ),
        backgroundColor: backgroundColor,
        body: FutureBuilder<List<Emploitemp>>(
          future: appDatabase.emploitempsDao.getEmploitempById(enfant.id_personne),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              default:
                final emploitemp = snapshot.data ?? [];
                if (emploitemp.isNotEmpty) {
                  return Column(
                    children: <Widget>[
                      Container(
                        height: 60,
                        color: primaryColor,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: emploitemp.length,
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          itemBuilder: (context, index) {
                            return Observer(
                              builder: (_) => TextButton(
                                // color: _mobx.index == index ? Colors.pink[100] : Colors.white,
                                child: Text(
                                  '${emploitemp[index].Jour}',
                                  style: TextStyle(
                                    decoration: _mobx.index == index
                                        ? TextDecoration.underline
                                        : null,
                                    color: _mobx.index == index
                                        ? Colors.white
                                        : Colors.white60,
                                    // color: Colors.white,
                                  ),
                                ),
                                onPressed: () async {
                                  indexClickable = index;
                                  _mobx.setIndex(index);
                                  await itemScrollController.scrollTo(
                                    duration: const Duration(milliseconds: 400),
                                    curve: Curves.easeInOutCubic,
                                    index: index,
                                  ).then((_) async {
                                    await Future.delayed(const Duration(seconds: 1));
                                    this.index = index;
                                    indexClickable = null;
                                  });
                                },
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 1),
                      Expanded(
                        child: ScrollablePositionedList.builder(
                          padding: const EdgeInsets.only(top: 8),
                          itemPositionsListener: itemPositionsListener,
                          scrollOffsetListener: scrollOffsetListener,
                          itemScrollController: itemScrollController,
                          itemCount: emploitemp.length,
                          itemBuilder: (context, index) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  padding: const EdgeInsets.only(
                                      left: 12, right: 12, top: 8),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      const Icon(
                                        Icons.calendar_today,
                                        color: Colors.black87,
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        '${emploitemp[index].Jour}',
                                        style: const TextStyle(
                                          fontSize: 18,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Flexible(
                                  child: FutureBuilder<List<Seance>>(
                                    future: appDatabase.seancesDao
                                        .getSeanceById(
                                            emploitemp[index].id_jour,
                                            enfant.id_personne),
                                    builder: (context, snapSeance) {
                                      switch (snapSeance.connectionState) {
                                        case ConnectionState.waiting:
                                          return const Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        default:
                                          final seances = snapSeance.data ?? [];
                                          return BuildTimetable(
                                              seance: seances);
                                      }
                                    },
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  );
                } else {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Lottie.asset(
                            AppImage.jsonEmpty,
                            width: Get.width / 1.5,
                          ),
                          Text(
                            'empty_emploi'.tr,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                }
            }
          },
        ),
      ),
    );
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) async {
    try {
      if (now.weekday > 1 && now.weekday <= 5) {
        index = now.weekday - 1;
        _mobx.setIndex(index);
        await Future.delayed(const Duration(milliseconds: 300));
        itemScrollController.jumpTo(index: index);
        await Future.delayed(const Duration(milliseconds: 300));
        itemScrollController.scrollTo(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOutCubic,
          index: index,
        );

        itemPositionsListener.itemPositions.addListener(() {
          int? indexPosition = itemPositionsListener.itemPositions.value.firstOrNull?.index;

          if (kDebugMode) {
            print('indexClickable: $indexClickable');
            print('indexClickable2: ${indexPosition != null && index != indexPosition}');
          }

          if (indexClickable != null) return;
          if (indexPosition != null && index != indexPosition) {
            index = indexPosition;
            _mobx.setIndex(index);
            itemScrollController.scrollTo(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOutCubic,
              index: index,
            );
          }
        });
      }
    } catch (e) {
      logger.e(e);
    }
  }
}
