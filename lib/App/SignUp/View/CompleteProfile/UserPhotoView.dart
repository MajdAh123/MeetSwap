import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetswap/App/SignUp/Controller/SignUpController.dart';
import 'package:meetswap/App/Widgets/YallowBtn.dart';
import 'package:meetswap/Constant/Colors.dart';
import 'package:meetswap/Constant/ImagesPath.dart';

import '../../../../Constant/Size.dart';
import '../../Components/RingingWidget.dart';

class UserPhotoView extends GetView<SignUpController> {
  const UserPhotoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppSize.sizedBox20,
          Center(
            child: Text(
              'Add your photo',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          Expanded(flex: 2, child: SizedBox()),
          RingingAnimationWidget(
              widget_: controller.userPhoto.value.path == ""
                  ? Image.asset(AppImagesPath.userPhoto)
                  : Container(
                      width: 170,
                      height: 170,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(200),
                          image: DecorationImage(
                              image: FileImage(controller.userPhoto.value),
                              fit: BoxFit.cover)),
                    )),
          Expanded(flex: 4, child: SizedBox()),
          Padding(
            padding: const EdgeInsets.all(AppSize.paddingElements12),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => controller.capturePhoto(),
                    child: Container(
                      // width: ,
                      padding: EdgeInsets.all(AppSize.paddingElements12),
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColor.white, width: 2),
                          borderRadius: BorderRadius.circular(20),
                          color: AppColor.white.withOpacity(0.6)),
                      child: Column(
                        children: [
                          Image.asset(AppImagesPath.cameraIcon),
                          Text("Take a Photo")
                        ],
                      ),
                    ),
                  ),
                ),
                AppSize.sizedBox10,
                Expanded(
                  child: GestureDetector(
                    onTap: () => controller.selectImage(),
                    child: Container(
                      // width: ,
                      padding: EdgeInsets.all(AppSize.paddingElements12),
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColor.white, width: 2),
                          borderRadius: BorderRadius.circular(20),
                          color: AppColor.white.withOpacity(0.6)),
                      child: Column(
                        children: [
                          Image.asset(AppImagesPath.galleryIcon),
                          Text("Choose from Gallery")
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          CustomeBtn(
            onTap: () => controller.nextCompleteView(),
            title: "Continue",
            padding: EdgeInsets.symmetric(
                horizontal: AppSize.paddingElements12, vertical: 0),
            defultPaddeing: false,
          ),
          AppSize.sizedBox10,
          // YallowBtn(
          //     onTap: () => controller.selectImage(),
          //     title: "Choose from Gallery"),
          RichText(
            text: TextSpan(
              text: 'Can\'t decide? ',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500), // Regular text style
              children: <TextSpan>[
                TextSpan(
                    text: 'Skip for now',
                    style: TextStyle(
                        color: AppColor.blue,
                        fontWeight: FontWeight.w500), // Blue text for "log in"
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => controller.changeToLogin()),
              ],
            ),
          ),
          AppSize.sizedBox10
        ],
      ),
    );
  }
}
