import 'package:flutter/material.dart';
import '../models/survey_model.dart';
import 'package:get/get.dart';


class SurveyState {

  late RxList<Widget> widgets;
  late RxInt currentIndex;
  late List<Sondage> sondages;
  // SurveyModel? surveyModel;


  SurveyState() {
    widgets = <Widget>[].obs;
    currentIndex = 0.obs;
    sondages = [];
    // surveyModel = null;
  }
}
