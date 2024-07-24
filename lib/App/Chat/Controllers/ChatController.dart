import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  RxInt indecatorIndex = 0.obs;
  var groupController = PageController().obs;
  void changeGroupView(int value) => groupController.value.animateToPage(value,
      duration: const Duration(milliseconds: 500), curve: Curves.ease);
  void chabgeActiveIndecator(int value) => indecatorIndex.value = value;
}
