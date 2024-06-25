import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetswap/Constant/ImagesPath.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({super.key, this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // print("123");
        if (onTap == null) {
          Get.back();
        } else {
          onTap!();
        }
      },
      child: Container(
        height: 40,
        width: 60,
        // padding: const EdgeInsets.symmetric(
        //     horizontal: AppSize.paddingElements12 * 3,
        //     vertical: AppSize.paddingElements12),
        child: Image.asset(AppImagesPath.backIcon),
      ),
    );
  }
}
