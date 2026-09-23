import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:inoface/core/usecases/constants.dart';
import '../../../../core/util/generateMaterialColor.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:after_layout/after_layout.dart';
import '../../../../core/util/app_image.dart';
import '../../models/tabs_survey_model.dart';
import '../../models/survey_model.dart';
import '../../logic/survey_logic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';



class DetailsSurvey extends StatefulWidget {
  // final int index;
  final Sondage sondage;
  const DetailsSurvey({
    Key? key,
    required this.sondage,
    // required this.index,
  }) : super(key: key);

  @override
  State<DetailsSurvey> createState() => _DetailsSurveyState();
}

class _DetailsSurveyState extends State<DetailsSurvey>
    with AfterLayoutMixin<DetailsSurvey>, SingleTickerProviderStateMixin<DetailsSurvey> {

  final List<TabsSurveyModel> _tabs = <TabsSurveyModel>[];
  final surveyLogic = SurveyLogic.instance;
  late TabController tabController;


  @override
  void initState() {
    super.initState();
    _tabs.clear();
    surveyLogic.state.widgets.clear();
    tabController = TabController(
      length: widget.sondage.questions.length,
      initialIndex: 0,
      vsync: this,
    );

    int length = widget.sondage.questions.length;
    for (int index = 0; index < length; index++) {
      final idSondage = widget.sondage.questions[index].idSondage;
      final idQ = widget.sondage.questions[index].idSondageQuestion;
      _tabs.add(TabsSurveyModel(
        name: 'Q${index+1}',
        idSondageQuestion: idQ,
        idSondage: idSondage,
      ));

      final sondage = surveyLogic.state.sondages.firstWhere((element) => element.idSondage == idSondage);
      final question = sondage.questions.firstWhere((element) => element.idSondageQuestion == idQ);
      surveyLogic.initTabWidget(question, widget.sondage);
    }
    tabController.addListener(_handleSelected);
    incrementCounter();
  }

  incrementCounter() async {
    try {
      final idPersonne = utilsState.enfant?.id_personne;
      if (idPersonne != null) {
        await surveyLogic.viewSondageById(
          idPer: idPersonne,
          idEven: widget.sondage.idSondage,
        );
        await utilsLogic.updateCounter(idPer: idPersonne);
        // utilsLogic.setMainCountsModel(countsModel);
      }
    } catch (e) {
      logger.e(e);
    }
  }


  void _handleSelected() {
    if (tabController.indexIsChanging) {
      surveyLogic.onPageChanged(tabController.index);
    }
  }


  @override
  void dispose() {
    surveyLogic.checkState(widget.sondage);
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(widget.sondage.titre)
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (widget.sondage.piecesjointes.isNotEmpty)
                  SizedBox(
                    height: Get.height/3,
                    width: Get.width,
                    child: Hero(
                      tag: widget.sondage.idSondage,
                      child: CarouselSlider(
                        options: CarouselOptions(
                          autoPlay: true,
                          viewportFraction: 1.0,
                        ),
                        items: widget.sondage.piecesjointes.map((i) {
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
                  )
                else
                  SizedBox(
                    height: Get.height/3,
                    width: Get.width,
                    child: Hero(
                      tag: widget.sondage.idSondage,
                      child: Image.asset(
                        AppImage.logo,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),

                Card(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                    child: HtmlWidget(widget.sondage.description),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
                  child: Text('questions'.tr,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    ),
                  ),
                ),

                Material(
                  color: Colors.transparent,
                  child: TabBar(
                    labelColor: Colors.black,
                    indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(color: primaryColor, width: 1.0),
                      insets: const EdgeInsets.symmetric(horizontal: 20),
                    ),
                    controller: tabController,
                    tabs: _tabs.map((item) => Tab(
                      child: Text(item.name,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    )).toList(),
                  ),
                ),

                Obx(() {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 90),
                    child: Center(
                      child: surveyLogic.state.widgets[surveyLogic.state.currentIndex.value],
                    ),
                  );
                }),
              ],
            ),
          ],
        ),
      ),
      bottomSheet: (_tabs.length > 1) ? Container(
        height: 50,
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Obx(() {
          return Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              TextButton(
                onPressed: (surveyLogic.state.currentIndex.value == 0) ? null : () {
                  tabController.animateTo(surveyLogic.state.currentIndex.value - 1);
                },
                child: const Icon(Icons.arrow_back),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 200,
                child: Center(
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: [getPointWidgets(surveyLogic.state.currentIndex.value)],
                  ),
                ),
              ),
              TextButton(
                onPressed: (surveyLogic.state.currentIndex.value == _tabs.length-1) ? null : () {
                  tabController.animateTo(surveyLogic.state.currentIndex.value + 1);
                },
                child: const Icon(Icons.arrow_forward),
              ),
            ],
          );
        }),
      ) : null,
    );
  }

  Widget getPointWidgets(int slideIndex) {
    List<Widget> list = <Widget>[];
    for (var i = 0; i < widget.sondage.questions.length; i++) {
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

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) async {
    surveyLogic.onPageChanged(0);
    if (widget.sondage.statut ==  null ||
        widget.sondage.statut?.idStatut == -1) {
      await surveyLogic.setStatueSurvey(widget.sondage, 1);
    }
  }

}
