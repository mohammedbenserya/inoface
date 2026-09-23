import 'package:get/get.dart';


class ForgotPassModel {

  final bool error;
  final String message;

  const ForgotPassModel({
    required this.error,
    required this.message
  });

  factory ForgotPassModel.fromJson(Map<String, dynamic> json) {
    return ForgotPassModel(
      error: json['error'] ?? true,
      message: json['message'] ?? 'error_server'.tr,
    );
  }
}