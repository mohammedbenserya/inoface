import 'package:inoface/core/util/generateMaterialColor.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../widget_helper/custom_dialog_image.dart';
import '../../models/agenda_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


List<String> imgList = [];


class CarouselWithIndicator extends StatefulWidget {
  final List<AgendaPhotoDetailModel> photos;
  const CarouselWithIndicator({Key? key, required this.photos}) : super(key: key);

  @override
  State<CarouselWithIndicator> createState() => _CarouselWithIndicatorState();
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicator> {

  int _current = 0;

  @override
  void initState() {
    imgList.clear();
    imgList.addAll(widget.photos.map((e) => '${e.lieu_photo}').toList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => CustomDialogImage(photos: widget.photos, index: _current)),
      child: ImageSlideshow(
        indicatorColor: primaryColor,
        indicatorBackgroundColor: Colors.grey,
        height: 200,
        autoPlayInterval: 3000,
        onPageChanged: (index) => _current = index,
        isLoop: true,
        children: imgList.map((item) {
          return CachedNetworkImage(
            imageUrl: item,
            height: 200,
            fit: BoxFit.contain,
            progressIndicatorBuilder: (context, url, downloadProgress) => Center(
                  child: CircularProgressIndicator(value: downloadProgress.progress,
                    valueColor: const AlwaysStoppedAnimation<Color>(Colors.white)
                  ),
                ),
            // placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Center(child: Icon(Icons.error)),
          );
        }).toList(),
      ),
    );
  }
}
