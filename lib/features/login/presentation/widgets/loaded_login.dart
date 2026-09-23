import 'package:inoface/features/login/presentation/pages/login_page.dart';
import 'package:inoface/features/home/presentation/pages/home_page.dart';
import 'package:inoface/widget_helper/splash_app.dart';
import '../../entities/login_entity.dart';
import 'package:flutter/material.dart';


class LoadedLogin extends StatelessWidget {
  final LoginEntity entity;
  const LoadedLogin({Key? key, required this.entity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!entity.erreur) {
      return SplashApp(
        initServices: true,
        child: const HomePage(),
      );
    }
    return const LoginPage();
  }
}
