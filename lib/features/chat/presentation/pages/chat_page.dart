import 'package:inoface/widget_helper/responsive_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveSafeArea(
      builder: (context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('chat'.tr),
        ),
      ),
    );
  }
}
