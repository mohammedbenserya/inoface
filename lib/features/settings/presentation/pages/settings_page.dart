import 'package:inoface/features/account/presentation/screens/account_screen.dart';
import 'package:inoface/features/settings/presentation/widgets/app_tutorial.dart';
import 'package:inoface/features/login/presentation/pages/login_page.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:inoface/widget_helper/responsive_safe_area.dart';
import 'package:inoface/core/util/generateMaterialColor.dart';
import 'package:inoface/core/usecases/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

import '../../../../core/util/boxes.dart';
import '../../../../core/util/keys.dart';
import '../../../account/models/account_model.dart';
import '../../../init_home/presentation/pages/init_home.dart';
import '../../../login/models/input_login.dart';



class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  final boxSetting = Boxes.settings();
  final boxAccount = Boxes.account();

  void logOut() async {
    final accounts = boxAccount.values.toList().cast<AccountModel>();
    final inputLogin = authState.inputLogin;
    if (accounts.length > 1) {
      final key ='${inputLogin?.identifiant}${inputLogin?.codeSchool}';
      accounts.removeWhere((e) => e.identifiant == inputLogin?.identifiant && e.codeSchool == inputLogin?.codeSchool);
      await boxAccount.delete(key);
      await boxSetting.delete(key+Keys.event);
      await boxSetting.delete(key+Keys.info);
      await boxSetting.delete(key+Keys.holiday);
      await boxSetting.delete(key+Keys.notify);
      await boxSetting.delete(key+Keys.survey);

      final account = accounts.first;
      await utilsLogic.logOut(listener: false, logoutApi: true, identifiant: inputLogin?.identifiant).then((_) async {
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
    } else {
      await utilsLogic.logOut(listener: false, logoutApi: true, identifiant: inputLogin?.identifiant).then((_) async {
        await Boxes.loginInfo().clear();
        await boxSetting.clear();
        await boxAccount.clear();
        if (context.mounted && Navigator.canPop(context)) {
          Navigator.pop(context);
        }
        Get.offAll(() => const LoginPage());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final version = utilsState.version;
    return ResponsiveSafeArea(
      color: primaryColor,
      bottom: false,
      builder: (context) => Scaffold(
        key: scaffoldState,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text('settings'.tr),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              ListTile(
                title: Text('app_tutorial'.tr),
                leading: Icon(MdiIcons.bookOpenPageVariant),
                onTap: () => Get.to(() => const AppTutorial()),
              ),
              const Divider(),
              ListTile(
                title: Text('version'.trArgs([version])),
                leading: Icon(Platform.isAndroid ? Icons.android : MdiIcons.apple),
              ),
              const Divider(),
              ListTile(
                title: Text('accounts'.tr),
                leading: Icon(MdiIcons.account),
                onTap: () => Get.to(() => const AccountScreen()),
              ),
              const Divider(),
              ListTile(
                title: Text('log_out'.tr),
                leading: Icon(MdiIcons.logout),
                onTap: () async {
                  bool logout = await utilsLogic.logoutDialog(context);
                  if (logout) {
                    logOut();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void longDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('choose_locale'.tr),
        content: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const Divider(),
            Flexible(
              child: TextButton(
                  child: const Text('Français 🇫🇷'),
                  onPressed: () {
                    languageLogic.updateLocal('fr');
                    Navigator.pop(context);
                  },
              ),
            ),
            Flexible(
              child: TextButton(
                  child: const Text('🇲🇦 العربية'),
                  onPressed: () {
                    languageLogic.updateLocal('ar');
                    Navigator.pop(context);
                  },
              ),
            )
          ],
        ),
      ),
    );
  }
}
