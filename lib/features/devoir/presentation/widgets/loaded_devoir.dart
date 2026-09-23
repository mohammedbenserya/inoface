import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:inoface/features/devoir/logic/devoir_logic.dart';
import 'package:inoface/core/database/app_database.dart';
import 'package:inoface/core/usecases/constants.dart';
import 'package:inoface/core/util/static.dart';
import '../../models/devoir_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../main.dart';
import 'package:get/get.dart';


class LoadedDevoir extends StatelessWidget {
  final int idPersonne;
  final DevoirModel model;

  const LoadedDevoir({
    Key? key,
    required this.model,
    required this.idPersonne,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DevoirLogic>(
      builder: (logic) {
        final date = devoirState.dateTimeLocal;
        final format = DateFormat('yyyy-MM-dd').format(date);
        var parsedDate = DateTime.parse('$format 00:00:00.000');
        return FutureBuilder<List<Devoir>>(
          future: appDatabase.devoirsDao
              .getDevoirByDateAndIdPer(dateTime: parsedDate, idPer: idPersonne),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              default:
                final devoirs = snapshot.data ?? [];
                if (devoirs.isNotEmpty) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 45),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        top: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    child: Material(
                      elevation: 2,
                      borderRadius: BorderRadius.circular(8),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(
                                  top: 8, left: 12, right: 12),
                              child: Row(
                                children: [
                                  Text(
                                    DateFormat('EEEE MM yyyy', 'fr_FR')
                                        .format(date),
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              )),
                          Flexible(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: devoirs.length,
                              physics: const NeverScrollableScrollPhysics(),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 12),
                              itemBuilder: (context, index) {
                                final devoir = devoirs[index];
                                final lgn =
                                    '${devoir.matiere}'.contains("العربية");
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: lgn
                                      ? CrossAxisAlignment.end
                                      : CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(
                                        bottom: 2,
                                      ),
                                      decoration: const BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                        color: Colors.pink,
                                        width: 1.0, // Underline thickness
                                      ))),
                                      child: Text(
                                        '${devoir.matiere}',
                                        style: const TextStyle(
                                          fontSize: 20,
                                          color: Colors.pink,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      '- ${devoir.devoir_description}',
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                    if (devoir.devoir_detail != null) ...[
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                90,
                                        child: HtmlWidget(
                                            '${devoir.devoir_detail}'),
                                      ),
                                    ],
                                    FutureBuilder<List<DevoirPiecesjointe>>(
                                      future: appDatabase.devoirPiecesjointesDao
                                          .getDevoirPiecesjointeByById(
                                              devoir.id_devoir),
                                      builder: (context, snapJoin) {
                                        switch (snapJoin.connectionState) {
                                          case ConnectionState.waiting:
                                            return const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          default:
                                            final devoirPrieces =
                                                snapJoin.data ?? [];
                                            if (devoirPrieces.isNotEmpty) {
                                              return ListView.builder(
                                                shrinkWrap: true,
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                itemCount: devoirPrieces.length,
                                                itemBuilder: (context, index) {
                                                  final piecesjointe =
                                                      devoirPrieces[index];
                                                  return Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment: lgn
                                                        ? CrossAxisAlignment.end
                                                        : CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      lgn
                                                          ? const Text(
                                                              ':الوثائق المرفقة')
                                                          : Text(
                                                              'devoir_pieces_jointe'
                                                                  .tr),
                                                      if (utilsLogic.checkList(
                                                          Static.listPdf,
                                                          '${piecesjointe.lieu_piece_jointe}')) ...[
                                                        const SizedBox(
                                                            height: 5),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal:
                                                                      20),
                                                          child: InkWell(
                                                              onTap: () {
                                                                utilsLogic.requestDownload(
                                                                    context:
                                                                        context,
                                                                    url:
                                                                        '${piecesjointe.lieu_piece_jointe}');
                                                              },
                                                              child: Row(
                                                                mainAxisAlignment: lgn
                                                                    ? MainAxisAlignment
                                                                        .end
                                                                    : MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment: lgn
                                                                    ? CrossAxisAlignment
                                                                        .end
                                                                    : CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  if (lgn) ...[
                                                                    const Icon(
                                                                        Icons
                                                                            .picture_as_pdf,
                                                                        color: Colors
                                                                            .pink,
                                                                        size:
                                                                            25),
                                                                    Flexible(
                                                                      child:
                                                                          Text(
                                                                        '${piecesjointe.nom_original_piece_jointe}',
                                                                        textAlign:
                                                                            TextAlign.right,
                                                                        style:
                                                                            const TextStyle(
                                                                          fontSize:
                                                                              15,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ] else ...[
                                                                    Flexible(
                                                                      child:
                                                                          Text(
                                                                        '${piecesjointe.nom_original_piece_jointe}',
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style:
                                                                            const TextStyle(
                                                                          fontSize:
                                                                              15,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    const Icon(
                                                                        Icons
                                                                            .picture_as_pdf,
                                                                        color: Colors
                                                                            .pink,
                                                                        size:
                                                                            25),
                                                                  ],
                                                                ],
                                                              )),
                                                        ),
                                                      ] else ...[
                                                        const SizedBox(
                                                            height: 5),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal:
                                                                      20),
                                                          child: InkWell(
                                                              onTap: () => utilsLogic
                                                                  .requestDownload(
                                                                      context:
                                                                          context,
                                                                      url:
                                                                          '${piecesjointe.lieu_piece_jointe}'),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .end,
                                                                crossAxisAlignment: lgn
                                                                    ? CrossAxisAlignment
                                                                        .end
                                                                    : CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    '${piecesjointe.nom_original_piece_jointe}',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .right,
                                                                    style:
                                                                        const TextStyle(
                                                                      fontSize:
                                                                          15,
                                                                    ),
                                                                  ),
                                                                  Icon(
                                                                      MdiIcons
                                                                          .image,
                                                                      color: Colors
                                                                          .pink,
                                                                      size: 25),
                                                                ],
                                                              )),
                                                        ),
                                                      ],
                                                    ],
                                                  );
                                                },
                                              );
                                            } else {
                                              return const SizedBox.shrink();
                                            }
                                        }
                                      },
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return const SizedBox.shrink();
                }
            }
          },
        );
      },
    );
  }
}
