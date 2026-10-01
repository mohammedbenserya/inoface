import 'package:inoface/features/account/models/account_model.dart';
import 'package:inoface/core/usecases/enums.dart';
import 'package:inoface/core/util/keys.dart';
import '../../init_home/models/input_main_counts.dart';
import '../../init_home/models/main_counts_model.dart';
import '../../../widget_helper/loading_dialog.dart';
import '../models/get_url_from_qrcode_model.dart';
import '../../../core/database/app_database.dart';
import '../../../core/models/enfants_model.dart';
import '../../../core/usecases/constants.dart';
import '../../../core/util/url_service.dart';
import '../../../core/error/exceptions.dart';
import '../../../core/error/failures.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../../../core/util/boxes.dart';
import 'package:flutter/material.dart';
import '../entities/login_entity.dart';
import '../models/input_qrcode.dart';
import '../models/input_login.dart';
import '../models/login_model.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import '../../../main.dart';
import 'auth_state.dart';
import 'dart:developer';
import 'dart:convert';
import 'dart:async';



class AuthLogic extends GetxController {
  static AuthLogic instance = Get.find();
  final boxAccount = Boxes.account();
  final boxSetting = Boxes.settings();
  final state = AuthState();

  @override
  void onInit() {
    getCashLogin();
    super.onInit();
  }


  Future<Either<Failure, LoginEntity>> getAuth(InputLogin login) async {
    if (networkState.isConnected) {
      try {
        LoginModel model = await getConcreteLogin(login);
        if (model.erreur == false) {
          await cacheLoginInput(login);
          await cachePersonnes(model);
          await cacheRoles(model);
          logger.i('entity: ${model.erreur}');
          if (utilsLogic.checkRole(model)) {
            EnfantsModel enfants = await getConcreteEnfants(login);
            if (utilsLogic.checkEnfants(enfants)) {
              await prefs.setBool(
                Keys.RECUPERATION_ENFANT_OPTION,
                enfants.recuperation_enfant_option,
              );
              await cacheEnfants(enfants);
              logger.i('cacheEnfants: ${enfants.toJson()}');
              for (Enfant enf in enfants.enfants) {
                final inputMain = InputMainCounts(
                  identifiant: login.identifiant,
                  motdepasse: login.motdepasse,
                  tokenmobile: login.tokenmobile,
                  id_personne: enf.id_personne,
                );
                await getConcreteMainCount(inputMain);
              }
            }
          }
        }

        if (model.ecolename != model.ecolename) {
          await prefs.setString(Keys.ECOLE_NAME, '${model.ecolename}');
        }

        final account = AccountModel(
          identifiant: model.personneModel?.identifiant ?? login.identifiant,
          codeSchool: model.personneModel?.ecolecode,
          tokenmobile: model.personneModel?.token,
          motdepasse: model.motdepasse ?? login.motdepasse,
          nameSchool: login.ecolename,
        );
        await boxAccount.put('${account.identifiant}${account.codeSchool}', account);

        return Right(model);
      } on ServerException catch (failure) {
        return Left(ServerFailure(
          message: failure.message,
          state: failure.state,
        ));
      }
    } else {
      try {
        LoginModel entity = getLastResponse();
        return Right(entity);
      } on CacheException catch (failure) {
        return Left(CacheFailure(
          message: failure.message,
          state: failure.state,
        ));
      }
    }
  }

