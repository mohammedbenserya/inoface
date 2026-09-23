import '../../../widget_helper/loading_dialog.dart';
import '../../../core/usecases/constants.dart';
import '../../../core/util/url_service.dart';
import '../../../core/usecases/enums.dart';
import '../models/input_forgot_pass.dart';
import '../models/forgot_pass_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'forgot_pass_state.dart';
import 'package:get/get.dart';
import 'dart:convert';



class ForgotPassLogic extends GetxController {
  static ForgotPassLogic instance = Get.find();
  final state = ForgotPassState();


  Future<void> resetPass({
    required BuildContext context,
    required InputForgotPass input,
  }) async {
    try {
      LoadingDialog.show(context: context);
      final response = await http.post(
          Uri.parse(utilsLogic.getUrl(UrlService.FORGIT_PASSWORD)), body: {
        "inoface_ws" : input.toString(),
      });
      if (context.mounted) LoadingDialog.hide(context: context);
      // logger.i('response: ', response.body);
      if (response.statusCode == 200) {
        Map<String, dynamic> collection = await json.decode(response.body);
        ForgotPassModel model = ForgotPassModel.fromJson(collection);
        utilsLogic.showSnack(
          type: SnackBarType.info,
          // title: 'successfully'.tr,
          title: 'information'.tr,
          message: model.message,
        );
      } else {
        utilsLogic.showSnack(
          type: SnackBarType.error,
          message: 'error_server'.tr,
        );
      }
    } catch(e) {
      if (context.mounted) LoadingDialog.hide(context: context);
      utilsLogic.showSnack(type: SnackBarType.error, message: '$e');
    }
  }

}