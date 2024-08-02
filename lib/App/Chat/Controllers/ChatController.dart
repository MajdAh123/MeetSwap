import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  RxInt indecatorHomeIndex = 0.obs;
  RxInt indecatorMyGroupIndex = 0.obs;
  var groupHomeController = PageController().obs;
  var myGroupController = PageController().obs;
  void changeGroupHomeView(int value) =>
      groupHomeController.value.animateToPage(value,
          duration: const Duration(milliseconds: 500), curve: Curves.ease);
  void changeMyGroupView(int value) =>
      myGroupController.value.animateToPage(value,
          duration: const Duration(milliseconds: 500), curve: Curves.ease);
  void changeHomeActiveIndecator(int value) => indecatorHomeIndex.value = value;
  void changeMyGroupActiveIndecator(int value) =>
      indecatorMyGroupIndex.value = value;
  RxBool isEmptyView = true.obs;
}
