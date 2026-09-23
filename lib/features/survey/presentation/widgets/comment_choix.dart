import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import '../../../../core/util/generateMaterialColor.dart';
import '../../models/survey_model.dart';
import '../../logic/survey_logic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';




class CommentChoix extends StatelessWidget {
  final Sondage sondage;
  final Question question;
  // final int idSondage;
  CommentChoix({Key? key,
    required this.question,
    required this.sondage,
    // required this.idSondage,
  }) : super(key: key);

  final surveyLogic = SurveyLogic.instance;


  @override
  Widget build(BuildContext context) {
    final commentController = TextEditingController(text: question.commentaire??'');
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      child: AbsorbPointer(
        absorbing: sondage.statut?.idStatut == 2,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            HtmlWidget(question.description),
            const SizedBox(height: 8),
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
            // Container(
            //   alignment: Alignment.centerRight,
            //   child: TextButton(
            //     child: Text('submit'.tr),
            //     onPressed: () {
            //       FocusManager.instance.primaryFocus?.unfocus();
            //       if (commentController.text.isNotEmpty) {
            //         final idQ = question.idSondageQuestion;
            //         final comment = commentController.text.trim();
            //         surveyLogic.saveComment(
            //           idSondage: sondage.idSondage,
            //           idSondageQuestion: idQ,
            //           comment: comment,
            //         );
            //       }
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
