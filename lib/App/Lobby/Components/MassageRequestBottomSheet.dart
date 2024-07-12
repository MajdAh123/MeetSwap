import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Constant/Colors.dart';
import '../../../Constant/ImagesPath.dart';
import '../../../Constant/Size.dart';

class MassageRequestBottomSheet extends StatelessWidget {
  const MassageRequestBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSize.paddingElements12 * 1.5),
      height: 100,
      width: AppSize.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          color: AppColor.white),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28,
            child: Image.asset(
              AppImagesPath.userBotBarIcon,
              width: 80,
              fit: BoxFit.fill,
            ),
          ),
          AppSize.sizedBox10,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Barry 24",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
              ),
              Text(
                "Chat request?",
                style: TextStyle(
                    color: Colors.black.withOpacity(0.6), fontSize: 12),
              )
            ],
          ),
          Expanded(child: AppSize.sizedBoxEmpty),
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: CircleAvatar(
              radius: 18,
              backgroundColor: AppColor.red,
              child: Icon(
                Icons.close,
                color: AppColor.white,
                size: 20,
              ),
            ),
          ),
          AppSize.sizedBox10,
          CircleAvatar(
            radius: 18,
            backgroundColor: AppColor.blue,
            child: Image.asset(
              AppImagesPath.sayHey,
              width: 15,
            ),
          )
        ],
      ),
    );
  }
}
