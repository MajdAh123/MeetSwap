import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetswap/App/Home/Controller/homePageController.dart';

import '../../Constant/Colors.dart';
import '../../Constant/ImagesPath.dart';
import '../../Constant/Size.dart';

class BottomBarWidget extends GetView<HomePageController> {
  const BottomBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        color: Colors.transparent,
        height: 85,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: Container(
                width: AppSize.width,
                padding: EdgeInsets.symmetric(
                    horizontal: AppSize.paddingElements12 * 1),
                color: AppColor.white.withOpacity(0.8),
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BottomBarItemWidget(
                        image: AppImagesPath.chatBotBarIcon,
                        title: "Chats",
                        index: 0),
                    BottomBarItemWidget(
                        image: AppImagesPath.lobbyBotBarIcon,
                        title: "Lobby",
                        index: 1),
                    BottomBarItemWidget(
                        image: AppImagesPath.gateBotBarIcon,
                        title: "Gate",
                        index: 2),
                    SizedBox(width: AppSize.width * 0.2)
                  ],
                ),
              ),
            ),
            Positioned(
                top: 0,
                right: AppSize.paddingElements12 * 3,
                child: GestureDetector(
                  onTap: () => controller.setPageIndex(3),
                  child: Column(
                    children: [
                      Image.asset(AppImagesPath.userBotBarIcon),
                      AppSize.sizedBox5,
                      Text(
                        "Profile",
                        style: TextStyle(
                            fontSize: 12,
                            color: controller.currentPageIndex.value == 3
                                ? AppColor.activeBotBarColor
                                : AppColor.inactiveBotBarColor,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class BottomBarItemWidget extends GetView<HomePageController> {
  const BottomBarItemWidget(
      {super.key,
      required this.index,
      required this.title,
      required this.image});
  final String title;
  final String image;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => InkWell(
        overlayColor:
            MaterialStateColor.resolveWith((states) => Colors.transparent),
        onTap: () => controller.setPageIndex(index),
        child: SizedBox(
          width: AppSize.width * 0.2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image,
                color: index == controller.currentPageIndex.value
                    ? AppColor.activeBotBarColor
                    : AppColor.inactiveBotBarColor,
              ),
              AppSize.sizedBox5,
              Text(
                title,
                style: TextStyle(
                    color: index == controller.currentPageIndex.value
                        ? AppColor.activeBotBarColor
                        : AppColor.inactiveBotBarColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w700),
              )
            ],
          ),
        ),
      ),
    );
  }
}
