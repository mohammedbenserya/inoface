import 'package:inoface/features/forgot_pass/presentation/pages/forgot_pass_page.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:inoface/features/login/bloc/login_bloc.dart';
import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';
import 'package:inoface/core/usecases/constants.dart';
import 'package:inoface/core/util/boxes.dart';
import 'package:inoface/core/util/keys.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/util/app_image.dart';
import '../../models/input_qrcode.dart';
import '../../models/input_login.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;
import 'dart:async';



class InitialLogin extends StatefulWidget {
  final TextEditingController identifiantController;
  final TextEditingController passwordController;
  final TextEditingController codeController;
  const InitialLogin({Key? key,
  required this.identifiantController,
  required this.passwordController,
  required this.codeController,
  }) : super(key: key);

  @override
  _InitialLoginState createState() => _InitialLoginState();
}

class _InitialLoginState extends State<InitialLogin> with SingleTickerProviderStateMixin {
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
    return Scaffold(
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
                    controller: widget.identifiantController,
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
                    controller: widget.passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: _obscureText,
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
                    controller: widget.codeController,
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
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [


                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () => Get.to(() => const ForgotPassPage()),
                          child: Text(
                            'forgot_pass'.tr,
                            style: GoogleFonts.tajawal(
                              color: Theme.of(context).primaryColor,
                              decoration: TextDecoration.underline,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
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
                        if (_formKey.currentState?.validate() ?? false) {
                          await prefs.setString(
                            Keys.CODE_SCHOOL,
                            widget.codeController.text.trim(),
                          );
                          if (!mounted) return;

                          context.read<LoginBloc>().add(
                            Login(login: InputLogin(
                              tokenmobile: await notifyFirebaseLogic.getToken(),
                              identifiant: widget.identifiantController.text.trim(),
                              motdepasse: utilsLogic.generateMd5(
                                widget.passwordController.text.trim(),
                              ),
                            )),
                          );
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
        context.read<LoginBloc>().add(
          LoginQRCode(InputQrcode(
            scancode: barcodeScanRes,
            tokenmobile: await notifyFirebaseLogic.getToken(),
          )),
        );
      }
    } on PlatformException {
      // Failed to scan barcode
    }
  }
}
