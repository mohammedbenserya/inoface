import 'dart:convert';

import 'package:equatable/equatable.dart';

class InputQrcode extends Equatable {
  //final String token;
  final String scancode;
  final String? tokenmobile;

  const InputQrcode({
    required this.scancode,
    this.tokenmobile,
  });

  Map<String, dynamic> toJson() {
    return {
      'scancode': scancode,
      'tokenmobile': tokenmobile,
    };
  }

  String toString() {
    var body = {
      'scancode': scancode.replaceAll(' ', ''),
      'tokenmobile': tokenmobile?.replaceAll(' ', ''),
    };
    return json.encode(body);
  }

  @override
  List<Object?> get props => [scancode, tokenmobile];
}
