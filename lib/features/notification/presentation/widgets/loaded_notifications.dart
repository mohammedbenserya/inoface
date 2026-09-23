import 'package:inoface/features/notification/presentation/widgets/details_notifications.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:inoface/core/database/app_database.dart';
import 'package:inoface/core/usecases/constants.dart';
// import 'package:provider/provider.dart';
import 'package:rounded_background_text/rounded_background_text.dart';
import '../../../../core/util/generateMaterialColor.dart';
import '../../../../main.dart';
import '../../models/parent_notifications_model.dart';
import '../../../../core/util/app_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';



class LoadedNotifications extends StatelessWidget {
  final int idPersonne;
  final ParentNotificationsModel model;
  const LoadedNotifications({Key? key,
    required this.model, required this.idPersonne,
  }) : super(key: key);

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
        body: StreamBuilder<List<ParentNotification>>(
          stream: appDatabase.parentNotificationsDao.watchAooParentNotificationsByDate(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              default:
                List<ParentNotification> notifications = snapshot.data ?? [];
                if (notifications.isNotEmpty) {
                  return ListView.builder(
                    itemCount: notifications.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 6, left: 8, right: 8),
                        child: StreamBuilder(
                          stream: appDatabase.countNotificationsDao.watchCountNotificationByIdPerAndId(
                            idnotify: notifications[index].id_parent_notification,
                          ),
                          builder: (context, snapCount) {
                            switch (snapCount.connectionState) {
                              case ConnectionState.waiting:
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              default:
                                return Material(
                                  color: snapCount.hasData ? Colors.grey.shade300 : Colors.white,
                                  elevation: 2,
                                  shadowColor: Colors.grey,
                                  borderRadius: BorderRadius.circular(8),
                                  child: InkWell(
                                    onTap: () => Get.to(() => DetailsNotifications(
                                      index: index,
                                      // idPersonne: idPersonne,
                                      notifications: notifications,
                                    )),
                                    child: Padding(
                                      padding: const EdgeInsets.only(bottom: 8),
                                      child:  ListTile(
                                        leading: Icon(
                                          MdiIcons.formatTitle,
                                          color: Colors.pink,
                                        ),
                                        title: Text(
                                          notifications[index].titre,
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
                                        subtitle: Row(
                                          children: <Widget>[
                                            Icon(
                                              MdiIcons.calendarClock,
                                              color: Colors.pink,
                                            ),
                                            const SizedBox(
                                              width: 4,
                                            ),
                                            Text(utilsLogic.convertDate(notifications[index].date_de_notification),
                                            ),
                                          ],
                                        ),
                                        trailing: const Icon(Icons.arrow_forward_ios),
                                      ),
                                    ),
                                  ),
                                );
                            }
                          },
                        ),
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
            }
          },
        ),
      ),
    );
  }
}
