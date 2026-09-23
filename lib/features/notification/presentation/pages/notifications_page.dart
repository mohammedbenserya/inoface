import 'package:inoface/features/notification/presentation/widgets/loaded_notifications.dart';
import 'package:inoface/features/notification/cubit/notifications_cubit.dart';
import 'package:inoface/widget_helper/responsive_safe_area.dart';
import 'package:inoface/widget_helper/loading_app.dart';
import 'package:inoface/core/usecases/constants.dart';
import '../../../../core/util/generateMaterialColor.dart';
import '../../../../core/injection/injection.dart';
import '../../../../widget_helper/error_app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputLogin = authState.inputLogin;
    final enfant = utilsState.enfant!;
    return ResponsiveSafeArea(
      color: primaryColor,
      bottom: false,
      builder: (context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('notifications'.tr),
        ),
        backgroundColor: backgroundColor,
        body: BlocProvider(
          create: (_) => getIt<NotificationsCubit>()..getNotifications(input: inputLogin),
          child: BlocBuilder<NotificationsCubit, NotificationsState>(
            builder: (context, state) {
              if (state is NotificationsLoading) {
                return const LoadingApp();
              } else if (state is NotificationsLoaded) {
                return LoadedNotifications(
                  idPersonne: enfant.id_personne,
                  model: state.model,
                );
              } else if (state is NotificationsError) {
                return ErrorApp(message: state.message);
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
