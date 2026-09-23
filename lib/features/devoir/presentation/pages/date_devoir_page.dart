import 'package:inoface/widget_helper/responsive_safe_area.dart';
import '../../../../core/util/generateMaterialColor.dart';
import '../../../../widget_helper/loading_app.dart';
import '../../../../core/injection/injection.dart';
import '../../../../widget_helper/error_app.dart';
import '../../../../core/usecases/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/usecases/enums.dart';
import '../../cubit/date_devoir_cubit.dart';
import 'package:flutter/material.dart';
import '../../logic/devoir_logic.dart';
import 'package:get/get.dart';
import 'devoir_page.dart';



class DateDevoirPage extends StatelessWidget {
  const DateDevoirPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final idPersonne = utilsState.enfant!.id_personne;
    final devoirLogic = Get.put(DevoirLogic());
    devoirLogic.updateDateTime(DateTime.now());
    return ResponsiveSafeArea(
      builder: (context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('devoir'.tr),
        ),
        backgroundColor: backgroundColor,
        body: BlocProvider<DateDevoirCubit>(
          create: (_) => getIt<DateDevoirCubit>()
            ..getAllDevoirsDates(idPersonne: idPersonne),
          child: BlocConsumer<DateDevoirCubit, DateDevoirState>(
            listener: (context, state) {
              if (state is DateDevoirError) {
                utilsLogic.showSnack(
                  type: SnackBarType.error,
                  message: state.message,
                );
              }
            },
            builder: (context, state) {
              if (state is DateDevoirLoading) {
                return const LoadingApp();
              } else if (state is DateDevoirLoaded) {
                return DevoirPage(model: state.model);
              } else if (state is DateDevoirError) {
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
