// import 'package:inoface/features/login/domain/usecases/input_login.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:inoface/core/util/keys.dart';
// import 'package:logger/logger.dart';
// import 'dart:async' show Future;
// import 'dart:convert';
//
//
//
// class PreferenceUtils {
//
//   static Future<SharedPreferences> get _instance async => _prefsInstance ??= await SharedPreferences.getInstance();
//   static SharedPreferences _prefsInstance;
//   static PreferenceUtils _preferenceUtils;
//   static var logger = Logger();
//
//   // call this method from iniState() function of mainApp().
//   static Future<PreferenceUtils> init() async {
//     _prefsInstance ??= await _instance;
//     _preferenceUtils ??= PreferenceUtils();
//     return _preferenceUtils;
//   }
//
//   static String getString(String key, [String defValue]) {
//     return _prefsInstance.getString(key) ?? defValue ?? "";
//   }
//
//   static bool getBool(String key, [bool defValue]) {
//     return _prefsInstance.getBool(key) ?? defValue ?? false;
//   }
//
//   static bool containsKey(String key, [bool defValue]) {
//     return _prefsInstance.containsKey(key) ?? defValue ?? false;
//   }
//
//   static Future<bool> setString(String key, String value) async {
//     return await _prefsInstance?.setString(key, value) ?? Future.value(false);
//   }
//
//   static Future<bool> setBool(String key, bool value) async {
//     return await _prefsInstance?.setBool(key, value) ?? Future.value(false);
//   }
//
//   static Future<bool> removeKey(String key, [bool defValue]) async {
//     return await _prefsInstance.remove(key) ?? defValue ?? false;
//   }
//
//   static List<String> getKeys() {
//     return _prefsInstance.getKeys().toList();
//   }
//
//   static InputLogin getInputLogin() {
//     try {
//       final loginJson = _prefsInstance.getString(Keys.CACHED_LOGIN_INPUT);
//       if (loginJson != null) {
//         logger.i(loginJson);
//         return InputLogin.fromJson(json.decode(loginJson));
//       } else {
//         return null;
//       }
//     } catch(e) {
//       logger.e(e);
//       _prefsInstance.remove(Keys.CACHED_LOGIN_INPUT);
//       return null;
//     }
//   }
//
//
//   // static PreferenceUtils _instance;
//   // static SharedPreferences _preferences;
//   // static Future<PreferenceUtils> getInstance() async {
//   //   if (_instance == null) {
//   //     _instance = PreferenceUtils();
//   //   }
//   //   if (_preferences == null) {
//   //     _preferences = await SharedPreferences.getInstance();
//   //   }
//   //   return _instance;
//   // }
// }
