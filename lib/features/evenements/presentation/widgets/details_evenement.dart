import 'package:inoface/features/evenements/presentation/widgets/custom_dialog_image.dart';
import 'package:inoface/features/evenements/usecases/mobx_evenement.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:inoface/widget_helper/responsive_safe_area.dart';
import 'package:inoface/core/database/app_database.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:inoface/core/usecases/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:inoface/widget_helper/open_pdf.dart';
import 'package:inoface/core/util/static.dart';
import '../../../../widget_helper/play_video_fit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../core/util/app_image.dart';
import '../../../widgets/web_vew_app.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as bas;
import '../../../../main.dart';
import 'package:get/get.dart';



class DetailsEvenement extends StatefulWidget {
  final int index;
  final int idPersonne;
  final List<Evenement> events;
  const DetailsEvenement({
    required this.events,
    required this.index,
    required this.idPersonne,
    Key? key,
  }) : super(key: key);

  @override
  _DetailsEvenementState createState() => _DetailsEvenementState();
}

class _DetailsEvenementState extends State<DetailsEvenement> {

  final CarouselSliderController _controller = CarouselSliderController();
  final MobxEvenement _mobx = MobxEvenement();
  late PageController _pageController;
  List<Evenement> evenements = [];

  @override
  void initState() {
    super.initState();
    evenements = widget.events;
    _mobx.onPageChanged(widget.index);
    _pageController = PageController(initialPage: widget.index);
    incrementCounter();
  }

