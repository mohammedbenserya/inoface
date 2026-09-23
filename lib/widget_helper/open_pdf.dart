import 'package:inoface/core/util/generateMaterialColor.dart';
import 'package:inoface/widget_helper/responsive_safe_area.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:inoface/core/usecases/enums.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/usecases/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class OpenPDF extends StatelessWidget {
  final bool hasAppBar;
  final String path;
  final String? title;
  const OpenPDF({
    Key? key,
    required this.hasAppBar,
    required this.path,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveSafeArea(
      builder: (_) => Scaffold(
        appBar: hasAppBar ? AppBar(
          backgroundColor: primaryColor,
          title: Text(
            title ?? '',
            style: GoogleFonts.acme(
              color: Colors.white,
            ),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () => Get.back(),
          ),
        ) : null,
        body: _connected(),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }

  Widget _connected() {
    return PDF(
      enableSwipe: true,
      swipeHorizontal: true,
      autoSpacing: true,
      pageFling: false,
      onError: (error) {
        logger.e(error.toString());
        utilsLogic.showSnack(
          type: SnackBarType.error,
          message: '$error',
        );
      },
    ).cachedFromUrl(
      path,
      placeholder: (progress) => Center(child: Text('$progress %')),
      errorWidget: (error) => Center(child: Text(error.toString())),
    );
  }
}