  Future<Either<Failure, LoginEntity>> getAuthQrCode(InputQrcode login) async {
    if (networkState.isConnected) {
      try {
        LoginModel model = await getConcreteQrCode(login);
        if (!model.erreur) {
          await cacheLoginInput(InputLogin(
            codeSchool: model.personneModel?.ecolecode,
            identifiant: model.personne!.identifiant!,
            motdepasse: model.motdepasse!,
            tokenmobile: login.tokenmobile,
            ecolename: model.ecolename,
          ));
          await cachePersonnes(model);
          await cacheRoles(model);

          if (utilsLogic.checkRole(model)) {
            EnfantsModel enfants = await getConcreteEnfants(InputLogin(
              codeSchool: model.personneModel?.ecolecode,
              identifiant: model.personne!.identifiant!,
              tokenmobile: login.tokenmobile,
              motdepasse: model.motdepasse!,
              ecolename: model.ecolename,
            ));
            if (utilsLogic.checkEnfants(enfants)) {
              await prefs.setBool(Keys.RECUPERATION_ENFANT_OPTION, enfants.recuperation_enfant_option);
              await cacheEnfants(enfants);
              for (Enfant enf in enfants.enfants) {
                final inputMain = InputMainCounts(
                  identifiant: model.personne!.identifiant!,
                  motdepasse: model.motdepasse!,
                  tokenmobile: login.tokenmobile,
                  id_personne: enf.id_personne,
                );
                await getConcreteMainCount(inputMain);
              }
            }
          }
        }

        if (model.ecolename != null) {
          await prefs.setString(Keys.ECOLE_NAME, '${model.ecolename}');
        }

        final account = AccountModel(
          identifiant: model.personneModel!.identifiant!,
          motdepasse: model.motdepasse!,
          tokenmobile: model.personneModel?.token,
          codeSchool: model.personneModel?.ecolecode,
          nameSchool: model.ecolename,
        );
        await boxAccount.put('${account.identifiant}${account.codeSchool}', account);
        return Right(model);
      } on ServerException catch (failure) {
        return Left(ServerFailure(
          message: failure.message,
          state: failure.state,
        ));
      }
    } else {
      return Left(NetworkFailure(
        message: "error_connection".tr,
        state: RequestState.network,
      ));
    }
  }


  Future<LoginModel> checkAuthInputLogin(InputLogin login) async {
    return await getConcreteNewAccount(login);
  }

  Future<AccountModel?> getAuthNewAccount(BuildContext context, InputLogin login) async {
    if (networkState.isConnected) {
      try {
        AccountModel? account;
        LoadingDialog.show(context: context);
        LoginModel model = await getConcreteNewAccount(login);
        if (model.erreur == false) {
          account = AccountModel(
            identifiant: model.personneModel?.identifiant ?? login.identifiant,
            motdepasse: model.motdepasse ?? login.motdepasse,
            codeSchool: model.personneModel?.ecolecode,
            tokenmobile: model.personneModel?.token,
            nameSchool: login.ecolename,
          );

          final key = '${account.identifiant}${account.codeSchool}';
          if (boxAccount.containsKey(key)) {
            utilsLogic.showSnack(type: SnackBarType.error, message: 'account_already_exists'.tr);
            return null;
          } else {
            await boxAccount.put(key, account);
          }
        } else {
          utilsLogic.showSnack(type: SnackBarType.error, message: model.message);
        }
        if (context.mounted) LoadingDialog.hide(context: context);
        return account;
      } catch (e) {
        if (context.mounted) LoadingDialog.hide(context: context);
        logger.e(e);
        utilsLogic.showSnack(type: SnackBarType.error, message: '$e');
      }
    }
    return null;
  }

  Future<void> cacheLoginResponse(String body) async {
    await prefs.setString(Keys.CACHED_LOGIN_RESPONSE, body);
  }

  Future<void> cacheLoginInput(InputLogin inputLogin) async {
    await prefs.setString(Keys.CACHED_LOGIN_INPUT, json.encode(inputLogin.toJson()));
    authLogic.setInputLogin(inputLogin);
  }

  LoginModel getLastResponse() {
    final jsonString = prefs.getString(Keys.CACHED_LOGIN_RESPONSE);
    if (jsonString != null) {
      logger.i(jsonString);
      return loginModelFromJson(jsonString);
    } else {
      throw CacheException(
        state: RequestState.cache,
        message: 'no_data_failure'.tr,
      );
    }
  }

  Future<void> cachePersonnes(LoginModel model) async {
    try {
      if (model.personneModel != null) {
        await appDatabase.personnesDao.insertPersonne(model.personneModel!);
      }
    } catch (e) {
      throw CacheException(
        state: RequestState.error,
        message: '$e',
      );
    }
  }

  Future<void> cacheRoles(LoginModel model) async {
    try {
      if (model.personneModel != null) {
        await appDatabase.rolesDao.insertAllRole(model.personneModel!.roles);
      }
    } catch (e) {
      throw CacheException(
        state: RequestState.error,
        message: '$e',
      );
    }
  }

