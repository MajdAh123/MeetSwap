import 'dart:io';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:meetswap/App/SignUp/View/SignUpDetailsViewPage.dart';
import 'package:meetswap/Constant/ImagesPath.dart';
import 'package:meetswap/Constant/policy.dart';
// import 'package:open_mail_app/open_mail_app.dart';
import 'package:image_picker/image_picker.dart';

import '../Components/SelectImage.dart';

class SignUpController extends GetxController {
  RxBool isSend = false.obs, isLogIn = false.obs;

  var emailController = TextEditingController().obs;
  var usernameController = TextEditingController().obs;
  var greetController = TextEditingController().obs;
  RxString emailValedation = "".obs;
  RxString userNameValedation = "".obs;
  RxInt currentIndex = 0.obs;
  RxInt completeCurrentIndex = 0.obs;
  RxString gander = "female".obs;
  RxBool isMale = false.obs;
  RxList<int> addedInterestes = <int>[].obs;
  Rx<File> userPhoto = File("").obs;
  // XFile? userPhoto;
  var userDOB = DateTime(DateTime.now().year - AppPolicy.minimumeYear,
          DateTime.now().month, DateTime.now().day)
      .obs;
  RxInt maxData = (DateTime.now().year - AppPolicy.minimumeYear).obs;

  void changeToLogin() async {
    isLogIn.value = !isLogIn.value;
  }

  static const platform = MethodChannel('com.example.meetswap/email');

  Future<void> _openEmailApp() async {
    if (Platform.isAndroid) {
      try {
        await platform.invokeMethod('openEmailApp');
      } on PlatformException catch (e) {
        print("Failed to open email app: '${e.message}'.");
      }
    } else if (Platform.isIOS) {
      const url = 'message://';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        print('Could not launch email app');
      }
    }
  }

  Future<void> handelSend() async {
    emailValedation.value = "";
    if (!emailController.value.text.isEmail) {
      emailValedation.value = "Please enter a valid email address";
    } else if (isSend.isFalse) {
      isSend.value = true;
    } else if (isSend.isTrue) {
      _openEmailApp();
      // var result = await OpenMailApp.openMailApp();
      await Future.delayed(Duration(seconds: 5))
          .then((value) => Get.to(() => SignUpDetailsView()));
      // print(result.options.length);
      // print(result.canOpen);
      // print(result.didOpen);
      // for (var ii in result.options) {
      //   print(ii.name);
      // }
    }
  }

  void nextView() {
    if (currentIndex.value == 0 && usernameController.value.text == "123") {
      userNameValedation.value = "That username already exists";
    }
    currentIndex.value++;
  }

  void previuosView() {
    print("object");
    if (currentIndex.value != 0) {
      currentIndex.value--;
    } else {
      Get.back();
    }
  }

  void changeGanderToFemale() {
    gander.value = "female";
    isMale.value = false;
  }

  void changeGanderToMale() {
    gander.value = "male";
    isMale.value = true;
  }

  void handelAddInterstes(int index) {
    if (addedInterestes.contains(index)) {
      addedInterestes.remove(index);
    } else {
      addedInterestes.add(index);
    }
  }

  void _preloadImages() {
    precacheImage(const AssetImage(AppImagesPath.activeMale), Get.context!);
    precacheImage(const AssetImage(AppImagesPath.anActiveMale), Get.context!);
    precacheImage(const AssetImage(AppImagesPath.activeFemale), Get.context!);
    precacheImage(const AssetImage(AppImagesPath.anActiveFemale), Get.context!);
    precacheImage(const AssetImage(AppImagesPath.maleIcon), Get.context!);
    precacheImage(const AssetImage(AppImagesPath.femaleIcon), Get.context!);
  }

  void nextCompleteView() {
    if (completeCurrentIndex.value < 2) {
      completeCurrentIndex.value++;
    }
  }

  void previuosCompleteView() {
    print("object");
    if (completeCurrentIndex.value != 0) {
      completeCurrentIndex.value--;
    } else {
      Get.back();
    }
  }

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

  @override
  void onInit() {
    _preloadImages();
    // TODO: implement onInit
    super.onInit();
  }
}
