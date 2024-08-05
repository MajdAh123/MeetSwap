import 'dart:io';
import 'dart:ui';
import 'package:meetswap/App/SignUp/Controller/BlurController.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:meetswap/App/SignUp/View/SignUpDetailsViewPage.dart';
import 'package:meetswap/Constant/ImagesPath.dart';
import 'package:meetswap/Constant/policy.dart';
import 'package:image_picker/image_picker.dart';
import '../Components/SelectImage.dart';
import '../View/DetailsView/SimiCompleted.dart';

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
  var showBlur = false.obs;
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
    FocusManager.instance.primaryFocus?.unfocus();
    if (currentIndex.value == 0 && usernameController.value.text == "123") {
      userNameValedation.value = "That username already exists";
    }

    if (currentIndex.value == 2) {
      showBlur.value = true;
      Get.find<BlurController>().startBlurAnimation();
      Get.dialog(
        DialogWithAnimation(),
        barrierDismissible: true,
      );
    } else {
      currentIndex.value++;
    }
  }

  void previuosView() {
    FocusManager.instance.primaryFocus?.unfocus();
    print("object");
    if (currentIndex.value != 0) {
      currentIndex.value--;
    } else {
      Get.back();
    }
  }

  void hideBlur() {
    showBlur.value = false;
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
    FocusManager.instance.primaryFocus?.unfocus();
    if (completeCurrentIndex.value < 2) {
      completeCurrentIndex.value++;
    }
  }

  void previuosCompleteView() {
    FocusManager.instance.primaryFocus?.unfocus();
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
  void onReady() {
    _preloadImages();
    // TODO: implement onReady
    super.onReady();
  }
  // @override
  // void onreaddy() {

  //   // TODO: implement onInit
  //   super.onInit();
  // }
}

class BlurPainter extends CustomPainter {
  final double blurValue;
  final double radiusValue;

  BlurPainter({required this.blurValue, required this.radiusValue});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..imageFilter = ImageFilter.blur(
          sigmaX: blurValue, sigmaY: blurValue, tileMode: TileMode.mirror);
    // ..shader = RadialGradient(
    //   // center: Alignment.center,
    //   // radius: radiusValue,
    //   colors: [
    //     Colors.black.withOpacity(0.2),
    //     Colors.black.withOpacity(0.5),
    //   ],
    //   stops: [0.5, 1.0],
    // ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)
    // );

    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:meetswap/App/SignUp/Controller/BlurController.dart';

class DialogWithAnimation extends StatefulWidget {
  @override
  _DialogWithAnimationState createState() => _DialogWithAnimationState();
}

class _DialogWithAnimationState extends State<DialogWithAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..forward();
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final blurController = Get.find<BlurController>();
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: GetBuilder<BlurController>(
          init: blurController,
          builder: (controller) {
            return Opacity(
              opacity: _animationController.value,
              child: Stack(
                children: [
                  // Positioned.fill(
                  //   child: CustomPaint(
                  //     painter: BlurPainter(
                  //       blurValue: controller.blurAnimation.value,
                  //       radiusValue: controller.radiusAnimation.value,
                  //     ),
                  //     child: Container(),
                  //   ),
                  // ),
                  Center(
                    child: ScaleTransition(
                      scale: CurvedAnimation(
                        parent: _animationController,
                        curve: Curves.easeOut,
                      ),
                      child: SimiCompletedView(),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
