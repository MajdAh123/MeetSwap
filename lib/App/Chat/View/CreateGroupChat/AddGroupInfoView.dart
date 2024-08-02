import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetswap/App/Chat/Controllers/CreateChatController.dart';
import 'package:meetswap/App/Interestes/Controller/InterestsController.dart';
import 'package:meetswap/App/SignUp/Components/RingingWidget.dart';
import 'package:meetswap/App/SignUp/Controller/BlurController.dart';
import 'package:meetswap/App/Widgets/SearchContainer.dart';
import 'package:meetswap/App/Widgets/TextFieldCustome.dart';
import 'package:meetswap/App/Widgets/YallowBtn.dart';
import 'package:meetswap/App/Widgets/backgroundWidget.dart';
import 'package:meetswap/Constant/Colors.dart';
import 'package:meetswap/Constant/ImagesPath.dart';
import 'package:meetswap/Constant/Size.dart';

class AddGroupInfoView extends GetView<CreateChatController> {
  const AddGroupInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
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
                    "Group Information",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    width: 50,
                  )
                ],
              ),
              AppSize.sizedBox20,
              AppSize.sizedBox20,
              Obx(
                () => Stack(
                  children: [
                    RingingAnimationWidget(
                        size_: Size(170, 170),
                        widget_: controller.groupPhoto.value.path == ""
                            ? Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: SizedBox(
                                  child: Image.asset(
                                    AppImagesPath.userPhoto,
                                  ),
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(200),
                                      image: DecorationImage(
                                          image: FileImage(
                                              controller.groupPhoto.value),
                                          fit: BoxFit.cover)),
                                ),
                              )),
                    Positioned(
                      bottom: 30,
                      right: 150,
                      child: GestureDetector(
                        onTap: () {
                          // Get.put(BlurController()).startBlurAnimation();

                          Get.bottomSheet(const SelectImageBottomSheet());
                        },
                        child: CircleAvatar(
                          radius: 10,
                          backgroundColor: AppColor.yallow,
                          child: Icon(
                            Icons.add,
                            size: 15,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              AppSize.sizedBox20,
              AppSize.sizedBox20,
              TextFieldCustomeWidget(
                  controller: controller.groupName.value,
                  title: "Group Name",
                  hint: "Add group name"),
              // AppSize.sizedBox5,
              TextFieldCustomeWidget(
                  controller: controller.groupDescription.value,
                  title: "Group Description",
                  maxLines: 3,
                  hint: "Add group description"),
              AppSize.sizedBox20,
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSize.paddingElements12),
                child: Row(
                  children: [
                    Text(
                      "Add Interests",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
              SearchContainer(
                onchange: (value) {
                  Get.find<InterestController>().onWhileSearching(value);
                },
              ),
              SizedBox(
                width: AppSize.width,
                child: Padding(
                  padding: const EdgeInsets.all(AppSize.paddingElements12),
                  child: Obx(
                    () => Wrap(
                      spacing: 5,
                      runSpacing: 10,
                      children: Get.find<InterestController>()
                          .allInterests
                          .map((element) => GestureDetector(
                                onTap: () {
                                  if (controller.selectedInterests
                                      .contains(element)) {
                                    controller.selectedInterests
                                        .remove(element);
                                  } else {
                                    controller.selectedInterests.add(element);
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: controller.selectedInterests
                                              .contains(element)
                                          ? AppColor.white.withOpacity(0.8)
                                          : Colors.transparent,
                                      border:
                                          Border.all(color: AppColor.white)),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: AppSize.paddingElements12 * 0.5,
                                      horizontal: AppSize.paddingElements12),
                                  child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Image.asset(
                                          element.imagePath,
                                          width: 20,
                                        ),
                                        AppSize.sizedBox5,
                                        Text(element.name)
                                      ]),
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                ),
              ),
              CustomeBtn(onTap: () {}, title: "Save")
            ],
          ),
        ),
      ),
    );
  }
}

class SelectImageBottomSheet extends GetView<CreateChatController> {
  const SelectImageBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      child: Padding(
        padding: const EdgeInsets.all(AppSize.paddingElements12),
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  controller.capturePhoto();
                  Get.back();
                },
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
                onTap: () {
                  controller.selectImage();
                  Get.back();
                },
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
    );
  }
}
