import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;
import '../util/hive_utils.dart';
import 'dart:io';


@module
abstract class RegisterModule {

  @preResolve
  Future<Directory> get directory => getApplicationDocumentsDirectory();

  @injectable //@lazySingleton // or @singleton
  http.Client get httpClient => http.Client();

  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @preResolve
  Future<HiveUtils> get hiveUtils => HiveUtils.init();

}
