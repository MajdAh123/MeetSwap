import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetswap/App/Chat/Components/CreateChat/CreateChatBlurView.dart';
import 'package:meetswap/App/SignUp/Controller/BlurController.dart';
import 'package:meetswap/App/Widgets/SearchContainer.dart';
import 'package:meetswap/App/Widgets/TitleBetweenArrows.dart';
import 'package:meetswap/Constant/Colors.dart';
import 'package:meetswap/Constant/ImagesPath.dart';
import 'package:meetswap/Constant/Size.dart';
import '../../Widgets/SeeAllButton.dart';
import '../Components/ChatPersoneCard.dart';
import '../Components/PageViewSlidergroup.dart';
import 'MyFriendsChatViewPage.dart';
import 'MyGroupChatViewPage.dart';

class HomeChatViewPage extends StatelessWidget {
  const HomeChatViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BlurController>(
        // init: BlurController(),
        builder: (controller_) {
      return ImageFiltered(
        imageFilter: ImageFilter.blur(
            sigmaX: controller_.blurAnimation.value,
            sigmaY: controller_.blurAnimation.value),
        child: Stack(
          children: [
            Container(
              width: AppSize.width,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SearchContainer(onchange: (value) {}),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: AppSize.width * .03),
                      child: Column(
                        children: [
                          AppSize.sizedBox10,
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppSize.paddingElements12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Personal chats".toUpperCase(),
                                  style: TextStyle(
                                      color: AppColor.inactiveBotBarColor),
                                ),
                                SeeAllButton(
                                  onTap: () {
                                    Get.to(() => MyFriendsChatViewPage(),
                                        duration: Duration(milliseconds: 500),
                                        transition:
                                            Transition.rightToLeftWithFade);
                                  },
                                )
                              ],
                            ),
                          ),
                          AppSize.sizedBox10,
                          ...[1, 2].map((e) => ChatPersoneCard()).toList(),
                          AppSize.sizedBox10,
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppSize.paddingElements12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "group chats".toUpperCase(),
                                  style: TextStyle(
                                      color: AppColor.inactiveBotBarColor),
                                ),
                                SeeAllButton(
                                  onTap: () {
                                    Get.to(() => MyGroupChatViewPage(),
                                        duration: Duration(milliseconds: 500),
                                        transition:
                                            Transition.rightToLeftWithFade);
                                  },
                                )
                              ],
                            ),
                          ),
                          AppSize.sizedBox5,
                          TitleBetweenArrows(
                            title: "Trending",
                            child: Image.asset(AppImagesPath.fireIcon),
                          ),
                          AppSize.sizedBox5
                        ],
                      ),
                    ),
                    const SliderGroupChatView(),
                    SizedBox(
                      height: 100,
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 100,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(
                  onTap: () {
                    // print("qwqwqw")
                    Get.put<BlurController>(BlurController())
                        .startBlurAnimation();
                    Get.dialog(
                      DialogCreatChatWithAnimtaion(),
                      barrierDismissible: true,
                    );
                  },
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: AppColor.yallow,
                    child: Icon(Icons.add),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
