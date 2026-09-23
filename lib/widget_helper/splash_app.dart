import 'package:inoface/features/login/presentation/pages/login_page.dart';
import 'package:inoface/widget_helper/responsive_safe_area.dart';
import 'package:inoface/core/usecases/constants.dart';
import 'package:inoface/widget_helper/error_app.dart';
import '../features/login/models/input_login.dart';
import 'package:flutter/material.dart';
import '../core/util/app_image.dart';
import 'package:get/get.dart';
import 'dart:math' as math;



late Widget _home;
late bool _initServices;

class SplashApp extends StatefulWidget {
  SplashApp({
    required Widget child,
    bool initServices = true,
    Key? key,
  }) : super(key: key) {
    _home = child;
    _initServices = initServices;
  }

  @override
  _SplashAppState createState() => _SplashAppState();
}

class _SplashAppState extends State<SplashApp> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late Image logoImage;

  @override
  void initState() {
    super.initState();
    logoImage = Image.asset(
      AppImage.logo,
      width: Get.width / 2,
      height: Get.width / 2,
      fit: BoxFit.contain,
    );
    _initAnimation();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_initServices) {
        initServices();
      }
    });
  }

  void _initAnimation() {
    try {
      _animationController = AnimationController(
        duration: const Duration(seconds: 5),
        vsync: this,
      );

      final curvedAnimation = CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
        reverseCurve: Curves.easeOut,
      );

      _animation = Tween<double>(begin: 0, end: 2 * math.pi).animate(curvedAnimation)
        ..addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            _animationController.reverse();
          } else if (status == AnimationStatus.dismissed) {
            _animationController.forward();
          }
        });
      _animationController.forward();
    } catch (e) {
      _animationController.dispose();
    }
  }

  Future<void> initServices() async {
    try {
      InputLogin? login = authLogic.getCashLogin();
      await networkLogic.hasConnection();
      if (networkState.isConnected) {
        if (login != null) {
          await utilsLogic.initEnfants();
        }
        Get.offAll(() => (login != null) ? _home : const LoginPage());
      } else {
        return Get.offAll(() => ErrorApp(
          message: 'error_connection'.tr,
        ));
      }
    } catch (e) {
      logger.e(e);
      Get.offAll(() => ErrorApp(message: '$e'));
    }
  }


  @override
  void didChangeDependencies() {
    precacheImage(logoImage.image, context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveSafeArea(
      bottom: false,
      builder: (_) => Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SizedBox(
            width: Get.width / 2,
            height: Get.width / 2,
            child: FadeTransition(
              opacity: _animation,
              child: logoImage,
            ),
          ),
        ),
      )
    );
  }
}
