import 'package:inoface/features/evenements/presentation/widgets/custom_dialog_image.dart';
import 'package:inoface/core/database/app_database.dart';
import 'package:inoface/core/usecases/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:inoface/core/util/app_image.dart';
import '../../../../widget_helper/responsive_safe_area.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter/material.dart';
import '../../../../main.dart';
import 'package:inoface/core/util/url_service.dart';



class RedirectEvenement extends StatelessWidget {
  final int idEve;
  RedirectEvenement({Key? key, required this.idEve}) : super(key: key);
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {

    return ResponsiveSafeArea(
      builder: (context) => Scaffold(
        body: FutureBuilder<Evenement?>(
          future: appDatabase.evenementsDao.getEvenementByIdEve(idEve),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              default:
                if (snapshot.hasData) {
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SizedBox(
                          height: 220,
                          width: MediaQuery.of(context).size.width,
                          child: FutureBuilder<List<Albumphoto>>(
                            future: appDatabase.albumphotosDao.getAlbumphotoByIdEve(idEve),
                            builder: (context, snapshot) {
                              switch (snapshot.connectionState) {
                                case ConnectionState.waiting:
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                default:
                                  List<Albumphoto> photos = snapshot.data ?? [];
                                  if (photos.isNotEmpty) {
                                    return CarouselSlider(
                                      carouselController: _controller,
                                      options: CarouselOptions(
                                        autoPlay: true,
                                        viewportFraction: 1.0,
                                        aspectRatio: MediaQuery.of(context).size.aspectRatio,
                                      ),
                                      items: photos.map((i) {
                                        return InkWell(
                                          onTap: () => Navigator.of(context).push(PageRouteBuilder(
                                              opaque: false,
                                              pageBuilder: (BuildContext context, _, __) =>
                                                  CustomDialogImage(photos: photos))),
                                          child: SizedBox(
                                            width: MediaQuery.of(context).size.width,
                                            child: CachedNetworkImage(
                                              imageUrl: UrlService.rewriteInoserUri('${i.lien_piece_jointe}'),
                                              fit: BoxFit.contain,
                                              placeholder: (context, url) =>
                                                  const Center(child: CircularProgressIndicator()),
                                              errorWidget: (context, url, error) => Center(
                                                child: Image.asset(AppImage.logo),
                                              ),
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    );
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
                        ListTile(
                          leading: const Icon(Icons.update),
                          title: Text(utilsLogic.convertDate(snapshot.data!.debut)),
                          subtitle: Text(utilsLogic.convertDate(snapshot.data!.fin)),
                        ),
                        const Divider(),
                        Container(
                          padding: const EdgeInsets.only(top: 8, left: 12, right: 12),
                          child: ListTile(
                            leading: const Icon(Icons.title),
                            title: Text(
                              '${snapshot.data?.titre}',
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            const SizedBox(height: 4),
                            if (snapshot.data?.description != null) ...[
                              Html(
                                data: '${snapshot.data?.description}',
                                style: {
                                  "div": Style(
                                    padding: HtmlPaddings.all(8),
                                    fontSize: FontSize(14),
                                  ),
                                },
                              ),
                              const SizedBox(height: 30),
                            ]
                          ],
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  );
                } else {
                  return const SizedBox.shrink();
                }
            }
          },
        ),
      ),
    );
  }
}
