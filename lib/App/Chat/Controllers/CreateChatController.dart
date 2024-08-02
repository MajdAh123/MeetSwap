import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meetswap/App/SignUp/Components/SelectImage.dart';
import 'package:meetswap/App/SignUp/Models/InterestsModel.dart';

class CreateChatController extends GetxController {
  RxList<int> allUsers =
      [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15].obs;
  RxList<int> selectedUsers = <int>[].obs;
  var groupName = TextEditingController().obs;
  var groupDescription = TextEditingController().obs;
  RxInt groupType = 0.obs;
  Rx<File> groupPhoto = File("").obs;
  RxList<InterestsModel> selectedInterests = <InterestsModel>[].obs;
  void selectImage() async {
    XFile? image = await chooseImage();
    if (image != null) {
      groupPhoto.value = File(image.path);
      // Handle the selected image
    }
  }

  void capturePhoto() async {
    XFile? photo = await takePhoto();
    if (photo != null) {
      groupPhoto.value = File(photo.path);
      // Handle the captured photo
    }
  }
}
