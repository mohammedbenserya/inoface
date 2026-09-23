import 'package:inoface/features/init_home/presentation/pages/init_home.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:inoface/widget_helper/responsive_safe_area.dart';
import 'package:inoface/widget_helper/loading_dialog.dart';
import 'package:inoface/widget_helper/splash_app.dart';
import 'package:inoface/core/usecases/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import '../core/util/app_image.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';



class ErrorApp extends StatelessWidget {
  final String? message;
  const ErrorApp({
    Key? key,
    this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveSafeArea(
      bottom: false,
      builder: (context) => Scaffold(
        body: Center(
          child: Container(
            width: Get.width,
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'oops'.tr,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Lottie.asset(AppImage.jsonError, height: Get.height/3),
                  const SizedBox(height: 5),
                  Text(
                    message ?? 'something_wrong'.tr,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.josefinSans(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: Get.width - 100,
                    child: ElevatedButton.icon(
                      icon: Icon(MdiIcons.refresh),
                      label: Text('try_again'.tr),
                      onPressed: () => Get.offAll(() => SplashApp(
                        child: const InitHome(),
                      )),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: Get.width - 100,
                    child: ElevatedButton.icon(
                      icon: Icon(MdiIcons.alert),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
                        ),
                      ),
                      label: Text('rest'.tr),
                      onPressed: () async {
                        LoadingDialog.show(context: context);
                        await utilsLogic.logOut(listener: false);
                        if (context.mounted) LoadingDialog.hide(context: context);
                        Get.offAll(() => SplashApp(
                          child: const InitHome(),
                        ));
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
