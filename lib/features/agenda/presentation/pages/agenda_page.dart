import 'package:inoface/features/agenda/presentation/widgets/loaded_agenda.dart';
import 'package:inoface/core/util/generateMaterialColor.dart';
import 'package:inoface/core/usecases/constants.dart';
import '../../../../core/injection/injection.dart';
import '../../../../core/util/app_image.dart';
import '../../../../widget_helper/error_app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/agenda/agenda_bloc.dart';
import '../widgets/calendar_agenda.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';




class AgendaPage extends StatelessWidget {
  final int idPersonne;
  const AgendaPage({
    Key? key, required this.idPersonne,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final date = DateFormat('yyyy-MM-dd').format(agendaState.dateTimeLocal);
    return Container(
      decoration: BoxDecoration(
        color: primaryColor,
        image: const DecorationImage(
          image: AssetImage(AppImage.bg),
          fit: BoxFit.cover,
          opacity: 0.6,
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: BlocProvider(
            create: (_) => getIt<AgendaBloc>()
              ..add(AgendWs(idPersonne: idPersonne, date: date)),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CalendarAgenda(idPersonne: idPersonne),

                  SizedBox(
                    child: BlocBuilder<AgendaBloc, AgendaState>(
                      builder: (context, state) {
                        if (state is LoadingAgendaState) {
                          return const Padding(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        } else if (state is LoadedAgendaState) {
                          return LoadedAgenda(
                            model: state.model,
                            idPersonne: idPersonne,
                          );
                        } else if (state is ErrorAgendaState) {
                          return ErrorApp(message: state.message);
                        } else {
                          return const ErrorApp();
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          )
      ),
    );
  }
}



