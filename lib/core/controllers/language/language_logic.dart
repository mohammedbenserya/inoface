import 'package:inoface/core/usecases/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../util/boxes.dart';
import '../../util/keys.dart';
import 'language_state.dart';


class LanguageLogic extends GetxController {
  static LanguageLogic instance = Get.find();
  final state = LanguageState();
  final box = Boxes.settings();

  @override
  void onInit() {
    initLocale();
    super.onInit();
  }

  void initLocale() {
    try {
      final langCode = box.get(Keys.locale, defaultValue: 'fr');
      state.locale = Locale(langCode);
      update();
      Get.updateLocale(state.locale);
    } catch (e) {
      logger.e(e);
    }
  }

  Locale getLocale() {
    try {
      final langCode = box.get(Keys.locale, defaultValue: 'fr');
      state.locale = Locale(langCode);
      update();
      return state.locale;
    } catch (e) {
      logger.e(e);
      return state.locale;
    }
  }

  bool isLtr() {
    String locale = box.get(Keys.locale, defaultValue: 'fr');
    final lung = Get.locale ?? Locale(locale);
    return lung.languageCode == 'ar';
  }

  Locale getSystemLocale() {
    String locale = box.get(Keys.locale, defaultValue: 'fr');
    return Get.deviceLocale ?? Locale(locale);
  }

  Future<void> updateLocal(String langCode) async {
    await box.put(Keys.locale, langCode);
    state.locale = Locale(langCode);
    update();
    Get.updateLocale(state.locale);
    logger.i('lang: $langCode');
  }

}