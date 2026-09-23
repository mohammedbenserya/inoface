import 'package:inoface/core/usecases/constants.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/util/app_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ChooseLanguage extends StatelessWidget {
  const ChooseLanguage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: 236, //40 * SizeConfig.heightMultiplier,
                padding: const EdgeInsets.all(16),
                child: FractionallySizedBox(
                  widthFactor: 0.6,
                  child: Image.asset(
                    AppImage.graphic,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    AutoSizeText(
                      'welcome'.tr,
                      textAlign: TextAlign.left,
                      style: GoogleFonts.notoSans(
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    AutoSizeText(
                      'choose_locale'.tr,
                      textAlign: TextAlign.left,
                      style: GoogleFonts.notoSans(
                        color: Colors.black45,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                child: FractionallySizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          TextButton(
                            child: Text(
                              'Français 🇫🇷',
                              style: GoogleFonts.notoSans(
                                color: Colors.black87,
                              ),
                            ),
                            onPressed: () => languageLogic.updateLocal('fr'),
                          ),
                          TextButton(
                            child: Text(
                              '🇲🇦 العربية',
                              style: GoogleFonts.notoSans(
                                color: Colors.black87,
                              ),
                            ),
                            onPressed: () => languageLogic.updateLocal('ar'),
                          ),
                        ],
                      ),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: AutoSizeText(
                          'welcome_info'.tr,
                          style: GoogleFonts.notoSans(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
