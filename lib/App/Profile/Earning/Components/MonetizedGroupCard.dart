import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetswap/App/Profile/Earning/Controller/EarningController.dart';
import 'package:meetswap/App/Profile/Earning/View/MonetizingEarningsView.dart';
import 'package:meetswap/Constant/Colors.dart';
import 'package:meetswap/Constant/ImagesPath.dart';
import 'package:meetswap/Constant/Size.dart';

class MonetizedGroupCard extends StatelessWidget {
  const MonetizedGroupCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.find<EarningsContoller>().startShowinText();
        Get.to(
          () => const MonetizingEarningsView(),
          transition:
              Transition.rightToLeftWithFade, // Specify the transition here
          duration: const Duration(milliseconds: 500),
        );
      },
      child: Container(
        width: AppSize.width * .47,
        height: AppSize.width * .35,
        margin: EdgeInsets.only(
            right: AppSize.width * .015,
            left: AppSize.width * .015,
            bottom: AppSize.width * .03),
        padding: const EdgeInsets.all(AppSize.paddingElements12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25), color: Colors.white54),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Football",
                          style: TextStyle(fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Expanded(
                          // flex: 4,
                          child: Stack(children: [
                            ...[1, 2, 3, 4]
                                .map((e) => Positioned(
                                      bottom: 0,
                                      left: [1, 2, 3, 4].indexOf(e).toDouble() *
                                          15,
                                      child: CircleAvatar(
                                        radius: 12,
                                        backgroundColor: Colors.white,
                                        child: Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: CircleAvatar(
                                            backgroundImage: AssetImage(
                                                AppImagesPath.userBotBarIcon),
                                          ),
                                        ),
                                      ),
                                    ))
                                .toList(),
                            Positioned(
                              bottom: 0,
                              left: 75,
                              child: Text(
                                "20+",
                                style: TextStyle(color: Colors.black38),
                              ),
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                  AppSize.sizedBox10,
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage(AppImagesPath.groupChatImage),
                  ),
                ],
              ),
            ),
            AppSize.sizedBox5,
            Expanded(child: AppSize.sizedBoxEmpty),
            Text(
              "AED 20/mo",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "Active",
              style:
                  TextStyle(color: AppColor.blue, fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
