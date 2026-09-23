import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import '../../../../core/util/generateMaterialColor.dart';
import 'package:checkbox_grouped/checkbox_grouped.dart';
import '../../models/survey_model.dart';
import '../../logic/survey_logic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';




class SingleChoix extends StatelessWidget {
  final Question question;
  final Sondage sondage;
  SingleChoix({Key? key,
    required this.question,
    required this.sondage,
  }) : super(key: key);

  final surveyLogic = SurveyLogic.instance;

  void _onChangedRadio(Choix? val) {
    if (val != null) {
      surveyLogic.saveSingleChoice(
        idSondage: sondage.idSondage,
        choix: val,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final initialValue = question.choix.firstWhereOrNull((element) => element.selected);
    final commentController = TextEditingController(text: question.commentaire??'');
    GroupController controller = GroupController(
      initSelectedItem: initialValue != null ? [initialValue] : []
    );
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      child: AbsorbPointer(
        absorbing: sondage.statut?.idStatut == 2,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            HtmlWidget(question.description),
            SimpleGroupedCheckbox<Choix>(
              controller: controller,
              onItemSelected: (data) {
                _onChangedRadio(data);
              },
              // disableItems: ["5"],
              itemsTitle: question.choix.map((e) => e.choix).toList(),
              values: question.choix,
              groupStyle: GroupStyle(
                activeColor: Colors.red,
                itemTitleStyle: const TextStyle(fontSize: 13),
              ),
              checkFirstElement: false,
            ),
            TextField(
              keyboardType: TextInputType.multiline,
              controller: commentController,
              minLines: 2,
              maxLines: 5,
              decoration: InputDecoration(
                filled: true,
                suffixIcon: TextButton(
                  child: Text('submit'.tr),
                  onPressed: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    if (commentController.text.isNotEmpty) {
                      final idQ = question.idSondageQuestion;
                      final comment = commentController.text.trim();
                      surveyLogic.saveComment(
                        idSondage: sondage.idSondage,
                        idSondageQuestion: idQ,
                        comment: comment,
                      );
                    }
                  },
                ),
                fillColor: backgroundColor,
                hintText: 'comment'.tr,
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(15),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: primaryColor),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
