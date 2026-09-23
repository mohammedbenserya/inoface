import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:rounded_background_text/rounded_background_text.dart';
import 'package:inoface/core/database/app_database.dart';
import '../../domain/models/get_reservations_cantine_model.dart';
import 'package:inoface/core/util/app_image.dart';
import '../../../../core/usecases/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:intl/intl.dart';
import '../../../../main.dart';
import 'package:get/get.dart';




class LoadedReservationsWidget extends StatelessWidget {
  final GetReservationsCantineModel model;
  const LoadedReservationsWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final date = reservationLogic.dateTimeLocal;
    final format = DateFormat('yyyy-MM-dd').format(date);
    final parsedDate = DateTime.parse('$format 00:00:00.000');
    return StreamBuilder<ReservationsCantine?>(
      stream: appDatabase.reservationsCantinesDao.watchReservationsByDate(date: parsedDate),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Center(
              child: CircularProgressIndicator(),
            );
          default:
            return BuildPlan(date: parsedDate, reservation: snapshot.data);
        }
      },
    );
  }
}

class BuildPlan extends StatelessWidget {
  final ReservationsCantine? reservation;
  final DateTime date;
  const BuildPlan({
    Key? key,
    required this.date,
    this.reservation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final idPersonne = utilsState.enfant!.id_personne;
    final DateTime _now = DateTime.now().subtract(const Duration(days: 1));
    return FutureBuilder<PlanCantine?>(
      future: appDatabase.planCantinesDao.getPlanCantinesByData(date: date),
      builder: (context, snapPlan) {
        switch (snapPlan.connectionState) {
          case ConnectionState.waiting:
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white)
                ),
              ),
            );
          default:
            final plan = snapPlan.data;
            if (plan != null) {
              return FutureBuilder<List<Plat>>(
                future: appDatabase.platsDao.getPlanCantinesByData(idCantine: plan.id_cantine_type),
                builder: (context, snapPlat) {
                  switch (snapPlat.connectionState) {
                    case ConnectionState.waiting:
                      return const Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white)
                        ),
                      );
                    default:
                      final plats = snapPlat.data ?? [];
                      if (plats.isNotEmpty) {
                        return Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            border: Border(
                              top: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 16, right: 6),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${plan.cantine_type_description}',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextButton.icon(
                                      icon: Icon(MdiIcons.silverware),
                                      label: Text((reservation != null && (reservation?.parentnom?.isNotEmpty??false)) ?
                                        '${'reservations_cantine'.tr}\n${reservation?.parentnom ?? ''}' :
                                        'reservations_cantine'.tr,
                                        style: TextStyle(
                                          decoration: (_now.isAfter(date) || reservation != null) ?
                                          TextDecoration.lineThrough : null,
                                        ),
                                      ),
                                      onPressed: (_now.isAfter(date) || (reservation?.parentnom?.isNotEmpty??false)) ? null : () async {
                                        if (reservation?.parentnom?.isEmpty??false) {
                                          await reservationLogic.removeReservationsAlert(context, date).then((confirm) async {
                                            if (confirm) {
                                              await reservationLogic.removeReservations(
                                                idJournaliere: reservation!.id_cantine_journaliere,
                                                context: context,
                                                dateTime: date,
                                              );
                                            }
                                          });
                                        } else {
                                          await reservationLogic.alertRservations(context, date, idPersonne).then((result) async {
                                            if (result) {
                                              await reservationLogic.reservationsCantine(
                                                idPersonne: idPersonne,
                                                context: context,
                                                dateTime: date,
                                                // mobx: mobx,
                                              );
                                            }
                                          });
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: plats.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: Text('${plats[index].cantine_type_repas_description}:'),
                                    subtitle: (plats[index].plat != null) ? Text('${plats[index].plat}') : null,
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                      } else {
                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Lottie.asset(
                                  AppImage.jsonEmpty,
                                  width: Get.width / 1.5,
                                ),
                                RoundedBackgroundText(
                                  'empty_emploi'.tr,
                                  textAlign: TextAlign.center,
                                  backgroundColor: Colors.grey.shade300,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                  }
                },
              );
            } else {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Lottie.asset(
                        AppImage.jsonEmpty,
                        width: Get.width / 1.5,
                      ),
                      RoundedBackgroundText(
                        'empty_emploi'.tr,
                        textAlign: TextAlign.center,
                        backgroundColor: Colors.grey.shade300,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
        }
      },
    );
  }
}
