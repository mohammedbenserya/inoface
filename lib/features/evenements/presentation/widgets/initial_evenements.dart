import 'package:inoface/features/evenements/models/input_evenements.dart';
import 'package:inoface/features/evenements/bloc/evenements_bloc.dart';
import 'package:inoface/widget_helper/loading_app.dart';
import 'package:inoface/core/usecases/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';



class InitialEvenements extends StatelessWidget {

  final int idPersonne;
  const InitialEvenements({
    Key? key,
    required this.idPersonne,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<InputEvenements?>(
      future: evenementLogic.getInputEvenements(idPersonne),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          context.read<EvenementsBloc>()
              .add(EvenementsWs(inputEvenements: snapshot.data),
          );
        }
        return const LoadingApp();
      },
    );
  }
}
