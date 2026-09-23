import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:inoface/core/models/demandes_recuperation_model.dart';
import 'package:inoface/core/database/app_database.dart';
import 'package:inoface/core/usecases/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:inoface/core/util/app_image.dart';
// import 'package:provider/provider.dart';
import '../../../../core/util/generateMaterialColor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

import '../../../../main.dart';



class LoadedDemandeRecuperation extends StatelessWidget {
  final DemandesRecuperationModel model;
  LoadedDemandeRecuperation({Key? key,
    required this.model,
  }) : super(key: key);

  final DateFormat dateFormat = DateFormat.yMMMMd('fr');

  @override
  Widget build(BuildContext context) {
    final enfants = utilsState.enfants;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'menu_recuperation'.tr,
          style: const TextStyle(fontSize: 16),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Get.back(),
        ),
      ),
      backgroundColor: backgroundColor,
      body: StreamBuilder<List<Recuperation>>(
        stream: appDatabase.recuperationsDao.watchRecuperationByDate(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(),
              );
            default:
              final recuperations = snapshot.data ?? [];
              if (recuperations.isNotEmpty) {
                return ListView.builder(
                  itemCount: recuperations.length,
                  itemBuilder: (context, index) {
                    final demande = recuperations[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: Material(
                        elevation: 2,
                        borderRadius: BorderRadius.circular(8),
                        child: ListTile(
                          title: Text(
                            'demande_envoyee'.tr,
                          ),
                          subtitle: Text(dateFormat.format(demande.date_de_la_demande)),
                          leading: Icon(
                            MdiIcons.carSide,
                            size: 35,
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.cancel),
                            onPressed: () async {
                              final inputLogin = authState.inputLogin!;
                              await recuperationLogic.removeDemanderecuperationDialog(
                                context: context,
                                demande: demande,
                              ).then((value) {
                                if (value) {
                                  recuperationLogic.removeDemanderecuperation(inputLogin, demande.id_eleve_recuperations);
                                }
                              });
                            },
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else {
                return Center(
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: enfants.map((element) {
                      return Container(
                        width: Get.width / 2.5,
                        padding: const EdgeInsets.all(5),
                        child: ClipOval(
                          child: CachedNetworkImage(
                            imageUrl: element.photo ?? '',
                            fit: BoxFit.contain,
                            placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) => SizedBox(
                              width: Get.width / 2.5,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image.asset(AppImage.defaultPhoto),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(element.nom,
                                        maxLines: 1,
                                        style: GoogleFonts.acme(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.pink,
                                          fontSize: 18,
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                );
              }
          }
        },
      ),
      floatingActionButton: StreamBuilder<List<Recuperation>>(
        stream: appDatabase.recuperationsDao.watchRecuperationByDate(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(),
              );
            default:
              final recuperations = snapshot.data ?? [];
              if (recuperations.isEmpty) {
                return FloatingActionButton(
                  child: Icon(
                    MdiIcons.carSide,
                    color: Colors.white,
                    size: 35,
                  ),
                  onPressed: () async {
                    final inputLogin = authState.inputLogin!;
                    final enfants = utilsState.enfants;
                    await recuperationLogic.addDemanderecuperationDialog(
                      context: context,
                      enfants: enfants,
                    ).then((value) {
                      if (value) {
                        recuperationLogic.addDemanderecuperation(inputLogin);
                      }
                    });
                  },
                );
              } else {
                return FloatingActionButton(
                  backgroundColor: Colors.white,
                  child: Icon(
                    MdiIcons.carSide,
                    color: Colors.grey,
                    size: 35,
                  ),
                  onPressed: null,
                );
              }
          }
        },
      ),
    );
  }
}
