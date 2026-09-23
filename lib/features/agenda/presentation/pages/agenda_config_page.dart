import 'package:inoface/features/agenda/bloc/agenda_config/agenda_config_bloc.dart';
import 'package:inoface/features/agenda/presentation/pages/agenda_page.dart';
import 'package:inoface/widget_helper/responsive_safe_area.dart';
import 'package:inoface/widget_helper/loading_app.dart';
import 'package:inoface/core/usecases/constants.dart';
import 'package:inoface/core/usecases/enums.dart';
import '../../../../core/injection/injection.dart';
import '../../../../widget_helper/error_app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class AgendaConfigPage extends StatefulWidget {
  const AgendaConfigPage({Key? key}) : super(key: key);

  @override
  State<AgendaConfigPage> createState() => _AgendaConfigPageState();
}

class _AgendaConfigPageState extends State<AgendaConfigPage> {

  @override
  void dispose() {
    agendaLogic.updateDateTime(DateTime.now());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final idPersonne = utilsState.enfant!.id_personne;
    return ResponsiveSafeArea(
      bottom: false,
      builder: (_) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('agenda'.tr),
        ),
        body: BlocProvider(
            create: (_) => getIt<AgendaConfigBloc>()..add(AgendConfigaWs(idPersonne: idPersonne)),
            child: BlocConsumer<AgendaConfigBloc, AgendaConfigState>(
              listener: (context, state) {
                if (state is ErrorAgendaConfigState) {
                  utilsLogic.showSnack(
                    type: SnackBarType.error,
                    message: state.message,
                  );
                }

                if (state is LoadedAgendaConfigState) {
                  if (state.model.erreur) {
                    utilsLogic.showSnack(
                      type: SnackBarType.info,
                      message: state.model.message,
                    );
                  }
                }
              },
              builder: (context, state) {
                if (state is LoadingAgendaConfigState) {
                  return const LoadingApp();
                } else if (state is LoadedAgendaConfigState) {
                  return AgendaPage(idPersonne: idPersonne);
                } else if (state is ErrorAgendaConfigState) {
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
