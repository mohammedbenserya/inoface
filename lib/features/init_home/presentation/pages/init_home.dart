import 'package:inoface/features/init_home/presentation/widgets/loaded_init_home.dart';
import 'package:inoface/features/login/presentation/pages/login_page.dart';
import 'package:inoface/features/init_home/bloc/init_home_bloc.dart';
import 'package:inoface/widget_helper/responsive_safe_area.dart';
import 'package:inoface/core/usecases/constants.dart';
import 'package:inoface/core/usecases/enums.dart';
import '../../../home/presentation/pages/home_page.dart';
import '../../../../widget_helper/loading_app.dart';
import '../../../../core/injection/injection.dart';
import '../../../../widget_helper/error_app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class InitHome extends StatelessWidget {
  const InitHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputLogin = authState.inputLogin!;
    return ResponsiveSafeArea(
      bottom: false,
      builder: (context) {
        return Scaffold(
          body: BlocProvider(
            create: (_) => getIt<InitHomeBloc>()..add(Inoface(login: inputLogin)),
            child: BlocConsumer<InitHomeBloc, InitHomeState>(
              listener: (context, state) {
                if (state.requestState == RequestState.error) {
                  Get.offAll(() => const LoginPage());
                  utilsLogic.showSnack(
                    type: SnackBarType.error,
                    message: state.message,
                  );
                }

                if (state.requestState == RequestState.loaded) {
                  if (state.result.erreur) {
                    utilsLogic.showSnack(
                      type: SnackBarType.error,
                      message: state.result.message,
                    );
                  } else {
                    if (utilsState.enfant != null) {
                      Get.offAll(() => const HomePage());
                    }
                  }
                }
              },
              builder: (context, state) {
                if (state.requestState == RequestState.loading) {
                  return const LoadingApp();
                } else if (state.requestState == RequestState.loaded) {
                  return LoadedInitHome(model: state.result);
                } else if (state.requestState == RequestState.error) {
                  return ErrorApp(message: state.message);
                } else {
                  return const ErrorApp();
                }
              },
            ),
          ),
        );
      },
    );
  }
}
