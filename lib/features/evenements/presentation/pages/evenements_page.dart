import 'package:inoface/features/evenements/presentation/widgets/initial_evenements.dart';
import 'package:inoface/features/evenements/presentation/widgets/loaded_evenements.dart';
import 'package:inoface/features/evenements/bloc/evenements_bloc.dart';
import 'package:inoface/widget_helper/loading_app.dart';
import 'package:inoface/core/injection/injection.dart';
import 'package:inoface/core/usecases/constants.dart';
import '../../../../widget_helper/responsive_safe_area.dart';
import 'package:inoface/core/usecases/enums.dart';
import '../../../../widget_helper/error_app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class EvenementsPage extends StatelessWidget {
  const EvenementsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final idPersonne = utilsState.enfant!.id_personne;
    return ResponsiveSafeArea(
      bottom: false,
      builder: (context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('event'.tr),
        ),
        body: BlocProvider(
            create: (_) => getIt<EvenementsBloc>(),
            child: BlocConsumer<EvenementsBloc, EvenementsState>(
              listener: (context, state) {
                if (state is ErrorEvenementsState) {
                  utilsLogic.showSnack(type: SnackBarType.error, message: state.message);
                }

                if (state is LoadedEvenementsState) {
                  if (state.model.erreur) {
                    utilsLogic.showSnack(type: SnackBarType.info, message: state.model.message);
                  }
                }
              },
              builder: (context, state) {
                if (state is InitialEvenementsState) {
                  return InitialEvenements(idPersonne: idPersonne);
                } else if (state is LoadingEvenementsState) {
                  return const LoadingApp();
                } else if (state is LoadedEvenementsState) {
                  return LoadedEvenements(
                    idPersonne: idPersonne,
                    model: state.model,
                  );
                } else if (state is ErrorEvenementsState) {
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
