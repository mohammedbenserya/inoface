import 'package:inoface/features/devoir/presentation/widgets/loaded_devoir.dart';
import 'package:inoface/features/devoir/bloc/devoir_bloc.dart';
import 'package:inoface/core/usecases/constants.dart';
import '../../../../core/util/generateMaterialColor.dart';
import '../../../../core/injection/injection.dart';
import '../../../../widget_helper/error_app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/usecases/enums.dart';
import '../../models/devoirs_dates_model.dart';
import '../widgets/calendar_devoir.dart';
import 'package:flutter/material.dart';



class DevoirPage extends StatelessWidget {
  final DevoirsDatesModel model;
  const DevoirPage({required this.model, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final idPersonne = utilsState.enfant!.id_personne;
    return Scaffold(
        backgroundColor: backgroundColor,
        body: BlocProvider(
            create: (_) => getIt<DevoirBloc>()
              ..add(DevoirWs(input: devoirLogic.getInputDevoir(idPersonne))),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CalendarDevoir(
                    idPersonne: idPersonne,
                    model: model
                  ),
                  BlocConsumer<DevoirBloc, DevoirState>(
                    listener: (context, state) {
                      if (state is ErrorDevoirState) {
                        utilsLogic.showSnack(
                          type: SnackBarType.error,
                          message: state.message,
                        );
                      }

                      if (state is LoadedDevoirState) {
                        if (state.model.erreur) {
                          utilsLogic.showSnack(
                            type: SnackBarType.error,
                            message: state.model.message,
                          );
                        }
                      }
                    },
                    builder: (context, state) {
                      if (state is LoadingDevoirState) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      } else if (state is LoadedDevoirState) {
                        return LoadedDevoir(
                          model: state.model,
                          idPersonne: idPersonne,
                        );
                      } else if (state is ErrorDevoirState) {
                        return ErrorApp(message: state.message);
                      } else {
                        return const ErrorApp();
                      }
                    },
                  )
                ],
              ),
            )
        )
    );
  }
}



