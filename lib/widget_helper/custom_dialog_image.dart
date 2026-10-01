import 'package:inoface/core/database/app_database.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:inoface/core/usecases/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../core/util/app_image.dart';
import '../core/util/generateMaterialColor.dart';
import 'responsive_safe_area.dart';
import 'package:get/get.dart';
import 'package:inoface/core/util/url_service.dart';


List<String> imgList = [];


class CustomDialogImage extends StatefulWidget {
  final int index;
  final List<AgendaPhotoDetail> photos;
  const CustomDialogImage({
    required this.photos,
    this.index = 0,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomDialogImage> createState() => _CustomDialogImageState();
}

class _CustomDialogImageState extends State<CustomDialogImage> {

  final CarouselSliderController _controller = CarouselSliderController();
  int _current = 0;
  // late String url;

  @override
  void initState() {
    // _initLink();
    _current = widget.index;
    imgList.clear();
    imgList.addAll(widget.photos.map((e) => '${e.lieu_photo}').toList());
    super.initState();
  }

  // _initLink() {
  //   try {
  //     AgendaPhotoDetail detail = widget.photos[widget.index];
  //     // url = '${detail.lieu_photo}';
  //   } catch(e) {
  //     logger.e('$e');
  //   }
  // }

  final List<Widget> imageSliders = imgList
      .map((item) => Container(
    margin: const EdgeInsets.all(5.0),
    child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        child: Stack(
          children: <Widget>[
            Image.network(
              item,
              height: 190,
              fit: BoxFit.contain,
            ),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(200, 0, 0, 0),
                      Color.fromARGB(0, 0, 0, 0)
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                child: Text(
                  'No. ${imgList.indexOf(item)+1}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        )),
  )).toList();



  @override
  Widget build(BuildContext context) {
    return ResponsiveSafeArea(
      builder: (_) => Container(
        decoration: BoxDecoration(
          color: primaryColor,
          image: const DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(AppImage.bg),
            opacity: 0.6,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text('photo'.tr),
            centerTitle: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.file_download),
                onPressed: () async {
                  await utilsLogic.requestDownload(
                    url: imgList[_current],
                    context: context,
                    // url: url,
                  );
                },
              ),
            ],
          ),
          body: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: CarouselSlider(
                    carouselController: _controller,
                    options: CarouselOptions(
                      initialPage: widget.index,
                      height: MediaQuery.of(context).size.height - 100,
                      enlargeCenterPage: false,
                      autoPlay: false,
                      aspectRatio: 2.0,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      }
                    ),
                    items: widget.photos.map((i) {
                      // url = '${i.lieu_photo}';
                      return SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              child: CachedNetworkImage(
                                cacheManager: DefaultCacheManager(),
                                imageUrl: UrlService.rewriteInoserUri('${i.lieu_photo}'),
                                fit: BoxFit.contain,
                                placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) => const Icon(Icons.broken_image, size: 50),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Wrap(
                  alignment: WrapAlignment.center,
                  children: imgList.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => _controller.animateToPage(entry.key),
                      child: Container(
                        width: 5, height: 5,
                        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: (Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black)
                                .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                      ),
                    );
                  }).toList(),
                ),
              ],
            )
          ),
        ),
      ),
    );
  }
}
