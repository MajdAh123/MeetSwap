import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetswap/App/Widgets/SearchContainer.dart';
import 'package:meetswap/Constant/Colors.dart';
import 'package:meetswap/Constant/ImagesPath.dart';
import 'package:meetswap/Constant/Size.dart';
import '../../Widgets/SeeAllButton.dart';
import '../Components/ChatPersoneCard.dart';
import '../Components/PageViewSlidergroup.dart';
import 'PersoneChatViewPage.dart';

class HomeChatViewPage extends StatelessWidget {
  const HomeChatViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: AppSize.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                AppSize.sizedBox20,
                AppSize.sizedBox20,
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
                                Get.to(() => PersoneChatViewPage(),
                                    duration: Duration(milliseconds: 500),
                                    transition: Transition.rightToLeftWithFade);
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
                              onTap: () {},
                            )
                          ],
                        ),
                      ),
                      AppSize.sizedBox10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(AppImagesPath.continueWithleft),
                          const Text(
                            "Trending 🔥",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          Image.asset(AppImagesPath.continueWithright),
                        ],
                      ),
                    ],
                  ),
                ),
                const SliderGroupChatView(),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: () {
                print("qwqwqw");
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
    );
  }
}