  Future<void> cacheEnfantsResponse(String body) async {
    await prefs.setString(Keys.CACHED_ENFANTS_RESPONSE, body);
  }

  Future<void> cacheEnfants(EnfantsModel enfants) async {
    try {

      await appDatabase.delete(appDatabase.enfants).go();
      await appDatabase.delete(appDatabase.emploitemps).go();
      await appDatabase.delete(appDatabase.seances).go();
      await appDatabase.delete(appDatabase.enseignants).go();

      await appDatabase.enfantsDao.insertAllEnfant(enfants.enfants);

      for (EnfantModel model in enfants.enfants) {
        await appDatabase.emploitempsDao.insertAllEmploitemp(model.emploitemps);
        for (EmploitempModel emploitemp in model.emploitemps) {
          await appDatabase.seancesDao.insertAllSeance(emploitemp.seances);
          for (SeanceModel seance in emploitemp.seances) {
            if (seance.enseignant != null) {
              await appDatabase.enseignantsDao.insertEnseignant(seance.enseignant!);
            }
          }
        }
      }
    } catch (e) {
      throw CacheException(
        state: RequestState.error,
        message: '$e',
      );
    }
  }

  Future<LoginModel> getConcreteLogin(InputLogin login) async {
    if (kDebugMode) {
      logger.i("getConcreteLogin: ${utilsLogic.getUrl(UrlService.loginInface)}");
      logger.i("getConcreteLogin: ${login.toJson()}");
    }

    final response = await utilsLogic.retryPost(
        url: utilsLogic.getUrl(UrlService.loginInface),
        body: {'inoface_ws': login.toString()}
    );

    if (kDebugMode) {
      logger.i("getConcreteLogin: ${response.statusCode}, ${response.body}");
    }

    final model = loginModelFromJson(response.body);
    if (response.statusCode == 200 && model.erreur == false) {
      await cacheLoginResponse(response.body);
    } else if (model.erreur) {
      final key ='${login.identifiant}${login.codeSchool}';
      if (boxAccount.containsKey(key)) {
        await boxAccount.delete(key);
        await boxSetting.delete(key+Keys.event);
        await boxSetting.delete(key+Keys.info);
        await boxSetting.delete(key+Keys.holiday);
        await boxSetting.delete(key+Keys.notify);
        await boxSetting.delete(key+Keys.survey);
      }

      await utilsLogic.logOut(
        identifiant: login.identifiant,
        logoutApi: true,
        listener: false,
      );

      throw ServerException(
        state: RequestState.error,
        message: model.message,
      );
    }
    return model;
  }

  Future<LoginModel> getConcreteNewAccount(InputLogin login) async {
    try {
      final url = UrlService.schoolJson(login.codeSchool, UrlService.loginInface);
      final response = await utilsLogic.retryPost(
        url: url, body: {'inoface_ws': login.toString()}
      );

      if (kDebugMode) {
        logger.i('response: ${response.body}');
      }

      final model = loginModelFromJson(response.body);
      if (response.statusCode == 200 && model.erreur == false) {
        await cacheLoginResponse(response.body);
      }

      return model;
    } catch (e) {
      logger.e(e);
      throw ServerException(
        state: RequestState.error,
        message: '$e',
      );
    }
  }

  Future<LoginModel> getConcreteQrCode(InputQrcode login) async {
    try {
      const url = UrlService.GET_URL_QRCODE;
      final responseUrl = await http.post(Uri.parse(url), body: {
        'inoface_ws': login.toString(),
      });

      GetUrlFromQrcodeModel qrcodeModel = getUrlFromQrcodeModelFromJson(responseUrl.body);
      if (!qrcodeModel.erreur) {
        await prefs.setString(Keys.CODE_SCHOOL, qrcodeModel.ecolecode!);
      }
      final response = await http.post(Uri.parse(utilsLogic.getUrl(UrlService.QRCODE)), body: {
        'inoface_ws': login.toString(),
      });
      if (response.statusCode != 200) {
        await cacheLoginResponse(response.body);
      }
      return loginModelFromJson(response.body);
    } catch (e) {
      throw ServerException(
        state: RequestState.error,
        message: '$e',
      );
    }
  }

