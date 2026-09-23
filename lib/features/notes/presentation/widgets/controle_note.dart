import 'package:inoface/features/notes/models/notes_model.dart';
import '../../../../widget_helper/responsive_safe_area.dart';
import '../../../../core/util/generateMaterialColor.dart';
import '../../../../core/util/app_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';




class ControleNote extends StatelessWidget {
  final ControlesNote controlesNote;
  const ControleNote({
    Key? key,
    required this.controlesNote,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveSafeArea(
      builder: (_) {
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
              title: Text(controlesNote.semestreDescription),
              centerTitle: true,
            ),
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: controlesNote.controles.map((controle) {
                  if (controle.notes.isEmpty) {
                    return Container(
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                      width: Get.width,
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(controle.controleDescription,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                              child: Text('no_results'.tr),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(controle.controleDescription,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controle.notes.length,
                              itemBuilder: (context, index) {
                                final note = controle.notes[index];
                                return Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        color: Colors.pink,
                                        height: 26, width: 4,
                                        margin: const EdgeInsets.only(right: 5),
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Text(note.matiereDescription),
                                            ),
                                            Text(note.note),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    );
                  }
                }).toList(growable: false),
              ),
            ),
            /*
            body: Column(
              children: [
                Text(note.semestreDescription,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: note.controles.length,
                    itemBuilder: (context, index) {
                      final controle = note.controles[index];
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                color: Colors.pink,
                                height: 22, width: 4,
                                margin: const EdgeInsets.only(right: 5),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(controle.controleDescription),
                                    ),
                                    Text(controle.note),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            */
            /*
            body: Material(
              child: ListTile(
                  title: Text(note.semestreDescription,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: note.controles.map((e) {
                      if (e.notes.isEmpty) return const SizedBox.shrink();
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // const SizedBox(height: 16),
                          // Text(e.controleDescription),
                          for (var note in e.notes)
                            Container(
                              margin: const EdgeInsets.only(top: 0, bottom: 8),
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        color: Colors.pink,
                                        height: 22, width: 4,
                                        margin: const EdgeInsets.only(right: 5),
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Text(note.matiereDescription),
                                            ),
                                            Text(note.note),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                        ],
                      );
                      return Theme(
                        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          initiallyExpanded: true,
                          shape: Border.all(
                            color: Colors.transparent,
                          ),
                          title: Text(e.controleDescription),
                          children: e.notes.map((note) {
                            return Card(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(note.matiereDescription),
                                    Text(note.note),
                                  ],
                                ),
                              ),
                            );
                          }).toList(growable: false),
                        ),
                      );
                      return Row(
                        children: [
                          Text(e.controleDescription),
                        ],
                      );
                    }).toList(growable: false),
                  )
              ),
            ),
            */
          ),
        );
      },
    );
  }
}
