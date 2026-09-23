import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:inoface/widget_helper/responsive_safe_area.dart';
import 'package:inoface/core/util/generateMaterialColor.dart';
import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';
import 'package:inoface/core/usecases/constants.dart';
import 'package:inoface/core/usecases/enums.dart';
import 'package:inoface/core/util/boxes.dart';
import '../../../login/models/input_qrcode.dart';
import '../../../login/models/input_login.dart';
import '../../../../core/util/app_image.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;
import 'dart:async';



class AddNewAccount extends StatefulWidget {
  const AddNewAccount({Key? key}) : super(key: key);

  @override
  _AddNewAccountState createState() => _AddNewAccountState();
}

class _AddNewAccountState extends State<AddNewAccount>
    with SingleTickerProviderStateMixin {
  final TextEditingController _identifiantController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late AnimationController animController;
  late Animation<double> animation;
  final box = Boxes.loginInfo();
  bool _obscureText = true;


  @override
  void initState() {
    super.initState();
    _initAnimation();
  }

  void _initAnimation() {
    try {
      animController = AnimationController(
        duration: const Duration(seconds: 5),
        vsync: this,
      );
      final curvedAnimation = CurvedAnimation(
        parent: animController,
        curve: Curves.easeIn,
        reverseCurve: Curves.easeOut,
      );

      animation = Tween<double>(begin: 0, end: 2 * math.pi).animate(curvedAnimation)
        ..addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            animController.reverse();
          } else if (status == AnimationStatus.dismissed) {
            animController.forward();
          }
        });
      animController.forward();
    } catch (e) {
      animController.dispose();
    }
  }

  @override
  void dispose() {
    animController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return ResponsiveSafeArea(
      bottom: false,
      builder: (_) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios,
              color: primaryColor,
            ),
            onPressed: () => Get.back(),
          ),
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 18, right: 18, bottom: 30),
                child: Column(
                  children: <Widget>[

                    SizedBox(
                      height: Get.height/5.2,
                      child: Hero(
                        tag: AppImage.logo,
                        child: FadeTransition(
                          opacity: animation,
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Image.asset(
                              AppImage.logo,
                              height: Get.height/5.2,
                              // height: 80,
                            ),
                          ),
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: _identifiantController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'identifiant'.tr,
                        icon: Icon(MdiIcons.account),
                      ),
                      validator: (val) {
                        final field = val ?? '';
                        if (field.isEmpty) {
                          return 'required_field'.tr;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: _obscureText,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        labelText: 'password'.tr,
                        icon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText ? Icons.visibility : Icons.visibility_off,
                            color: Theme.of(context).primaryColorDark,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                      ),
                      validator: (val) {
                        final field = val ?? '';
                        if (field.isEmpty) {
                          return 'required_field'.tr;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _codeController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'code_school'.tr,
                        icon: Icon(MdiIcons.homeCity),
                      ),
                      validator: (val) {
                        final field = val ?? '';
                        if (field.isEmpty) {
                          return 'required_field'.tr;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: Get.width,
                      child: ElevatedButton.icon(
                        icon: Icon(MdiIcons.account),
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ))),
                        label: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Text('login'.tr),
                        ),
                        onPressed: () async {
                          if (networkState.isConnected) {
                            if (_formKey.currentState?.validate() ?? false) {
                              final login = InputLogin(
                                tokenmobile: await notifyFirebaseLogic.getToken(),
                                identifiant: _identifiantController.text.trim(),
                                codeSchool: _codeController.text.trim(),
                                motdepasse: utilsLogic.generateMd5(
                                  _passwordController.text.trim(),
                                ),
                              );
                              if (context.mounted) {
                                await authLogic.getAuthNewAccount(context, login).then((account) async {
                                  if (account != null) {
                                    await utilsLogic.changeAccount(account: account);
                                  }
                                });
                              }
                            }
                          } else {
                            utilsLogic.showSnack(type: SnackBarType.unconnected);
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: Get.width,
                      child: ElevatedButton.icon(
                        icon: Icon(MdiIcons.qrcodeScan, color: Colors.white),
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
                          ),
                        ),
                        onPressed: initQR,
                        label: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Text(
                            'login_qr'.tr,
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> initQR() async {
    try {
      final String? barcodeScanRes = await Navigator.of(context).push<String>(
        MaterialPageRoute(
          builder: (context) => AiBarcodeScanner(
            onDetect: (BarcodeCapture capture) {
              Navigator.of(context).pop(capture.barcodes.first.rawValue);
            },
          ),
        ),
      );
      if (!mounted) return;
      if (barcodeScanRes != null &&
          barcodeScanRes.isNotEmpty &&
          barcodeScanRes != '-1') {
        await authLogic.getAuthQrCodeMultiAcc(InputQrcode(
          tokenmobile: await notifyFirebaseLogic.getToken(),
          scancode: barcodeScanRes,
        )).then((account) async {
          if (account != null) {
            await utilsLogic.changeAccount(account: account);
          }
        });
      }
    } on PlatformException {
      // Failed to scan barcode
    }
  }
}