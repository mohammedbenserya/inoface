import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:inoface/widget_helper/responsive_safe_area.dart';
import 'package:inoface/core/util/generateMaterialColor.dart';
import '../../../../core/util/app_image.dart';
import '../../../../widget_helper/loading_app.dart';
import '../controller/notes_logic.dart';
import '../widgets/controle_note.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class NotesScreen extends StatelessWidget {
  const NotesScreen({Key? key}) : super(key: key);

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
              title: Text('notes'.tr),
              centerTitle: true,
            ),
            backgroundColor: Colors.transparent,
            body: GetBuilder<NotesLogic>(
              init: NotesLogic(),
              builder: (logic) {
                if (logic.state.isLoading) {
                  return const LoadingApp();
                } else {
                  return GridView.builder(
                    padding: const EdgeInsets.only(top: 8),
                    itemCount: logic.state.notes.controlesNotes.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      final note = logic.state.notes.controlesNotes[index];
                      return Card(
                        child: InkWell(
                          onTap: () => Get.to(() => ControleNote(controlesNote: note)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(MdiIcons.calendarMultiselectOutline,
                                size: 40, color: primaryColor,
                              ),
                              Text(note.semestreDescription,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        );
      },
    );
  }
}
