import 'package:inoface/features/login/presentation/pages/login_page.dart';
import 'package:inoface/core/usecases/constants.dart';
import '../../../home/presentation/pages/home_page.dart';
import '../../../../core/models/enfants_model.dart';
import '../../../../widget_helper/splash_app.dart';
import 'package:flutter/material.dart';


class LoadedInitHome extends StatelessWidget {
  final EnfantsModel model;
  const LoadedInitHome({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (model.erreur) {
      return Scaffold(
        body: FutureBuilder(
          future: utilsLogic.logOut(),
          builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(),
              );
            default:
              return const LoginPage();
          }
        },
      ));
    } else {
      return SplashApp(
        initServices: (utilsState.enfant == null) ? true : false,
        child: const HomePage(),
      );
    }
  }
}
