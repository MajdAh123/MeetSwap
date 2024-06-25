import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppSize {
  static double width = Get.width;
  static double height = Get.height;
  static const double paddingElements12 = 12.0;
  static const Widget sizedBoxEmpty = SizedBox();
  static const Widget sizedBox5 = SizedBox(
    height: 5,
    width: 5,
  );
  static const Widget sizedBox10 = SizedBox(
    height: 10,
    width: 10,
  );
  static const Widget sizedBox8 = SizedBox(
    height: 8,
    width: 8,
  );
  static const Widget sizedBox20 = SizedBox(
    height: 20,
    width: 20,
  );
}
