import 'dart:ui';

import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetswap/App/Chat/Controllers/CreateChatController.dart';
import 'package:meetswap/App/Chat/View/CreateGroupChat/BlurCompleteGroupInfoView.dart';
import 'package:meetswap/App/SignUp/Controller/BlurController.dart';
import 'package:meetswap/App/Widgets/AnimateBorderWidget.dart';
import 'package:meetswap/App/Widgets/TextFieldCustome.dart';
import 'package:meetswap/App/Widgets/YallowBtn.dart';
import 'package:meetswap/App/Widgets/backgroundWidget.dart';
import 'package:meetswap/Constant/Colors.dart';
import 'package:meetswap/Constant/ImagesPath.dart';
import 'package:meetswap/Constant/Size.dart';

class AddGroupNameView extends GetView<CreateChatController> {
  const AddGroupNameView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BlurController>(builder: (controller_) {
      return ImageFiltered(
        imageFilter: ImageFilter.blur(
            sigmaX: controller_.blurAnimation.value,
            sigmaY: controller_.blurAnimation.value),
        child: BackgroundWidget(
          child: Scaffold(
            body: Column(
              children: [
                AppSize.sizedBox20,
                AppSize.sizedBox20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_new_outlined,
                          size: 20,
                        )),
                    Text(
                      "Create group name",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      width: 50,
                    )
                  ],
                ),
                AppSize.sizedBox20,
                TextFieldCustomeWidget(
                    controller: controller.groupName.value,
                    title: "Group Name",
                    hint: "Add group name"),
                AppSize.sizedBox20,
                Padding(
                  padding: const EdgeInsets.all(AppSize.paddingElements12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Choose group type",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      AppSize.sizedBox5,
                      Obx(
                        () => AnimatedBorderWidget(
                          child: AnimatedToggleSwitch<int>.size(
                            // textDirection: TextDirection.rtl,
                            current: controller.groupType.value,
                            height: 50,
                            values: const [
                              0,
                              1,
                            ],
                            iconOpacity: 0.9,
                            indicatorSize: Size.fromWidth(AppSize.width * 0.45),
                            iconBuilder: (value) => [
                              SizedBox(
                                width: AppSize.width * 0.22,
                                child: Row(
                                  // mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset(
                                      AppImagesPath.privateIcon,
                                      width: 12,
                                    ),
                                    Text(
                                      "Private group",
                                      style: TextStyle(fontSize: 11),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: AppSize.width * 0.22,
                                child: Row(
                                  // mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset(
                                      AppImagesPath.freegroup,
                                      width: 12,
                                    ),
                                    Text(
                                      "Public group",
                                      style: TextStyle(fontSize: 11),
                                    ),
                                  ],
                                ),
                              ),
                            ][value],
                            borderWidth: 0.0,
                            iconAnimationType: AnimationType.onHover,
                            style: ToggleStyle(
                              indicatorColor: AppColor.white,
                              backgroundColor: AppColor.white.withOpacity(0.5),
                              borderColor: Colors.transparent,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            onChanged: (i) => controller.groupType.value = i,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(child: AppSize.sizedBoxEmpty),
                Padding(
                  padding: const EdgeInsets.all(AppSize.paddingElements12),
                  child: CustomeBtn(
                      onTap: () {
                        Get.put<BlurController>(BlurController())
                            .startBlurAnimation();
                        Get.dialog(
                          DialogBlurCompleteGroupInfo(),
                          barrierDismissible: true,
                        );
                      },
                      title: "Continue"),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
