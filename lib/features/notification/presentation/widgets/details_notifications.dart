import 'package:inoface/features/evenements/usecases/mobx_evenement.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:inoface/widget_helper/responsive_safe_area.dart';
import 'package:inoface/core/database/app_database.dart';
import 'package:inoface/core/usecases/constants.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';



class DetailsNotifications extends StatefulWidget {
  final int index;
  // final int idPersonne;
  final List<ParentNotification> notifications;
  const DetailsNotifications({
    Key? key,
    required this.notifications,
    required this.index,
    // required this.idPersonne,
  }) : super(key: key);

  @override
  _DetailsNotificationsState createState() => _DetailsNotificationsState();
}

class _DetailsNotificationsState extends State<DetailsNotifications> {

  final MobxEvenement _mobx = MobxEvenement();
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _mobx.onPageChanged(widget.index);
    _pageController = PageController(initialPage: widget.index);
    _decrementCounter();
  }

  _decrementCounter() async {
    try {
      if (widget.notifications.isNotEmpty) {
        await utilsLogic.viewNotificationById(
          idNotiy: widget.notifications[widget.index].id_parent_notification,
        );
        final idPersonne = utilsState.enfant?.id_personne;
        if (idPersonne != null) {
          await utilsLogic.updateCounter(idPer: idPersonne);
        }
      }
    } catch(e) {
      logger.e(e);
    }
  }


  @override
  Widget build(BuildContext context) {
    // final db = Provider.of<AppDatabase>(context);
    return ResponsiveSafeArea(
      bottom: false,
        builder: (_)=> Observer(
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
                        await utilsLogic.viewNotificationById(
                          idNotiy: widget.notifications[index].id_parent_notification,
                        );
                        final idPersonne = utilsState.enfant?.id_personne;
                        if (idPersonne != null) {
                          await utilsLogic.updateCounter(idPer: idPersonne);
                        }
                      },
                      children: getPages(widget.notifications),
                    ),
                  ),
                ),
                bottomSheet: Container(
                  height: 40,
                  color: Colors.white,
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      TextButton(
                        onPressed: () {
                          _pageController.animateToPage(_mobx.currentIndex - 1, duration: const Duration(milliseconds: 400), curve: Curves.linear);
                        },
                        child: const Icon(Icons.arrow_back, color: Colors.pink),
                      ),

                      SizedBox(
                        width: MediaQuery.of(context).size.width-200,
                        child: Center(
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            children: [
                              getPointWidgets(_mobx.currentIndex)
                            ],
                          ),
                        ),
                      ),

                      TextButton(
                        onPressed: () {
                          _pageController.animateToPage(_mobx.currentIndex + 1, duration: const Duration(milliseconds: 500), curve: Curves.linear);
                        },
                        child: const Icon(Icons.arrow_forward, color: Colors.pink),
                      ),
                    ],
                  ),
                )
            );
          },
        )
    );
  }

  List<Widget> getPages(List<ParentNotification> infos) {
    List<Widget> pages = [];
    for(int page = 0; page < infos.length; page++) {
      pages.add(SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:  Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.date_range, color: Colors.pink,),
                    title: Text(utilsLogic.convertDate(infos[page].date_de_notification)),
                  ),
                  const Divider(height: 3),
                  Container(
                    padding: const EdgeInsets.only(top: 8, left: 12, right: 12),
                    child: ListTile(
                      leading: const Icon(Icons.title),
                      title: Text(infos[page].titre,
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      const SizedBox(height: 4),
                      if (infos[page].detail != null) ...[
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 90,
                          child: HtmlWidget(infos[page].detail!),
                        ),
                        const SizedBox(height: 30),
                      ]
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ));
    }
    return pages;
  }

  Widget getPointWidgets(int slideIndex) {
    List<Widget> list = <Widget>[];
    for(var i = 0; i < widget.notifications.length; i++) {
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
