import 'package:inoface/features/login/presentation/widgets/initial_login.dart';
import 'package:inoface/features/login/presentation/widgets/loaded_login.dart';
import 'package:inoface/widget_helper/responsive_safe_area.dart';
import 'package:inoface/features/login/bloc/login_bloc.dart';
import 'package:inoface/widget_helper/loading_app.dart';
import 'package:inoface/core/usecases/constants.dart';
import 'package:inoface/core/usecases/enums.dart';
import '../../../../core/injection/injection.dart';
import '../../../../widget_helper/error_app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController _identifiantController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return ResponsiveSafeArea(
      bottom: false,
      builder: (context) => Scaffold(
        body: BlocProvider(
            create: (_) => getIt<LoginBloc>(),
            child: BlocConsumer<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state is ErrorLoginState) {
                  utilsLogic.showSnack(
                    type: SnackBarType.error,
                    message: state.message,
                  );
                }

                if (state is LoadedLoginState) {
                  if (state.entity.erreur) {
                    utilsLogic.showSnack(
                      type: SnackBarType.error,
                      message: state.entity.message,
                    );
                  } else {
                    utilsLogic.showSnack(
                      type: SnackBarType.success,
                      message: state.entity.message,
                    );
                  }
                }
              },
              builder: (context, state) {
                if (state is InitialLoginState) {
                  return InitialLogin(
                    identifiantController: _identifiantController,
                    passwordController: _passwordController,
                    codeController: _codeController,
                  );
                } else if (state is LoadingLoginState) {
                  return const LoadingApp();
                } else if (state is LoadedLoginState) {
                  return LoadedLogin(entity: state.entity);
                } else if (state is ErrorLoginState) {
                  return InitialLogin(
                    identifiantController: _identifiantController,
                    passwordController: _passwordController,
                    codeController: _codeController,
                  );
                } else {
                  return const ErrorApp();
                }
              },
            ),
        ),
      ),
    );
  }
}
