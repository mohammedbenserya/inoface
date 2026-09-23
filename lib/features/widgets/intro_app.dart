import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inoface/core/util/generateMaterialColor.dart';
import 'package:inoface/features/widgets/slide_tile.dart';
import '../../core/models/slider_model.dart';
import '../../core/usecases/constants.dart';
import '../../core/util/app_image.dart';
import '../../core/util/keys.dart';
import '../../widget_helper/responsive_safe_area.dart';
import '../login/presentation/pages/login_page.dart';



class IntroApp extends StatefulWidget {
  const IntroApp({Key? key}) : super(key: key);

  @override
  _IntroAppState createState() => _IntroAppState();
}

class _IntroAppState extends State<IntroApp> with TickerProviderStateMixin {
  final PageController controller = PageController();
  List<SliderModel> mySLides = [];
  int slideIndex = 0;
  late Color color;
  late Image image1;
  late Image image2;
  late Image image3;
  late Image image4;
  late Image image5;
  late Image image6;

  @override
  void initState() {
    color = Colors.white;
    mySLides = SliderModel.getSlides();
    image1 = Image.asset(
      AppImage.info,
      filterQuality: FilterQuality.low,
      width: Get.width - 30,
      fit: BoxFit.contain,
    );
    image2 = Image.asset(
      AppImage.event,
      filterQuality: FilterQuality.low,
      width: Get.width - 30,
      fit: BoxFit.contain,
    );
    image3 = Image.asset(
      AppImage.agenda,
      filterQuality: FilterQuality.low,
      width: Get.width - 30,
      fit: BoxFit.contain,
    );
    image4 = Image.asset(
      AppImage.jour,
      filterQuality: FilterQuality.low,
      width: Get.width - 30,
      fit: BoxFit.contain,
    );
    image5 = Image.asset(
      AppImage.attestation,
      filterQuality: FilterQuality.low,
      width: Get.width - 30,
      fit: BoxFit.contain,
    );
    image6 = Image.asset(
      AppImage.emploi,
      filterQuality: FilterQuality.low,
      width: Get.width - 30,
      fit: BoxFit.contain,
    );
    super.initState();
  }

  @override
  void didChangeDependencies() {
    precacheImage(image1.image, context);
    precacheImage(image2.image, context);
    precacheImage(image3.image, context);
    precacheImage(image4.image, context);
    precacheImage(image5.image, context);
    precacheImage(image6.image, context);
    super.didChangeDependencies();
  }

  Widget _buildPageIndicator(bool isCurrentPage) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 10.0 : 6.0,
      width: isCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? Colors.grey : Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveSafeArea(
      color: color,
      builder: (_) => Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: PageView(
              controller: controller,
              onPageChanged: (index) {
                setState(() {
                  slideIndex = index;
                  color = (index == mySLides.length -1) ? primaryColor : Colors.white;
                });
              },
              children: [
                SlideTile(
                  image: image1,
                  title: mySLides[slideIndex].getTitle(),
                  desc: mySLides[slideIndex].getDesc(),
                ),
                SlideTile(
                  image: image2,
                  title: mySLides[slideIndex].getTitle(),
                  desc: mySLides[slideIndex].getDesc(),
                ),
                SlideTile(
                  image: image3,
                  title: mySLides[slideIndex].getTitle(),
                  desc: mySLides[slideIndex].getDesc(),
                ),
                SlideTile(
                  image: image4,
                  title: mySLides[slideIndex].getTitle(),
                  desc: mySLides[slideIndex].getDesc(),
                ),
                SlideTile(
                  image: image5,
                  title: mySLides[slideIndex].getTitle(),
                  desc: mySLides[slideIndex].getDesc(),
                ),
                SlideTile(
                  image: image6,
                  title: mySLides[slideIndex].getTitle(),
                  desc: mySLides[slideIndex].getDesc(),
                ),
              ],
            ),
          ),
        ),
        bottomSheet: slideIndex != mySLides.length - 1
            ? Container(
                height: 35,
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    TextButton(
                      onPressed: () {
                        controller.animateToPage(
                          mySLides.length,
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.linear,
                        );
                      },
                      // splashColor: Colors.blue[50],
                      child: Text(
                        'skip_button'.tr,
                        style: GoogleFonts.notoSans(
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Container(
                      child: getPointWidgets(slideIndex),
                    ),
                    TextButton(
                      onPressed: () {
                        controller.animateToPage(
                          slideIndex + 1,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.linear,
                        );
                      },
                      // splashColor: Colors.blue[50],
                      child: Text(
                        'next_button'.tr,
                        style: GoogleFonts.notoSans(
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : InkWell(
                onTap: () async {
                  await prefs.setBool(Keys.intro, false);
                  Get.offAll(() => const LoginPage());
                },
                child: Container(
                  height: Platform.isIOS ? 70 : 60,
                  color: Colors.pink,
                  alignment: Alignment.center,
                  child: Text(
                    'done_button'.tr,
                    style: GoogleFonts.notoSans(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
      ),
    );
  }

  Widget getPointWidgets(int slideIndex) {
    List<Widget> list = [];
    for (var i = 0; i < mySLides.length; i++) {
      if (i == slideIndex) {
        list.add(_buildPageIndicator(true));
      } else {
        list.add(_buildPageIndicator(false));
      }
    }
    return Row(children: list);
  }
}
