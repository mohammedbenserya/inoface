import 'package:inoface/features/attestations/presentation/widgets/loaded_attestations.dart';
import 'package:inoface/features/attestations/bloc/attestations_bloc.dart';
import 'package:inoface/widget_helper/responsive_safe_area.dart';
import 'package:inoface/widget_helper/loading_app.dart';
import 'package:inoface/core/usecases/constants.dart';
import '../../../../core/injection/injection.dart';
import '../../../../widget_helper/error_app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/usecases/enums.dart';
import 'package:flutter/material.dart';





class AttestationsPage extends StatelessWidget {
  const AttestationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final idPersonne = utilsState.enfant!.id_personne;
    return ResponsiveSafeArea(
      builder: (context) => Scaffold(
        body: BlocProvider(
            create: (_) => getIt<AttestationsBloc>()
              ..add(CurrentDemandeAttestations(idPersonne: idPersonne)),
            child: BlocConsumer<AttestationsBloc, AttestationsState>(
              listener: (context, state) {
                if (state is ErrorAttestationsState) {
                  utilsLogic.showSnack(
                    type: SnackBarType.error,
                    message: state.message,
                  );
                }
              },
              builder: (context, state) {
                if (state is LoadingAttestationsState) {
                  return const LoadingApp();
                } else if (state is LoadedAttestationsState) {
                  return LoadedAttestations(
                    model: state.model,
                    idPersonne: idPersonne,
                    addModel: state.addModel,
                  );
                } else if (state is ErrorAttestationsState) {
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
