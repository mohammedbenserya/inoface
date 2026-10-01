import 'package:inoface/features/agenda/logic/agenda_logic.dart';
import 'package:rounded_background_text/rounded_background_text.dart';
import 'package:inoface/core/database/app_database.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:inoface/core/util/app_image.dart';
import '../../../../core/util/generateMaterialColor.dart';
import 'package:badges/badges.dart' as badge;
import '../../models/agenda_model.dart';
import 'package:flutter/material.dart';
import 'carousel_with_indicator.dart';
import 'package:lottie/lottie.dart';
import 'package:intl/intl.dart';
import '../../../../main.dart';
import 'package:get/get.dart';
import 'agenda_notes.dart';
import 'package:inoface/core/util/url_service.dart';




class LoadedAgenda extends StatefulWidget {
  final int idPersonne;
  final AgendaModel model;
  const LoadedAgenda({
    required this.model,
    required this.idPersonne,
    Key? key,
  }) : super(key: key);

  @override
  State<LoadedAgenda> createState() => _LoadedAgendaState();
}

class _LoadedAgendaState extends State<LoadedAgenda> {


  @override
  Widget build(BuildContext context) {
    if (widget.model.agendas.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: widget.model.agendas.map((agenda) {
            final hasPhoto = agenda.agendaPhotoDetails.isNotEmpty;
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                if (hasPhoto)
                  CarouselWithIndicator(photos: agenda.agendaPhotoDetails),

                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(12),
                        color: Colors.white,
                        width: Get.width - 32,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('${agenda.agenda_journee_type_description}',
                              maxLines: 1,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              DateFormat('dd MMMM yyyy', 'fr_FR').format(agenda.date_agenda),
                              textAlign: TextAlign.center,
                              style: subTextStyle.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                      FutureBuilder<List<AgendaDetail>>(
                        future: appDatabase.agendaDetailsDao.getAllAgendaDetailById(agenda.id_agenda),
                        builder: (context, snapDetails) {
                          switch (snapDetails.connectionState) {
                            case ConnectionState.waiting:
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            default:
                              final agendaDetails = snapDetails.data ?? [];
                              if (snapDetails.hasData && agendaDetails.isNotEmpty) {
                                return Wrap(
                                  alignment: WrapAlignment.center,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: agendaDetails.map((details) {
                                    return SizedBox(
                                      height: 190,
                                      width: (Get.width - 32)/2,
                                      // width: Get.width/2.4,
                                      // color: Colors.white,
                                      // padding: const EdgeInsets.only(bottom: 10),
                                      child: FutureBuilder<AgendaTypesDetail?>(
                                        future: appDatabase.agendaTypesDetailsDao.getAgendaTypesDetailById(details.id_agenda_type_detail),
                                        builder: (context, snapTypDetails) {
                                          switch (snapTypDetails.connectionState) {
                                            case ConnectionState.waiting:
                                              return const Center(
                                                child: CircularProgressIndicator(),
                                              );
                                            default:
                                              if (snapTypDetails.hasData) {
                                                return Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    border: Border.all(color: Colors.black12)
                                                  ),
                                                  padding: const EdgeInsets.all(8),
                                                  child: Column(
                                                    mainAxisSize: MainAxisSize.min,
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: <Widget>[
                                                      Flexible(
                                                        child: FutureBuilder<AgendaType?>(
                                                          future: appDatabase.agendaTypesDao.getAgendaTypesById(
                                                              snapTypDetails.data!.id_agenda_type),
                                                          builder: (context, snapType) {
                                                            switch (snapType.connectionState) {
                                                              case ConnectionState.waiting:
                                                                return const Center(
                                                                  child: CircularProgressIndicator(),
                                                                );
                                                              default:
                                                                if (snapType.hasData) {
                                                                  return Column(
                                                                    mainAxisSize: MainAxisSize.min,
                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                    children: <Widget>[
                                                                      Expanded(
                                                                        child: ClipOval(
                                                                          child: Container(
                                                                            decoration: BoxDecoration(
                                                                              color: Colors.white,
                                                                              borderRadius: BorderRadius.circular(100),
                                                                            ),
                                                                            child: CachedNetworkImage(
                                                                              cacheManager: DefaultCacheManager(),
                                                                              // height: 85, width: 85,
                                                                              fit: BoxFit.fitHeight,
                                                                              imageUrl: UrlService.rewriteInoserUri('${snapType.data?.lien_image}'),
                                                                              placeholder: (context, url) =>
                                                                              const Center(
                                                                                  child: CircularProgressIndicator()),
                                                                              errorWidget: (context, url, error) =>
                                                                              const Icon(Icons.error),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsets.symmetric(horizontal: 5),
                                                                        child: RoundedBackgroundText(
                                                                          '${snapType.data?.description}',
                                                                          maxLines: 1,
                                                                          textAlign: TextAlign.center,
                                                                          backgroundColor: Colors.white,
                                                                          style: titleTextStyle.copyWith(
                                                                            color: Colors.black,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  );
                                                                }
                                                                return const SizedBox();
                                                            }
                                                          },
                                                        ),
                                                      ),
                                                      ClipOval(
                                                        child: Container(
                                                          padding: const EdgeInsets.symmetric(horizontal: 5),
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(100),
                                                            color: Colors.white,
                                                          ),
                                                          child: CachedNetworkImage(
                                                            cacheManager: DefaultCacheManager(),
                                                            height: 60, width: 60,
                                                            fit: BoxFit.fill,
                                                            imageUrl: UrlService.rewriteInoserUri('${snapTypDetails.data?.lien_image}'),
                                                            placeholder: (context, url) =>
                                                            const Center(child: CircularProgressIndicator()),
                                                            errorWidget: (context, url, error) =>
                                                                Image.asset(AppImage.logo),
                                                          ),
                                                        ),
                                                      ),

                                                      if (snapTypDetails.data?.description != null)
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 6, right: 6, bottom: 6),
                                                          child: RoundedBackgroundText(
                                                            '${snapTypDetails.data!.description}',
                                                            textAlign: TextAlign.center,
                                                            maxLines: 2,
                                                            backgroundColor: Colors.white,
                                                            style: titleTextStyle.copyWith(
                                                              color: Colors.black87,
                                                              fontSize: 14,
                                                            ),
                                                            // maxLines: 2,
                                                            // style: titleTextStyle.copyWith(
                                                            //   color: Colors.black87,
                                                            //   fontSize: 14,
                                                            // ),
                                                          ),
                                                        ),

                                                    ],
                                                  ),
                                                );
                                              }
                                              return const SizedBox.shrink();
                                          }
                                        },
                                      ),
                                    );
                                  }).toList(),
                                );
                              }
                              return const SizedBox.shrink();
                          }
                        },
                      ),
                      InkWell(
                        onTap: () => Get.to(() => AgendaNotes(idAgenda: agenda.id_agenda)),
                        child: AbsorbPointer(
                          absorbing: true,
                          child: Container(
                            width: Get.width - 32,
                            // margin: const EdgeInsets.symmetric(horizontal: 24),
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            decoration: const BoxDecoration(
                              border: Border(
                                top: BorderSide(color: Colors.black12),
                              ),
                              color: Colors.white,
                            ),
                            height: 48,
                            child: Row(
                              children: <Widget>[
                                const SizedBox(width: 4),
                                Expanded(
                                  child: TextField(
                                    textCapitalization: TextCapitalization.sentences,
                                    // onChanged: (value) {},
                                    decoration: InputDecoration.collapsed(
                                      hintText: 'send_msg'.tr,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.send),
                                  iconSize: 25.0,
                                  color: Theme.of(context).primaryColor,
                                  onPressed: () => Get.to(() => AgendaNotes(
                                    idAgenda: agenda.id_agenda,
                                  )),
                                ),
                                StreamBuilder<List<AgendaNote>>(
                                  stream: appDatabase.agendaNotesDao.watchAllAgendaNoteById(agenda.id_agenda),
                                  builder: (context, snapNotes) {
                                    switch (snapNotes.connectionState) {
                                      case ConnectionState.waiting:
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      default:
                                        final agendaNotes = snapNotes.data ?? [];
                                        if (agendaNotes.isNotEmpty) {
                                          return badge.Badge(
                                            badgeContent: Text(
                                              "${agendaNotes.length}",
                                              style: const TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            badgeStyle: const badge.BadgeStyle(
                                              badgeColor: Colors.pink,
                                            ),
                                            // badgeColor: Colors.pink,
                                            child: const Icon(Icons.chat),
                                          );
                                        } else {
                                          return const SizedBox.shrink();
                                        }
                                    }
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            );
          }).toList(),
        ),
      );
    } else {
      return GetBuilder<AgendaLogic>(
        builder: (logic) {
          final date = logic.state.dateTimeLocal;
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Lottie.asset(
                    AppImage.jsonEmpty,
                    width: Get.width / 1.5,
                  ),
                  RoundedBackgroundText(
                    'agenda_empty'.trArgs([DateFormat('dd MMMM yyyy', 'fr_FR').format(date)]),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    // minFontSize: 16,
                    // maxFontSize: 18,
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
        },
      );
    }
  }
}