  Future<EnfantsModel> getConcreteEnfants(InputLogin login) async {
    try {
      logger.i("getConcreteEnfants: enfants_ws: ${login.toJson()}");
      final response = await http.post(
        Uri.parse(utilsLogic.getUrl(UrlService.enfants)),
        body: {'inoface_ws': login.toString()},
      );

      if (kDebugMode) {
        log('getConcreteEnfants: ${response.body}');
      }

      if (response.statusCode == 200) {
        await cacheEnfantsResponse(response.body);
      }
      return enfantsModelFromJson(response.body);
    } catch (e) {
      throw ServerException(
        state: RequestState.error,
        message: '$e',
      );
    }
  }


  Future<MainCountsModel> getConcreteMainCount(InputMainCounts mainCounts) async {
    try {
      final response = await http.post(
        Uri.parse(utilsLogic.getUrl(UrlService.mainCount)), body: {
        'inoface_ws': mainCounts.toString(),
      });

      if (response.statusCode == 200) {
        MainCountsModel model = mainCountsModelFromJson(response.body);
        await appDatabase.countersDao.insertCounter(model);
      }
      return mainCountsModelFromJson(response.body);
    } catch (e) {
      throw ServerException(
        state: RequestState.error,
        message: '$e',
      );
    }
  }

  void setInputLogin(InputLogin? val) {
    state.inputLogin = val;
    update();
  }

  InputLogin? getCashLogin() {
    try {
      String? data = prefs.getString(Keys.CACHED_LOGIN_INPUT);
      if (data != null) {
        final login = inputLoginFromJson(data);
        setInputLogin(login);
        return login;
      }
    } catch (e) {
      logger.e(e);
      if (prefs.containsKey(Keys.CACHED_LOGIN_INPUT)) {
        prefs.remove(Keys.CACHED_LOGIN_INPUT);
      }
    }
    return null;
  }

  Future<AccountModel?> getAuthQrCodeMultiAcc(InputQrcode login) async {
    if (networkState.isConnected) {
      try {
        AccountModel? account;
        LoginModel model = await getConcreteQrCodeMultiAcc(login);
        if (model.erreur == false && model.personneModel != null) {
          account = AccountModel(
            identifiant: model.personneModel!.identifiant!,
            motdepasse: model.motdepasse!,
            tokenmobile: model.personneModel?.token,
            codeSchool: model.personneModel?.ecolecode,
            nameSchool: model.ecolename,
          );
          final key = '${account.identifiant}${account.codeSchool}';
          if (boxAccount.containsKey(key)) {
            utilsLogic.showSnack(type: SnackBarType.error, message: 'account_already_exists'.tr);
            return null;
          } else {
            await boxAccount.put(key, account);
          }
        } else {
          utilsLogic.showSnack(type: SnackBarType.error, message: model.message);
        }
        return account;
      } catch (e) {
        logger.e(e);
        utilsLogic.showSnack(type: SnackBarType.error, message: '$e');
      }
    } else {
      utilsLogic.showSnack(type: SnackBarType.unconnected);
    }
    return null;
  }

  Future<LoginModel> getConcreteQrCodeMultiAcc(InputQrcode login) async {
    try {
      const url = UrlService.GET_URL_QRCODE;
      final responseUrl = await http.post(Uri.parse(url), body: {
        'inoface_ws': login.toString(),
      });

      GetUrlFromQrcodeModel qrcodeModel = getUrlFromQrcodeModelFromJson(responseUrl.body);
      log('qrcodeModel====>: ${qrcodeModel.toJson()}');
      final urlQRCode = UrlService.schoolJson(qrcodeModel.ecolecode ?? '', UrlService.QRCODE);
      final response = await http.post(Uri.parse(urlQRCode), body: {
        'inoface_ws': login.toString(),
      });
      if (kDebugMode) {
        logger.i('response: ${response.body}');
      }
      return loginModelFromJson(response.body);
    } catch (e) {
      logger.e(e);
      throw ServerException(
        state: RequestState.error,
        message: '$e',
      );
    }
  }

}