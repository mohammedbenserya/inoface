import 'package:inoface/features/jours_feries/bloc/jours_feries_bloc.dart';
import 'package:inoface/widget_helper/loading_app.dart';
import 'package:inoface/core/usecases/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/input_jours_feries.dart';
import 'package:flutter/material.dart';



class InitialJoursFeries extends StatelessWidget {
  const InitialJoursFeries({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<InputJoursFeries?>(
      future: joursFeriesLogic.getInputJoursFeries(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          context.read<JoursFeriesBloc>()
              .add(JoursFeriesWs(inputJoursFeries: snapshot.data!));
        }
        return const LoadingApp();
      },
    );
  }
}
