import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetswap/Constant/Colors.dart';
import 'package:meetswap/Constant/ImagesPath.dart';
import 'package:meetswap/Constant/Size.dart';

class SelectImageBottomSheet extends StatelessWidget {
  const SelectImageBottomSheet({super.key, required this.controller});
  final controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
        color: AppColor.primaryColor,
      ),
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
