import 'package:inoface/widget_helper/responsive_safe_area.dart';
import 'package:inoface/core/util/generateMaterialColor.dart';
import 'package:inoface/widget_helper/loading_dialog.dart';
import 'package:inoface/core/usecases/enums.dart';
import '../../../../core/usecases/constants.dart';
import '../../../login/models/input_login.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../../core/util/boxes.dart';
import '../../../../core/util/keys.dart';
import '../../models/account_model.dart';
import '../widgets/add_new_account.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputLogin = authState.inputLogin;
    return ResponsiveSafeArea(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text('accounts'.tr),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Expanded(
                child: ValueListenableBuilder<Box<AccountModel>>(
                  valueListenable: Boxes.account().listenable(),
                  builder: (context, box, widget) {
                    final accounts = box.values.toList().cast<AccountModel>();
                    return ListView.builder(
                      itemCount: accounts.length,
                      itemBuilder: (context, index) {
                        final account = accounts[index];
                        Color? color = (inputLogin?.identifiant == account.identifiant && inputLogin?.codeSchool == account.codeSchool) ? Colors.pink : null;
                        bool isCurrentAcc = (inputLogin?.identifiant == account.identifiant && inputLogin?.codeSchool == account.codeSchool);
                        return Card(
                          child: ListTile(
                            title: Text(account.identifiant,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: color,
                              ),
                            ),
                            subtitle: (account.nameSchool != null) ?
                            Text('${account.nameSchool}',
                              style: TextStyle(
                                color: color?.withOpacity(0.6),
                              ),
                            ) : null,
                            trailing: (isCurrentAcc) ?
                            Icon(
                              Icons.check_circle_outline,
                              color: primaryColor,
                            ) : IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () async {
                                final key ='${account.identifiant}${account.codeSchool}';
                                await box.delete(key);
                                final boxSetting = Boxes.settings();
                                await boxSetting.delete(key+Keys.event);
                                await boxSetting.delete(key+Keys.info);
                                await boxSetting.delete(key+Keys.holiday);
                                await boxSetting.delete(key+Keys.notify);
                                await boxSetting.delete(key+Keys.survey);
                              },
                            ),
                            leading: Icon(
                              Icons.supervisor_account,
                              color: color,
                            ),
                            onTap: () async {
                              logger.i('isCurrentAcc: $isCurrentAcc');
                              if (isCurrentAcc == false) {
                                try {
                                  LoadingDialog.show(context: context);
                                  final login = InputLogin(
                                    identifiant: account.identifiant,
                                    tokenmobile: account.tokenmobile,
                                    motdepasse: account.motdepasse,
                                    codeSchool: account.codeSchool,
                                    ecolename: account.nameSchool,
                                  );
                                  final loginModel = await authLogic.checkAuthInputLogin(login);
                                  if (context.mounted) LoadingDialog.hide(context: context);
                                  if (context.mounted && loginModel.erreur == false) {
                                    await utilsLogic.changeAccount(account: account);
                                  } else {
                                    utilsLogic.showSnack(type: SnackBarType.error, message: loginModel.message);
                                    final key ='${account.identifiant}${account.codeSchool}';
                                    await box.delete(key);
                                    final boxSetting = Boxes.settings();
                                    await boxSetting.delete(key+Keys.event);
                                    await boxSetting.delete(key+Keys.info);
                                    await boxSetting.delete(key+Keys.holiday);
                                    await boxSetting.delete(key+Keys.notify);
                                    await boxSetting.delete(key+Keys.survey);
                                  }
                                } catch(e) {
                                  utilsLogic.showSnack(type: SnackBarType.error, message: '$e');
                                  if (context.mounted) {
                                    LoadingDialog.hide(context: context);
                                  }
                                }
                              }
                            }
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              Card(
                // margin: EdgeInsets.zero,
                color: Colors.pink,
                child: ListTile(
                  leading: const Icon(Icons.add, color: Colors.white),
                  onTap: () => Get.to(() => const AddNewAccount()),
                  title: Text('add_account'.tr,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
