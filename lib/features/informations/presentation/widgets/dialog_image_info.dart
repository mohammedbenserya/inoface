import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:inoface/core/database/app_database.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:inoface/core/usecases/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:inoface/core/util/static.dart';
import '../../../../core/util/generateMaterialColor.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../../core/util/app_image.dart';
import 'package:flutter/material.dart';



class DialogImageInfo extends StatelessWidget {
  final List<Piecesjointe> pieces;
  DialogImageInfo({Key? key, required this.pieces}) : super(key: key);
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white.withOpacity(0.85),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: CarouselSlider(
                carouselController: _controller,
                options: CarouselOptions(
                  autoPlay: false,
                  viewportFraction: 1.0,
                  aspectRatio: MediaQuery.of(context).size.aspectRatio,
                ),
                items: pieces.map((i) {
                  if (utilsLogic.checkList(Static.listPdf, '${i.lien_piece_jointe}')) {
                    return SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.symmetric(vertical: 20),
                                child: const Icon(
                                  Icons.picture_as_pdf,
                                  size: 80,
                                  color: Colors.pink,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: IconButton(
                                icon: const Icon(Icons.file_download),
                                onPressed: () async {
                                  utilsLogic.requestDownload(context: context, url: '${i.lien_piece_jointe}');
                                },
                              ),
                            ),
                          ],
                        )
                        //child: Image.network(i.image),
                        );
                  } else {
                    return SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              child: CachedNetworkImage(
                                cacheManager: DefaultCacheManager(),
                                imageUrl: '${i.lien_piece_jointe}',
                                fit: BoxFit.contain,
                                placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) => Center(
                                  child: Image.asset(AppImage.logo),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: IconButton(
                                icon: const Icon(Icons.file_download),
                                onPressed: () async {
                                  utilsLogic.requestDownload(context: context, url: '${i.lien_piece_jointe}');
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                  }
                }).toList(),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: IconButton(
                  icon: Icon(
                    MdiIcons.close,
                    color: primaryColor,
                    size: 35,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
          ],
        ));
  }
}
