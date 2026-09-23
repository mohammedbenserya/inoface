import 'package:inoface/widget_helper/responsive_safe_area.dart';
import 'package:inoface/core/util/generateMaterialColor.dart';
import '../../../../core/models/slider_model.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/util/app_image.dart';
import '../../../widgets/slide_tile.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';



class AppTutorial extends StatefulWidget {
  const AppTutorial({Key? key}) : super(key: key);

  @override
  _AppTutorialState createState() => _AppTutorialState();
}

class _AppTutorialState extends State<AppTutorial> with TickerProviderStateMixin {

  PageController controller = PageController();
  List<SliderModel> mySLides = [];
  int slideIndex = 0;
  late Image image1;
  late Image image2;
  late Image image3;
  late Image image4;
  late Image image5;
  late Image image6;

  @override
  void initState() {
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
                margin: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                      ),
                      onPressed: () {
                        controller.animateToPage(
                          mySLides.length,
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.linear,
                        );
                      },
                      child: Text(
                        'skip_button'.tr,
                        style: GoogleFonts.notoSans(
                          color: primaryColor,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Container(
                      child: getPointWidgets(slideIndex),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                      ),
                      onPressed: () {
                        controller.animateToPage(slideIndex + 1,
                            duration: const Duration(milliseconds: 500), curve: Curves.linear);
                      },
                      child: Text(
                        'next_button'.tr,
                        style: GoogleFonts.notoSans(
                          color: primaryColor,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : InkWell(
                onTap: () => Navigator.pop(context),
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
    List<Widget> list = <Widget>[];
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
