import 'package:inoface/features/init_home/models/main_counts_model.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:inoface/core/database/app_database.dart';
import 'package:inoface/core/usecases/constants.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CircleSelect extends Equatable {

  final int id;
  final int counts;
  final String name;
  final IconData iconData;


  const CircleSelect({
    required this.id,
    required this.counts,
    required this.name,
    required this.iconData
  });

  @override
  List<Object> get props => [id, name, counts, iconData];


  static List<CircleSelect> initCircles(MainCountsModel count, Enfant enfant) {
    List<CircleSelect> init = [];
    try {
      init = [

        if (enfant.has_agenda) ...[
          CircleSelect(id: 5, name: 'agenda'.tr, iconData: MdiIcons.clipboardListOutline, counts: 0),
          CircleSelect(id: 6, name: 'gallery'.tr, iconData: MdiIcons.image, counts: 0),
        ],

        if (enfant.has_devoir)
          CircleSelect(id: 11, name: 'devoir'.tr, iconData: MdiIcons.bookOpenPageVariant, counts: 0),

        if (enfant.has_cantine??false)
          CircleSelect(id: 10, name: 'cantine'.tr, iconData: MdiIcons.silverware, counts: 0),

        CircleSelect(id: 12, name: 'notifications'.tr, iconData: MdiIcons.bellRing, counts: count.countNotifications),

        CircleSelect(id: 3, name: 'information'.tr, iconData: MdiIcons.informationOutline, counts: count.countInformations),

        CircleSelect(id: 2, name: 'event'.tr, iconData: MdiIcons.calendarStar, counts: count.countEvenements),

        CircleSelect(id: 8, name: 'certificates'.tr, iconData: MdiIcons.file, counts: 0),

        CircleSelect(id: 1, name: 'holiday'.tr, iconData: MdiIcons.calendarCheck, counts: count.countJoursFeries),

        CircleSelect(id: 9, name: 'timetable'.tr, iconData: MdiIcons.timetable, counts: 0),

        if (surveyState.sondages.isNotEmpty)
          CircleSelect(id: 13, name: 'survey'.tr, iconData: MdiIcons.listStatus, counts: count.countSondages),

        if (enfant.has_ControlesNotes??false)
          CircleSelect(id: 14, name: 'notes'.tr, iconData: MdiIcons.playlistEdit, counts: 0),
      ];
    } catch (e) {
      logger.e(e);
    }
    return init;
  }
}
