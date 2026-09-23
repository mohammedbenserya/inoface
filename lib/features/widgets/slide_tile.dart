import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/util/app_image.dart';

class SlideTile extends StatelessWidget {
  final String title;
  final String? desc;
  final Image? image;
  const SlideTile({
    required this.image,
    required this.title,
    this.desc,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: context.isPhone ? 20 : 60),
      alignment: Alignment.center,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 16),
            Expanded(
              child: image ??
                  Image.asset(
                    AppImage.defaultPhoto,
                    fit: BoxFit.contain,
                  ),
            ),
            const SizedBox(height: 16),
            Column(
              children: <Widget>[
                AutoSizeText(
                  title,
                  maxLines: 7,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
                if (desc != null) ...[
                  const SizedBox(height: 20),
                  AutoSizeText(
                    '$desc',
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ]
              ],
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
