import 'package:inoface/features/settings/domain/usecases/feedback_mobx.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:inoface/core/util/generateMaterialColor.dart';
import 'package:inoface/core/usecases/constants.dart';
import 'package:inoface/core/usecases/enums.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SendFeedback extends StatelessWidget {
  SendFeedback({Key? key}) : super(key: key);

  final TextEditingController _controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final String username = 'inoser.maroc@gmail.com';
  final FeedbackMobx _mobx = FeedbackMobx();
  final String password = 'Inoser123456';
  final attachArgs = 'attach';
  List<String> listTopic = [
    'title_feed1'.tr,
    'title_feed2'.tr,
    'title_feed3'.tr,
    'title_feed4'.tr,
    'title_feed5'.tr,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyColor,
      appBar: AppBar(
        title: Text('feedback'.tr),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            Observer(
              builder: (_) => Container(
                padding: const EdgeInsets.only(top: 20, left: 16, right: 16, bottom: 16),
                child: DropdownButton<String>(
                  hint: Text(
                    _mobx.topic,
                    style: TextStyle(
                      fontSize: 20,
                      color: headlineColor,
                    ),
                  ),
                  isExpanded: true,
                  iconSize: 30,
                  underline: Container(
                    height: 1.0,
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.transparent,
                          width: 0.0,
                        ),
                      ),
                    ),
                  ),
                  items: listTopic.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (val) => _mobx.selectTopic(val),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, left: 16, right: 16, bottom: 16),
              color: backgroundColor,
              child: TextFormField(
                validator: (val) {
                  final field = val ?? '';
                  if (field.isEmpty) {
                    return 'required_field'.tr;
                  }
                  return null;
                },
                controller: _controller,
                minLines: 8,
                maxLines: 15,
                autocorrect: false,
                decoration: InputDecoration(
                  hintText: 'msg_about_app'.tr,
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedErrorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  fillColor: Colors.white,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              padding: const EdgeInsets.only(top: 30),
              child: ElevatedButton.icon(
                icon: Icon(MdiIcons.send),
                label: Padding(
                  padding: const EdgeInsets.only(top: 14, bottom: 14),
                  child: Text('send'.tr),
                ),
                onPressed: () async {
                  if (networkState.isConnected) {
                    if (_formKey.currentState?.validate() ?? false) {
                      /*
                      final smtpServer = gmail(username, password);

                      final message = Message()
                        ..from = Address(username, 'Inoface Feedback')
                        ..recipients.add('alareqimazen@gmail.com')
                        ..subject = '${_mobx.topic} :: 🛎️'
                        ..text = 'Date time: ${DateTime.now()}.\nMessage: ${_controller.text}'
                        ..html = "<p>Date time: ${DateTime.now()}</p>\n<p>Message: ${_controller.text}</p>";

                      try {
                        _controller.clear();
                        final sendReport = await send(message, smtpServer);
                        logger.i('Message sent: ' + sendReport.toString());
                        _controller.clear();
                        FlashHelper.successBar(message: 'message_send'.tr);
                      } on MailerException catch (e) {
                        FlashHelper.errorBar(message: 'message_not_send'.tr);
                        for (var p in e.problems) {
                          logger.e('Problem: ${p.code}: ${p.msg}');
                        }
                      }
                      */
                    }
                  } else {
                    utilsLogic.showSnack(type: SnackBarType.unconnected);
                  }
                },
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
