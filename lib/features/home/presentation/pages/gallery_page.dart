import 'package:inoface/widget_helper/responsive_safe_area.dart';
import 'package:inoface/widget_helper/custom_dialog_image.dart';
import 'package:rounded_background_text/rounded_background_text.dart';
import 'package:inoface/core/database/app_database.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:inoface/core/usecases/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../core/util/generateMaterialColor.dart';
import '../../../../core/util/app_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../../main.dart';
import 'package:get/get.dart';



class GalleryPage extends StatelessWidget {
  const GalleryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final enfant = utilsState.enfant!;
    return ResponsiveSafeArea(
      builder: (_) => Container(
        decoration: BoxDecoration(
          color: primaryColor,
          image: const DecorationImage(
            image: AssetImage(AppImage.bg),
            fit: BoxFit.cover,
            opacity: 0.6,
          ),
        ),
        child: Scaffold(
          appBar: AppBar(
            title: Text('gallery'.tr),
            centerTitle: true,
          ),
          backgroundColor: Colors.transparent,
          body: FutureBuilder<List<AgendaPhotoDetail>>(
            future: appDatabase.agendaPhotoDetailsDao.getAllAgendaPhotoDetailByIdPers(enfant.id_personne),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                default:
                  final agendas = snapshot.data ?? [];
                  if (agendas.isEmpty) {
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
                              'empty_gallery'.tr,
                              textAlign: TextAlign.center,
                              backgroundColor: Colors.grey.shade300,
                              style: const TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return GridView.builder(
                      itemCount: agendas.length,
                      padding: const EdgeInsets.only(bottom: 40),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: context.isPhone ? 2 : 3,
                      ),
                      itemBuilder: (context, index) {
                        final validPhoto = (agendas[index].lieu_photo != null);
                        if (validPhoto) {
                          return Card(
                            child: InkWell(
                              onTap: () => Get.to(() => CustomDialogImage(photos: agendas, index: index)), // Navigator.pushNamed(context, Constant.CUSTOM_DIALOG_IMAGE, arguments: agendas),
                              child: CachedNetworkImage(
                                cacheManager: DefaultCacheManager(),
                                fit: BoxFit.fill,
                                imageUrl: '${agendas[index].lieu_photo}',
                                placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) => const Center(
                                    child: Icon(Icons.info_outline,
                                      color: Colors.grey,
                                      size: 50,
                                    )
                                ),
                              ),
                            ),
                          );
                        } else {
                          return const SizedBox.shrink();
                        }
                      },
                    );
                  }
              }
            },
          ),
        ),
      ),
    );
  }
}
