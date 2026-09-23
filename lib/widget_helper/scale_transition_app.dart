import 'package:inoface/widget_helper/responsive_safe_area.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../core/util/app_image.dart';
import 'package:get/get.dart';



late Widget _home;

class ScaleTransitionApp extends StatefulWidget {
  ScaleTransitionApp({
    required Widget child,
    bool isInitServices = true,
    Key? key,
  }) : super(key: key) {
    _home = child;
  }

  @override
  _ScaleTransitionAppState createState() => _ScaleTransitionAppState();
}

class _ScaleTransitionAppState extends State<ScaleTransitionApp> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _animation;
  late Image logoImage;

  @override
  void initState() {
    super.initState();
    logoImage = Image.asset(
      AppImage.logo,
      fit: BoxFit.contain,
      width: Get.width / 2,
      height: Get.width / 2,
    );
    _controller = AnimationController(
        duration: const Duration(milliseconds: 1600), vsync: this);
    _animation = Tween(
      begin: 0.4,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ));
    _controller.forward();
    nextScreen();
  }

  void nextScreen() {
    Future.delayed(const Duration(milliseconds: 1400))
        .then((value) => Get.offAll(() => _home));
  }


  @override
  void didChangeDependencies() {
    precacheImage(logoImage.image, context);
    super.didChangeDependencies();
  }


  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return ResponsiveSafeArea(
      bottom: false,
      builder: (_) => Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: ScaleTransition(
            scale: _animation,
            alignment: Alignment.center,
            child: logoImage,
          ),
        ),
      )
    );
  }
}
