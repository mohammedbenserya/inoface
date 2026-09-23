import 'package:cached_network_image/cached_network_image.dart';
// import 'package:provider/provider.dart';
import 'package:rounded_background_text/rounded_background_text.dart';
import '../../../../main.dart';
import '../../../../widget_helper/responsive_safe_area.dart';
import '../../../../core/util/generateMaterialColor.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../../core/database/app_database.dart';
import '../../../../core/usecases/constants.dart';
import '../../../../core/util/app_image.dart';
import '../widgets/details_survey.dart';
import 'package:flutter/material.dart';
import '../../logic/survey_logic.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';




class SurveyPage extends StatelessWidget {
  const SurveyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final idPersonne = utilsState.enfant!.id_personne;
    return ResponsiveSafeArea(
      bottom: false,
      builder: (_) {
        return Container(
          decoration: BoxDecoration(
            color: primaryColor,
            image: const DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(AppImage.bg),
            ),
          ),
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text('survey'.tr),
            ),
            backgroundColor: Colors.transparent,
            body: GetBuilder<SurveyLogic>(
              init: surveyLogic,
              builder: (logic) {
                final sondages = logic.state.sondages;
                if (sondages.isNotEmpty) {
                  return ListView.builder(
                    padding: const EdgeInsets.only(bottom: 20),
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
                                                      imageUrl: i.lienPieceJointe,
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
                }
              },
            ),
          ),
        );
        /*
        return Scaffold(
          body: BlocProvider(
            create: (_) => getIt<SurveyCubit>()..getSurvey(idPersonne: idPersonne),
            child: BlocBuilder<SurveyCubit, SurveyState>(
              builder: (context, state) {
                if (state is SurveyInitial) {
                  return const LoadingApp();
                } else if (state is SurveyLoaded) {
                  return LoadedSurvey(model: state.model);
                } else if (state is SurveyError) {
                  return ErrorApp(message: state.message);
                } else {
                  return const ErrorApp();
                }
              },
            ),
          ),
        );
        */
      },
    );
  }
}
