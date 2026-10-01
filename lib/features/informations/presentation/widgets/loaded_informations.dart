import 'dart:developer';

import 'package:inoface/features/informations/presentation/widgets/details_informations.dart';
import 'package:inoface/features/informations/models/informations_model.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:rounded_background_text/rounded_background_text.dart';
import 'package:inoface/core/database/app_database.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:inoface/core/usecases/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:inoface/core/util/static.dart';
import '../../../../core/util/generateMaterialColor.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../../core/util/app_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../../main.dart';
import 'package:get/get.dart';
import 'package:inoface/core/util/url_service.dart';



class LoadedInformations extends StatelessWidget {
  final int idPersonne;
  final InformationsModel model;
  LoadedInformations({Key? key,
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
          opacity: 0.6
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: StreamBuilder<List<Information>>(
          stream: appDatabase.informationsDao.watchAllInformationByIdPer(idPersonne),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              default:
                List<Information> infos = snapshot.data ?? [];
                log('infos: ${infos.length}');
                if (infos.isEmpty) {
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
                              'empty_info'.tr,
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
                    itemCount: infos.length,
                    padding: const EdgeInsets.only(bottom: 20),
                    itemBuilder: (BuildContext context, int index) {
                      return StreamBuilder<CountInformation?>(
                        stream: appDatabase.countInformationsDao.watchCountInformationId(
                          idInfo: infos[index].id_information,
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
                                    onTap: () => Get.to(() => DetailsInformations(infos: infos, index: index, idPersonne: idPersonne)),
                                    child: Padding(
                                      padding: const EdgeInsets.only(bottom: 8, left: 8, right: 8),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          FutureBuilder<List<Piecesjointe>>(
                                            future: appDatabase.piecesjointesDao
                                                .getAllPiecesjointeByIdPer(infos[index].id_information),
                                            builder: (context, snapshot) {
                                              switch (snapshot.connectionState) {
                                                case ConnectionState.waiting:
                                                  return const Center(
                                                    child: CircularProgressIndicator(),
                                                  );
                                                default:
                                                  List<Piecesjointe> pieces = snapshot.data ?? [];
                                                  if (pieces.isNotEmpty) {
                                                    if (pieces.length > 1) {
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
                                                          items: pieces.map((i) {
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
                                                      if (utilsLogic.checkList(Static.listPdf, '${pieces.first.lien_piece_jointe}')) {
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
                                                          height: 180,
                                                          width: MediaQuery.of(context).size.width,
                                                          child: CachedNetworkImage(
                                                            cacheManager: DefaultCacheManager(),
                                                            imageUrl: UrlService.rewriteInoserUri('${pieces.first.lien_piece_jointe}'),
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
                                              '${infos[index].titre}',
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
                                              const SizedBox(
                                                width: 4,
                                              ),
                                              Flexible(
                                                child: Text(
                                                  'start_date'.tr,
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                              Text(utilsLogic.convertDate(infos[index].debut)),
                                            ],
                                          ),
                                          const SizedBox(height: 8),
                                          Row(
                                            children: <Widget>[
                                              Icon(
                                                MdiIcons.calendarCheck,
                                                color: Colors.pink,
                                              ),
                                              const SizedBox(width: 4),
                                              Flexible(
                                                child: Text(
                                                  'end_date'.tr,
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                              Text(utilsLogic.convertDate(infos[index].fin)),
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
