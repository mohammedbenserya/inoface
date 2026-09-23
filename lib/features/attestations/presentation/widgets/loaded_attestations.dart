import 'package:inoface/features/attestations/models/add_demandeattestation_model.dart';
import 'package:inoface/features/attestations/models/demande_attestations_model.dart';
import 'package:inoface/features/attestations/bloc/attestations_bloc.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:rounded_background_text/rounded_background_text.dart';
import 'package:inoface/core/database/app_database.dart';
import 'package:inoface/core/usecases/constants.dart';
import 'package:inoface/core/util/app_image.dart';
import '../../../../core/util/generateMaterialColor.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:badges/badges.dart' as badge;
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../../main.dart';
import 'package:get/get.dart';



class LoadedAttestations extends StatelessWidget {
  final int idPersonne;
  final DemandeAttestationsModel? model;
  final AddDemandeattestationModel? addModel;
  const LoadedAttestations({
    this.model,
    this.addModel,
    required this.idPersonne,
    Key? key,
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
        appBar: AppBar(
          title: Text(
            'request_certificates'.tr,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add, color: Colors.white),
              onPressed: () => attestationsLogic.addDemandeAttestations(context, idPersonne).then((input) {
                if (input != null) {
                  context.read<AttestationsBloc>().add(AddDemandeAttestations(input: input));
                }
              }),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        body: StreamBuilder<List<DemandesAttestation>>(
          stream: appDatabase.demandesAttestationsDao.watchAllDemandesAttestationsById(idPersonne),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              default:
                final demandes = snapshot.data ?? [];
                if (demandes.isNotEmpty) {
                  return RefreshIndicator(
                    onRefresh: () => utilsLogic.checkSendAndRemoveDemandes(idPersonne),
                    child: ListView.builder(
                      itemCount: demandes.length,
                      padding: const EdgeInsets.only(top: 8, bottom: 20, left: 8, right: 8),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 6),
                          child: Material(
                            elevation: 2,
                            borderRadius: BorderRadius.circular(8),
                            color: (demandes[index].parentnom != null)
                                ? Colors.grey.shade300
                                : (demandes[index].remove ?? false)
                                ? Colors.grey.shade300
                                : Colors.white,
                            child: AbsorbPointer(
                              absorbing: (demandes[index].remove ?? false),
                              child: ListTile(
                                title: Text('${demandes[index].statut}'),
                                subtitle: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    if (demandes[index].parentnom != null) ...[
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text(
                                          '${demandes[index].parentnom}',
                                          style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],

                                    Text('date_demand'
                                        .trArgs([utilsLogic.convertDate(demandes[index].date_de_la_demande)]),
                                      style: const TextStyle(fontSize: 12),
                                    ),

                                    if (demandes[index].date_de_la_reception != null) ...[
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 8.0),
                                        child: Text(
                                          'date_receipt'
                                              .trArgs([utilsLogic.convertDate(demandes[index].date_de_la_reception!)]),
                                          style: const TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ],
                                ),
                                leading: badge.Badge(
                                  badgeContent: Text(
                                    "${demandes[index].nombre_de_copies}",
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  badgeStyle: badge.BadgeStyle(
                                    badgeColor: (demandes[index].remove ?? false) ? Colors.grey : Colors.pink,
                                  ),
                                  child: Icon(MdiIcons.file),
                                ),
                                trailing: demandes[index].idstatut == 1 && demandes[index].parentnom == null
                                    ? IconButton(
                                  icon: Icon(MdiIcons.deleteForever,
                                    color: (demandes[index].remove ?? false)
                                        ? Colors.grey : Colors.red,
                                  ),
                                  onPressed: () async {
                                    final navigator = Navigator.of(context);
                                    await utilsLogic.removeDemande(
                                      navigator: navigator,
                                      context: context,
                                      idPersonne: idPersonne,
                                      idEleveScolaire: demandes[index].id_eleve_attestation_scolaire,
                                    );
                                  },
                                ) : null,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
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
                              'empty_emploi'.tr,
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
