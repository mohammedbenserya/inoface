import 'package:inoface/features/reservations/domain/models/reservations_cantine_dates_model.dart';
import 'package:inoface/features/reservations/presentation/widgets/pdf_reservation.dart';
import 'package:inoface/core/usecases/constants.dart';
import '../../../../core/util/generateMaterialColor.dart';
import '../../cubit/reservation/reservations_cubit.dart';
import '../widgets/table_calendar_reservations.dart';
import '../widgets/loaded_reservations_widget.dart';
import '../../../../core/injection/injection.dart';
import '../../../../widget_helper/error_app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/util/app_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';




class ReservationsPage extends StatelessWidget {
  final ReservationsCantineDatesModel model;
  const ReservationsPage({Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final enfant = utilsState.enfant!;
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
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: primaryColor,
            foregroundColor: Colors.white,
            iconTheme: const IconThemeData(color: Colors.white),
            title: Text(
              'cantine'.tr,
              style: const TextStyle(color: Colors.white),
            ),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(foregroundColor: Colors.white),
                child: Text('menu'.tr),
                onPressed: () => Get.to(() => PdfReservation(
                  idPersonne: enfant.id_personne,
                )),
              ),
            ],
          ),
          backgroundColor: Colors.transparent,
          body: BlocProvider(
            create: (_) => getIt<ReservationsCubit>()..getReservation(
                idPersonne: enfant.id_personne,
                date: DateTime.now()
              ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TableCalendarReservations(),

                  BlocBuilder<ReservationsCubit, ReservationsState>(
                    builder: (context, state) {
                      if (state is ReservationsLoading) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 30),
                          child: Center(
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          ),
                        );
                      } else if (state is ReservationsLoaded) {
                        return LoadedReservationsWidget(
                          model: state.model,
                          // mobx: _mobx,
                        );
                      } else if (state is ReservationsError) {
                        return ErrorApp(message: state.message);
                      } else {
                        return const ErrorApp();
                      }
                    },
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
