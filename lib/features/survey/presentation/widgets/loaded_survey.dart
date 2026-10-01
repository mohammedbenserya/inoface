import 'package:inoface/features/survey/models/survey_model.dart';
import 'package:inoface/features/survey/logic/survey_logic.dart';
import 'package:inoface/core/util/generateMaterialColor.dart';
import 'package:inoface/core/database/app_database.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:inoface/core/util/app_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
// import 'package:provider/provider.dart';
import '../../../../core/usecases/constants.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';
import '../../../../main.dart';
import 'details_survey.dart';
import 'package:inoface/core/util/url_service.dart';



class LoadedSurvey extends StatelessWidget {
  final SurveyModel model;
  const LoadedSurvey({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final idPersonne = utilsState.enfant!.id_personne;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('survey'.tr),
      ),
      backgroundColor: backgroundColor,
      body: GetBuilder<SurveyLogic>(
        builder: (logic) {
          final sondages = logic.state.sondages;
          if (sondages.isNotEmpty) {
            return ListView.builder(
              itemCount: sondages.length,
              itemBuilder: (context, index) {
                final sondage = sondages[index];
                return StreamBuilder<CountSondage?>(
                  stream: appDatabase.countSondagesDao.watchCountSondageByIdPerAndId(
                    idEve: sondage.idSondage,
                    idPer: idPersonne,
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
                              onTap: () => Get.to(() => DetailsSurvey(
                                sondage: sondage,
                                // index: index,
                              )),
                              child: SizedBox(
                                height: Get.height/3,
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: (sondage.piecesjointes.isNotEmpty) ?
                                      SizedBox(
                                        width: Get.width,
                                        child: Hero(
                                          tag: sondage.idSondage,
                                          child: CarouselSlider(
                                            options: CarouselOptions(
                                              autoPlay: true,
                                              viewportFraction: 1.0,
                                              // aspectRatio: MediaQuery.of(context).size.aspectRatio/1.5,
                                            ),
                                            items: sondage.piecesjointes.map((i) {
                                              return CachedNetworkImage(
                                                width: Get.width,
                                                fit: BoxFit.fill,
                                                imageUrl: UrlService.rewriteInoserUri(i.lienPieceJointe),
                                                placeholder: (context, url) => const Center(
                                                  child: CircularProgressIndicator(),
                                                ),
                                                errorWidget: (context, url, error) => Center(
                                                  child: Image.asset(AppImage.logo),
                                                ),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ) : Hero(
                                        tag: sondage.idSondage,
                                        child: Image.asset(
                                          AppImage.logo,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    const Divider(),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 6),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(sondage.titre,
                                            style: TextStyle(
                                              color: primaryColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),

                                          if (sondage.statut != null)
                                            Text(sondage.statut?.sondageStatut??'',
                                              style: TextStyle(
                                                color: HexColor('${sondage.statut?.color}'),
                                                fontSize: 16,
                                              ),
                                            ),
                                        ],
                                      ),
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
          } else {
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

                    Text(
                      'empty_info'.tr,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
