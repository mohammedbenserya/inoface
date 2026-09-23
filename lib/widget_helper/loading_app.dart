import 'package:inoface/core/util/app_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;



class LoadingApp extends StatefulWidget {
  const LoadingApp({Key? key}) : super(key: key);

  @override
  _LoadingAppState createState() => _LoadingAppState();
}

class _LoadingAppState extends State<LoadingApp> with SingleTickerProviderStateMixin {
  late AnimationController animController;
  late Animation<double> animation;
  late Image logoImage;

  @override
  void initState() {
    logoImage = Image.asset(
      AppImage.logo,
      width: Get.width / 2,
      height: Get.width / 2,
      fit: BoxFit.contain,
    );
    _initAnimation();
    super.initState();
  }

  void _initAnimation() {
    try {
      animController = AnimationController(
          duration: const Duration(seconds: 2), vsync: this);
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
  void didChangeDependencies() {
    precacheImage(logoImage.image, context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FractionallySizedBox(
                  widthFactor: 0.9,
                  child: FadeTransition(
                    opacity: animation,
                    child: logoImage
                  ),
                ),
                const CircularProgressIndicator(),
                const SizedBox(height: 10),
              ],
            ),
          ),
        )
    );
  }
}
