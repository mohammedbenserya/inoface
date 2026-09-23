import 'package:inoface/core/usecases/constants.dart';
import 'package:inoface/widget_helper/open_pdf.dart';
import '../../../../core/util/app_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class TimetablePdf extends StatelessWidget {
  final int idPersonne;
  const TimetablePdf({
    Key? key,
    required this.idPersonne,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: utilsLogic.getEmploitempsPdfById(idPersonne: idPersonne),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Center(
              child: CircularProgressIndicator(),
            );
          default:
            if (snapshot.hasData) {
              return OpenPDF(
                hasAppBar: true,
                path: '${snapshot.data}',
                title: 'timetable'.tr,
              );
            } else {
              return Scaffold(
                appBar: AppBar(elevation: 0),
                body: Center(
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
                            fontSize: 15,
                            color: Colors.black,
                            // color: ColorHelper.COLOR_BLACK45,
                          ),
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
