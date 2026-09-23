import 'package:inoface/widget_helper/loading_app.dart';
import 'package:inoface/core/usecases/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/informations_bloc.dart';
import '../../models/input_informations.dart';
import 'package:flutter/material.dart';


class InitialInformations extends StatelessWidget {

  final int idPersonne;
  const InitialInformations({
    Key? key, required this.idPersonne,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<InputInformations>(
      future: informationsLogic.getInputInformations(idPersonne),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          context.read<InformationsBloc>()
              .add(InformationsWs(informations: snapshot.data));
        }
        return const LoadingApp();
      },
    );
  }
}
