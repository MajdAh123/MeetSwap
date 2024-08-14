import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EarningsContoller extends GetxController {
  var amountController = TextEditingController().obs;
  RxBool showText = false.obs;

  void startShowinText() {
    Future.delayed(Duration(seconds: 2)).then((value) {
      showText.value = true;
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
