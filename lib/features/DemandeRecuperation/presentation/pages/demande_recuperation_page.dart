import 'package:inoface/features/DemandeRecuperation/presentation/widgets/loaded_demande_recuperation.dart';
import 'package:inoface/features/DemandeRecuperation/bloc/demande_recuperation_bloc.dart';
import 'package:inoface/core/injection/injection.dart';
import 'package:inoface/widget_helper/loading_app.dart';
import 'package:inoface/widget_helper/responsive_safe_area.dart';
import '../../../../core/usecases/constants.dart';
import '../../../../widget_helper/error_app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';



class DemandeRecuperationPage extends StatelessWidget {
  const DemandeRecuperationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputLogin = authState.inputLogin!;
    return ResponsiveSafeArea(
      builder: (_) => Scaffold(
        body: BlocProvider(
            create: (_) => getIt<DemandeRecuperationBloc>()
            ..add(InitDemandeRecuperationEvent(input: inputLogin)),
            child: BlocBuilder<DemandeRecuperationBloc, DemandeRecuperationState>(
              builder: (context, state) {
                if (state is DemandeRecuperationInitial) {
                  return const LoadingApp();
                } else if (state is DemandeRecuperationLoaded) {
                  return LoadedDemandeRecuperation(model: state.model);
                } else if (state is DemandeRecuperationError) {
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
