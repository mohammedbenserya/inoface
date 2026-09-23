import 'package:inoface/features/jours_feries/presentation/widgets/initial_jours_feries.dart';
import 'package:inoface/features/jours_feries/presentation/widgets/loaded_jours_feries.dart';
import 'package:inoface/features/jours_feries/bloc/jours_feries_bloc.dart';
import 'package:inoface/widget_helper/responsive_safe_area.dart';
import 'package:inoface/widget_helper/loading_app.dart';
import 'package:inoface/core/usecases/constants.dart';
import '../../../../core/injection/injection.dart';
import '../../../../widget_helper/error_app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/usecases/enums.dart';
import '../../logic/jours_feries_logic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class JoursFeriesPage extends StatelessWidget {
  final int? id;
  const JoursFeriesPage({Key? key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final joursFeriesLogic = Get.put(JoursFeriesLogic());
    joursFeriesLogic.updateDateTime(DateTime.now());
    final enfant = utilsState.enfant!;
    return ResponsiveSafeArea(
      bottom: false,
      builder: (_) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: Text('holiday'.tr),
        ),
        body: BlocProvider(
            create: (_) => getIt<JoursFeriesBloc>(),
            child: BlocConsumer<JoursFeriesBloc, JoursFeriesState>(
              listener: (context, state) {
                if (state is ErrorJoursFeriesState) {
                  utilsLogic.showSnack(
                    type: SnackBarType.error,
                    message: state.message,
                  );
                }

                if (state is LoadedJoursFeriesState) {
                  if (state.model.erreur) {
                    utilsLogic.showSnack(
                      type: SnackBarType.error,
                      message: state.model.message,
                    );
                  }
                }
              },
              builder: (context, state) {
                if (state is InitialJoursFeriesState) {
                  return const InitialJoursFeries();
                } else if (state is LoadingJoursFeriesState) {
                  return const LoadingApp();
                } else if (state is LoadedJoursFeriesState) {
                  return LoadedJoursFeries(
                    model: state.model,
                    idPersonne: enfant.id_personne,
                    id: id,
                  );
                } else if (state is ErrorJoursFeriesState) {
                  return ErrorApp(message: state.message);
                } else {
                  return const ErrorApp();
                }
              },
            )
        ),
      ),
    );
  }
}
