import 'dart:io';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meetswap/App/SignUp/Components/SelectImage.dart';
import 'package:meetswap/Constant/Colors.dart';
import 'package:meetswap/Constant/Size.dart';
import 'package:meetswap/Constant/policy.dart';

class ProfileController extends GetxController {
  var greetController = TextEditingController().obs;
  RxBool reaingsSecur = true.obs;
  RxBool numOfencoSecur = false.obs;
  RxBool lobbySecur = true.obs;
  RxBool visitSecur = true.obs;
  RxBool onlineSecur = true.obs;
  RxBool ageSecur = true.obs;
  RxBool whoCanMessageSecur = true.obs;
  Rx<File> userPhoto = File("").obs;
  var userName = TextEditingController().obs;
  var userDOBTextField = TextEditingController().obs;
  var userNationalty = TextEditingController().obs;
  var userDOB = DateTime(DateTime.now().year - AppPolicy.minimumeYear,
          DateTime.now().month, DateTime.now().day)
      .obs;
  RxInt maxData = (DateTime.now().year - AppPolicy.minimumeYear).obs;

  RxInt userGander = 0.obs;
  void selectImage() async {
    XFile? image = await chooseImage();
    if (image != null) {
      userPhoto.value = File(image.path);
      // Handle the selected image
    }
  }

  void capturePhoto() async {
    XFile? photo = await takePhoto();
    if (photo != null) {
      userPhoto.value = File(photo.path);
      // Handle the captured photo
    }
  }

  selectDOBBottom() {
    showCupertinoModalPopup<void>(
      context: Get.context!,
      builder: (BuildContext context) => Container(
        height: AppSize.height * 0.3,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
          color: AppColor.seconderyColor,
        ),
        child: SafeArea(
          top: false,
          child: CupertinoDatePicker(
            maximumYear: maxData.value,
            minimumYear: 1900,
            initialDateTime: userDOB.value,
            mode: CupertinoDatePickerMode.date,
            use24hFormat: true,
            showDayOfWeek: true,
            onDateTimeChanged: (DateTime newDate) {
              userDOB.value = newDate;
              userDOBTextField.value.text =
                  DateFormat("dd/MM/yyyy").format(newDate);
              // formatDate(_selectedDate!, [dd, ' / ', mm, ' / ', yyyy]);
            },
          ),
        ),
      ),
    );
  }

  @override
  void onInit() {
    userDOBTextField.value.text =
        DateFormat("dd/MM/yyyy").format(userDOB.value);
    userNationalty.value.text = "🇦🇪  United Arab Emirates";
    // TODO: implement onInit
    super.onInit();
  }
}
