import 'package:inoface/features/informations/presentation/widgets/initial_informations.dart';
import 'package:inoface/features/informations/presentation/widgets/loaded_informations.dart';
import 'package:inoface/widget_helper/responsive_safe_area.dart';
import 'package:inoface/widget_helper/loading_app.dart';
import 'package:inoface/core/usecases/constants.dart';
import 'package:inoface/core/usecases/enums.dart';
import '../../../../core/injection/injection.dart';
import '../../../../widget_helper/error_app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/informations_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class InformationsPage extends StatelessWidget {
  const InformationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final idPersonne = utilsState.enfant!.id_personne;
    return ResponsiveSafeArea(
      bottom: false,
      builder: (_) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('information'.tr),
        ),
        body: BlocProvider(
          create: (_) => getIt<InformationsBloc>(),
          child: BlocConsumer<InformationsBloc, InformationsState>(
            listener: (context, state) {
              if (state is ErrorInformationsState) {
                utilsLogic.showSnack(
                  type: SnackBarType.error,
                  message: state.message,
                );
              }

              if (state is LoadedInformationsState) {
                if (state.model.erreur) {
                  utilsLogic.showSnack(
                    type: SnackBarType.info,
                    message: state.model.message,
                  );
                }
              }
            },
            builder: (context, state) {
              if (state is InitialInformationsState) {
                return InitialInformations(idPersonne: idPersonne);
              } else if (state is LoadingInformationsState) {
                return const LoadingApp();
              } else if (state is LoadedInformationsState) {
                return LoadedInformations(
                  model: state.model,
                  idPersonne: idPersonne,
                );
              } else if (state is ErrorInformationsState) {
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