  Future<void> incrementCounter() async {
    try {
      if (widget.events.isNotEmpty) {
        await evenementLogic.viewEvenementsById(
          idEven: widget.events[widget.index].id_evenement,
          idPer: widget.idPersonne,
        );
        await utilsLogic.updateCounter(idPer: widget.idPersonne);
        // utilsLogic.setMainCountsModel(countsModel);
      }
    } catch (e) {
      logger.e(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveSafeArea(
      bottom: false,
      builder: (_) => Observer(
        builder: (context) {
          return Scaffold(
              appBar: AppBar(elevation: 0),
              backgroundColor: Colors.white,
              body: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (int index) async {
                      _mobx.onPageChanged(index);
                      await evenementLogic.viewEvenementsById(
                        idEven: evenements[index].id_evenement,
                        idPer: widget.idPersonne,
                      );
                      await utilsLogic.updateCounter(idPer: widget.idPersonne);
                      // utilsLogic.setMainCountsModel(countsModel);
                    },
                    children: getPages(evenements, appDatabase),
                  ),
                ),
              ),
              bottomSheet: Container(
                color: Colors.white,
                height: 40,
                margin: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    TextButton(
                      onPressed: () {
                        _pageController.animateToPage(_mobx.currentIndex - 1,
                            duration: const Duration(milliseconds: 400), curve: Curves.linear);
                      },
                      // splashColor: Colors.blue[50],
                      child: const Icon(Icons.arrow_back, color: Colors.pink),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 200,
                      child: Center(
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          children: [getPointWidgets(_mobx.currentIndex)],
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        _pageController.animateToPage(_mobx.currentIndex + 1,
                            duration: const Duration(milliseconds: 500), curve: Curves.linear);
                      },
                      // splashColor: Colors.blue[50],
                      child: const Icon(Icons.arrow_forward, color: Colors.pink),
                    ),
                  ],
                ),
              ),
          );
        },
      ),
    );
  }

  List<Widget> getPages(List<Evenement> events, AppDatabase appDatabase) {
    List<Widget> pages = [];
    for (int page = 0; page < evenements.length; page++) {
      pages.add(SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              height: 220,
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              child: FutureBuilder<List<Albumphoto>>(
                future: appDatabase.albumphotosDao.getAlbumphotoByIdEve(events[page].id_evenement),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    default:
                      List<Albumphoto> photos = snapshot.data ?? [];
                      if (photos.isNotEmpty) {
                        if (photos.length > 1) {
                          return CarouselSlider(
                            carouselController: _controller,
                            options: CarouselOptions(
                              autoPlay: true,
                              viewportFraction: 1.0,
                              aspectRatio: MediaQuery.of(context).size.aspectRatio,
                            ),
                            items: photos.map((i) {
                              if (utilsLogic.checkList(Static.listPdf, '${i.lien_piece_jointe}')) {
                                return InkWell(
                                  onTap: () => Get.to(() =>  OpenPDF(
                                    path: '${i.lien_piece_jointe}',
                                    hasAppBar: true,
                                  )),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    padding: const EdgeInsets.symmetric(vertical: 20),
                                    child: const Icon(
                                      Icons.picture_as_pdf,
                                      size: 80,
                                      color: Colors.pink,
                                    ),
                                  ),
                                );
                              } else {
                                return InkWell(
                                  onTap: () {
                                    int index = photos.indexOf(i);
                                    Navigator.of(context).push(PageRouteBuilder(
                                        opaque: false,
                                        pageBuilder: (BuildContext context, _, __) =>
                                            CustomDialogImage(photos: photos, index: index)));
                                  },
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: CachedNetworkImage(
                                      cacheManager: DefaultCacheManager(),
                                      imageUrl: '${i.lien_piece_jointe}',
                                      fit: BoxFit.contain,
                                      placeholder: (context, url) =>
                                      const Center(child: CircularProgressIndicator()),
                                      errorWidget: (context, url, error) => Center(
                                        child: Image.asset(AppImage.logo),
                                      ),
                                    ),
                                  ),
                                );
                              }
                            }).toList(),
                          );
                        } else {
                          if (utilsLogic.checkList(Static.listPdf, '${photos.first.lien_piece_jointe}')) {
                            return InkWell(
                              onTap: () => Get.to(() => OpenPDF(
                                path: '${photos.first.lien_piece_jointe}',
                                hasAppBar: true,
                              )),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.symmetric(vertical: 20),
                                child: const Icon(
                                  Icons.picture_as_pdf,
                                  size: 80,
                                  color: Colors.pink,
                                ),
                              ),
                            );
                          } else {
                            return SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 180,
                              child: InkWell(
                                onTap: () => Navigator.of(context).push(PageRouteBuilder(
                                    opaque: false,
                                    pageBuilder: (BuildContext context, _, __) =>
                                        CustomDialogImage(photos: photos))),
                                child: CachedNetworkImage(
                                  cacheManager: DefaultCacheManager(),
                                  imageUrl: '${photos.first.lien_piece_jointe}',
                                  fit: BoxFit.contain,
                                  placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                                  errorWidget: (context, url, error) => Center(
                                    child: Image.asset(AppImage.logo),
                                  ),
                                ),
                              ),
                            );
                          }
                        }
                      } else {
                        return SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 140,
                          child: Center(
                            child: Image.asset(AppImage.logo),
                          ),
                        );
                      }
                  }
                },
              ),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(
                Icons.date_range,
                color: Colors.pink,
              ),
              title: Text(utilsLogic.convertDate(events[page].debut)),
              subtitle: Text(utilsLogic.convertDate(events[page].fin)),
            ),
            const Divider(),
            FutureBuilder<List<Piecesjointe>>(
              future: appDatabase.piecesjointesDao.getAllPiecesjointeByIdEve(events[page].id_evenement),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  default:
                    List<Piecesjointe> pieces = snapshot.data ?? [];
                    if (pieces.isNotEmpty) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'attachments'.tr,
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          // SizedBox(width: 20,),
                          Flexible(
                            child: ListView(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              children: pieces.map((e) {
                                final isPdf = utilsLogic.checkList(Static.listPdf, '${e.lien_piece_jointe}');
                                return Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 16),
                                  child: InkWell(
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => isPdf
                                                ? OpenPDF(path: '${e.lien_piece_jointe}', hasAppBar: false)
                                                : CustomSingleImage(photos: '${e.lien_piece_jointe}')
                                        )),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        Text(bas.basename('${e.lien_piece_jointe}')),
                                        Icon(
                                          isPdf ? Icons.picture_as_pdf : MdiIcons.image,
                                          color: Colors.pink,
                                          size: 30,
                                        ),
                                        IconButton(
                                          icon: Icon(
                                            MdiIcons.download,
                                            color: Colors.pink,
                                            size: 30,
                                          ),
                                          onPressed: () => utilsLogic.requestDownload(
                                              context: context, url: '${e.lien_piece_jointe}'),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                }
              },
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.only(top: 8, left: 12, right: 12),
              child: ListTile(
                leading: const Icon(Icons.title),
                title: Text(
                  '${events[page].titre}',
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 4),
            if (events[page].description != null)
              if (events[page].description?.contains('iframe')??false)
                Container(
                  padding: const EdgeInsets.all(8),
                  height: Get.height,
                  child: WebVewApp(
                    showAppBar: false,
                    isHtml: true,
                    url: """
                            <!DOCTYPE html>
                              <html>
                              <head>
                                  <meta charset="utf-8">
                                  <meta name="viewport" content="width=device-width, initial-scale=1.0">
                                  <style>
                                    * {width: 100%;}
                                    iframe {width: 100%;}
                                  </style>
                              </head>
                              <body>
                                <div style="width: 100%">
                                 ${events[page].description}
                                </div>
                              </body>
                              </html>
                            """,
                  ),
                  /*
                  child: WebView(
                    zoomEnabled: true,
                    javascriptMode: JavascriptMode.unrestricted,
                    onWebViewCreated: (controller) {
                      final html = """
                            <!DOCTYPE html>
                              <html>
                              <head>
                                  <meta charset="utf-8">
                                  <meta name="viewport" content="width=device-width, initial-scale=1.0">
                                  <style>
                                    * {width: 100%;}
                                    iframe {width: 100%;}
                                  </style>
                              </head>
                              <body>
                                <div style="width: 100%">
                                 ${events[page].description}
                                </div>
                              </body>
                              </html>
                            """;
                      controller.loadHtmlString(html);
                    },
                  ),
                  */
                )
              else
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: HtmlWidget(
                      """
                      <html>
                      <head>
                          <meta charset="utf-8">
                          <meta name="viewport" content="width=device-width, initial-scale=1.0">
                          <style>
                              * {
                                  width: 100%;
                              }
                          </style>
                      </head>
                      <body>
                          <div style="width: 100%">
                              ${events[page].description}
                          </div>
                      </body>
                      </html>   
                      """,
                    onTapUrl: (String? url) async {
                      if (url != null) {
                        if (url.contains('//youtu.') || url.contains('youtube.com/')) {
                          Get.to(() => PlayVideoFit(url: url));
                        } else {
                          Get.to(() => WebVewApp(url: url));
                        }
                      }
                      return true;
                    },
                  ),
                ),
            const SizedBox(height: 60),
          ],
        ),
      ));
    }
    return pages;
  }

  Widget getPointWidgets(int slideIndex) {
    List<Widget> list = <Widget>[];
    for (var i = 0; i < evenements.length; i++) {
      if (i == slideIndex) {
        list.add(_buildPageIndicator(true));
      } else {
        list.add(_buildPageIndicator(false));
      }
    }
    return Row(children: list);
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
}
