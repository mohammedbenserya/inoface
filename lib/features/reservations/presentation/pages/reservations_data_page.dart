import 'package:inoface/features/reservations/presentation/pages/reservations_page.dart';
import 'package:inoface/core/usecases/constants.dart';
import '../../../../widget_helper/responsive_safe_area.dart';
import '../../cubit/date/reservation_date_cubit.dart';
import '../../../../widget_helper/loading_app.dart';
import '../../../../core/injection/injection.dart';
import '../../../../widget_helper/error_app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/reservation_logic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class ReservationsDataPage extends StatelessWidget {
  const ReservationsDataPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final reservationLogic = Get.put(ReservationLogic());
    final idPersonne = utilsState.enfant!.id_personne;
    reservationLogic.updateDateTime(DateTime.now());
    return ResponsiveSafeArea(
      bottom: false,
      builder: (_) => Scaffold(
        body: BlocProvider(
          create: (_) => getIt<ReservationDateCubit>()..getReservationDate(idPersonne: idPersonne),
          child: BlocBuilder<ReservationDateCubit, ReservationDateState>(
            builder: (context, state) {
              if (state is ReservationDateLoading) {
                return const LoadingApp();
              } else if (state is ReservationDateLoaded) {
                return ReservationsPage(model: state.model);
              } else if (state is ReservationDateError) {
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
