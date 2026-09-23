import '../../domain/models/response_pdf_reservations_model.dart';
import 'package:inoface/widget_helper/open_pdf.dart';
import 'package:inoface/core/util/app_image.dart';
import '../../../../core/util/generateMaterialColor.dart';
import '../../../../core/usecases/constants.dart';
import '../../logic/reservation_logic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class PdfReservation extends StatelessWidget {
  final int idPersonne;
  const PdfReservation({
    Key? key,
    required this.idPersonne,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('plancantine'.tr),
      ),
      backgroundColor: backgroundColor,
      body: GetBuilder<ReservationLogic>(
        builder: (logic) {
          final date = logic.dateTimeLocal;
          return FutureBuilder<ResponsePdfReservationsModel?>(
            future: reservationLogic.getPdfReservations(
              idPersonne: idPersonne,
              dateTimeLocal: date,
              context: context,
            ),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return const Center(
                    child: CircularProgressIndicator()
                  );
                default:
                  if (snapshot.data?.plancantinepdf != null) {
                    return OpenPDF(
                      hasAppBar: false,
                      path: '${snapshot.data?.plancantinepdf}',
                      title: 'plancantine'.tr,
                    );
                  } else {
                    return Center(
                      child: Stack(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.center,
                            child: Image.asset(AppImage.empty),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              'empty_emploi'.tr,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
              }
            },
          );
        },
      )
    );
  }
}
