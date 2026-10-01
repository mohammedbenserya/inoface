import 'package:inoface/features/evenements/presentation/widgets/details_evenement.dart';
import 'package:inoface/features/evenements/models/evenements_model.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:rounded_background_text/rounded_background_text.dart';
import 'package:inoface/core/database/app_database.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:inoface/core/usecases/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:inoface/core/util/app_image.dart';
import '../../../../core/util/generateMaterialColor.dart';
import 'package:inoface/core/util/static.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../../main.dart';
import 'package:get/get.dart';
import 'package:inoface/core/util/url_service.dart';




class LoadedEvenements extends StatelessWidget {
  final int idPersonne;
  final EvenementsModel model;
  LoadedEvenements({Key? key, 
  required this.model, 
  required this.idPersonne,
  }) : super(key: key);

  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        color: primaryColor,
        image: const DecorationImage(
          image: AssetImage(AppImage.bg),
          fit: BoxFit.cover,
          opacity: 0.6,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: StreamBuilder<List<Evenement>>(
          stream: appDatabase.evenementsDao.watchAllEvenementByIdPer(idPersonne),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              default:
                final events = snapshot.data ?? [];
                if (events.isEmpty) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Lottie.asset(
                            AppImage.jsonEmpty,
                            width: Get.width / 1.5,
                          ),
                          const SizedBox(height: 8),
                          RoundedBackgroundText(
                            'empty_event'.tr,
                            textAlign: TextAlign.center,
                            backgroundColor: Colors.grey.shade300,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              )
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: events.length,
                    padding: const EdgeInsets.only(bottom: 20),
                    itemBuilder: (BuildContext context, int index) {
                      return StreamBuilder<CountEvenement?>(
                        stream: appDatabase.countEvenementsDao.watchCountEvenementById(
                          idEve: events[index].id_evenement,
                          // idPer: idPersonne,
                        ),
                        builder: (context, snapCount) {
                          switch (snapCount.connectionState) {
                            case ConnectionState.waiting:
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            default:
                              return Container(
                                margin: const EdgeInsets.only(top: 8, bottom: 0, left: 12, right: 12),
                                child: Material(
                                  color: snapCount.hasData ? Colors.grey.shade300 : Colors.white,
                                  shadowColor: Colors.grey,
                                  elevation: 2,
                                  borderRadius: BorderRadius.circular(8),
                                  child: InkWell(
                                    onTap: () => Get.to(() => DetailsEvenement(events: events, index: index, idPersonne: idPersonne)),
                                    child: Padding(
                                      padding: const EdgeInsets.only(bottom: 8, left: 8, right: 8),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          FutureBuilder<List<Albumphoto>>(
                                            future: appDatabase.albumphotosDao.getAlbumphotoByIdEve(events[index].id_evenement),
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
                                                      return SizedBox(
                                                        width: MediaQuery.of(context).size.width,
                                                        height: 180,
                                                        child: CarouselSlider(
                                                          carouselController: _controller,
                                                          options: CarouselOptions(
                                                            autoPlay: true,
                                                            viewportFraction: 1.0,
                                                            aspectRatio:
                                                            MediaQuery.of(context).size.aspectRatio,
                                                          ),
                                                          items: photos.map((i) {
                                                            if (utilsLogic.checkList(Static.listPdf, '${i.lien_piece_jointe}')) {
                                                              return Container(
                                                                width: MediaQuery.of(context).size.width,
                                                                padding:
                                                                const EdgeInsets.symmetric(vertical: 20),
                                                                child: const Icon(
                                                                  Icons.picture_as_pdf,
                                                                  size: 80,
                                                                  color: Colors.pink,
                                                                ),
                                                              );
                                                            } else {
                                                              return SizedBox(
                                                                width: MediaQuery.of(context).size.width,
                                                                child: CachedNetworkImage(
                                                                  fit: BoxFit.cover,
                                                                  cacheManager: DefaultCacheManager(),
                                                                  imageUrl: UrlService.rewriteInoserUri('${i.lien_piece_jointe}'),
                                                                  placeholder: (context, url) => const Center(
                                                                    child: CircularProgressIndicator(),
                                                                  ),
                                                                  errorWidget: (context, url, error) => Center(
                                                                    child: Image.asset(AppImage.logo),
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                          }).toList(),
                                                        ),
                                                      );
                                                    } else {
                                                      if (utilsLogic.checkList(Static.listPdf, '${photos.first.lien_piece_jointe}')) {
                                                        return Container(
                                                          width: MediaQuery.of(context).size.width,
                                                          padding: const EdgeInsets.symmetric(vertical: 20),
                                                          child: const Icon(
                                                            Icons.picture_as_pdf,
                                                            size: 80,
                                                            color: Colors.pink,
                                                          ),
                                                        );
                                                      } else {
                                                        return SizedBox(
                                                          width: MediaQuery.of(context).size.width,
                                                          height: 180,
                                                          child: CachedNetworkImage(
                                                            cacheManager: DefaultCacheManager(),
                                                            imageUrl: UrlService.rewriteInoserUri('${photos.first.lien_piece_jointe}'),
                                                            placeholder: (context, url) => const Center(
                                                              child: CircularProgressIndicator(),
                                                            ),
                                                            errorWidget: (context, url, error) => Center(
                                                              child: Image.asset(AppImage.logo),
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
                                                        child: Image.asset(AppImage.logo, fit: BoxFit.contain),
                                                      ),
                                                    );
                                                  }
                                              }
                                            },
                                          ),
                                          ListTile(
                                            contentPadding: EdgeInsets.zero,
                                            horizontalTitleGap: 0,
                                            leading: Icon(
                                              MdiIcons.formatTitle,
                                              color: Colors.pink,
                                            ),
                                            title: Text(
                                              '${events[index].titre}',
                                              textAlign: TextAlign.start,
                                              overflow: TextOverflow.ellipsis,
                                              softWrap: false,
                                              maxLines: 1,
                                              style: const TextStyle(
                                                fontSize: 18,
                                                color: Colors.pink,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Icon(
                                                MdiIcons.calendarClock,
                                                color: Colors.pink,
                                              ),
                                              const SizedBox(width: 4),
                                              Flexible(
                                                child: Text(
                                                  'start_date'.tr,
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                              Text(utilsLogic.convertDate(events[index].debut)),
                                            ],
                                          ),
                                          const SizedBox(height: 8),
                                          Row(
                                            children: <Widget>[
                                              Icon(
                                                MdiIcons.calendarCheck,
                                                color: Colors.pink,
                                              ),
                                              const SizedBox(
                                                width: 4,
                                              ),
                                              Flexible(
                                                child: Text(
                                                  'end_date'.tr,
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                              Text(utilsLogic.convertDate(events[index].fin)),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                          }
                        },
                      );
                    },
                  );
                }
            }
          },
        ),
      ),
    );
  }
}
