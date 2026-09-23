import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SliderModel {
  Image? image;
  String title;
  String? desc;

  SliderModel({
    this.image,
    required this.title,
    this.desc,
  });

  void setImageAsset(Image imageAsset) {
    image = imageAsset;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDesc(String getDesc) {
    desc = getDesc;
  }

  Image? getImageAsset() {
    return image;
  }

  String getTitle() {
    return title;
  }

  String? getDesc() {
    return desc;
  }

  static List<SliderModel> getSlides() {
    List<SliderModel> slides = [];

    //! slider 1
    SliderModel sliderModel = SliderModel(
      title: 'slid_desc_1'.tr,
      // imageAssetPath: Images.info,
    );
    slides.add(sliderModel);

    //! slider 2
    sliderModel = SliderModel(
      title: 'slid_desc_2'.tr,
      // imageAssetPath: Images.event,
    );
    slides.add(sliderModel);

    //! slider 3
    sliderModel = SliderModel(
      title: 'slid_desc_3'.tr,
      // imageAssetPath: Images.agenda,
    );
    slides.add(sliderModel);

    //! slider 4
    sliderModel = SliderModel(
      title: 'slid_desc_4'.tr,
      // imageAssetPath: Images.jour,
    );
    slides.add(sliderModel);

    //! slider 5
    sliderModel = SliderModel(
      title: 'slid_desc_5'.tr,
      // imageAssetPath: Images.attestation,
    );
    slides.add(sliderModel);

    //! slider 6
    sliderModel = SliderModel(
      title: 'slid_desc_6'.tr,
      // imageAssetPath: Images.emploi,
    );
    slides.add(sliderModel);

    return slides;
  }
}
