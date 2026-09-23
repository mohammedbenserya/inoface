import 'package:inoface/features/forgot_pass/models/input_forgot_pass.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:inoface/core/util/keys.dart';
import '../../../../core/usecases/constants.dart';
import '../../../../core/util/app_image.dart';
import '../../logic/forgot_pass_logic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;



class ForgotPassPage extends StatefulWidget {
  const ForgotPassPage({Key? key}) : super(key: key);

  @override
  State<ForgotPassPage> createState() => _ForgotPassPageState();
}

class _ForgotPassPageState extends State<ForgotPassPage> with SingleTickerProviderStateMixin {

  final TextEditingController _identifiantController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  final forgotPassLogic = Get.put(ForgotPassLogic());
  final _formKey = GlobalKey<FormState>();
  late AnimationController animController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    _initAnimation();
  }

  _initAnimation() {
    try {
      animController = AnimationController(duration: const Duration(seconds: 5), vsync: this);
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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.pink,
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
                mainAxisSize: MainAxisSize.min,
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
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: _identifiantController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'identifiant'.tr,
                      icon: Icon(MdiIcons.account),
                    ),
                    validator: (val) {
                      final field = val??'';
                      if (field.isEmpty) {
                        return 'required_field'.tr;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'email'.tr,
                      icon: Icon(MdiIcons.email),
                    ),
                    validator: (val) {
                      final field = val??'';
                      if (field.isEmpty) {
                        return 'required_field'.tr;
                      } else if (!GetUtils.isEmail(field)) {
                        return 'invalid_email'.tr;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: _codeController,
                    decoration: InputDecoration(
                      labelText: 'code_school'.tr,
                      icon: Icon(MdiIcons.homeCity),
                    ),
                    validator: (val) {
                      final field = val??'';
                      if (field.isEmpty) {
                        return 'required_field'.tr;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: Get.width,
                    child: ElevatedButton.icon(
                      icon: Icon(MdiIcons.lockReset),
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ))),
                      label: Padding(
                        padding: const EdgeInsets.only(top: 12, bottom: 12),
                        child: Text('init_pass'.tr),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState?.validate()??false) {
                          await prefs.setString(Keys.CODE_SCHOOL, _codeController.text.trim());
                          if (context.mounted) forgotPassLogic.resetPass(context: context, input: InputForgotPass(
                            identifiant: _identifiantController.text.trim(),
                            email: _emailController.text.trim(),
                          ));
                        }
                      },
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
}
