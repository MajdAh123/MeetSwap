import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetswap/App/Chat/View/PersoneChatViewPage.dart';

import '../../../Constant/Colors.dart';
import '../../../Constant/ImagesPath.dart';
import '../../../Constant/Size.dart';

class ChatPersoneCard extends StatelessWidget {
  const ChatPersoneCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(bottom: 8),
        padding: EdgeInsets.all(AppSize.paddingElements12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white54,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Stack(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(AppImagesPath.userBotBarIcon),
                  // child: Image.asset(
                  //   AppImagesPath.userBotBarIcon,
                  //   fit: BoxFit.cover,
                  // ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 8,
                    backgroundColor: AppColor.white,
                    child: Padding(
                      padding: EdgeInsets.all(2),
                      child: CircleAvatar(
                        backgroundColor: AppColor.green,
                      ),
                    ),
                  ),
                )
              ],
            ),
            AppSize.sizedBox20,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Annie",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  Text(
                    "Hello! how are you",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.black.withOpacity(.5)),
                  )
                ],
              ),
            ),
            AppSize.sizedBox20,
            Column(
              // mainAxisAlignment: MainAxisAlignment.start,

              children: [
                Text(
                  "12:33",
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.4), fontSize: 11),
                ),
                AppSize.sizedBox10,
                AppSize.sizedBox5,
                Material(
                  borderRadius: BorderRadius.circular(100),
                  color: AppColor.red,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                    child: Text(
                      "3",
                      style: TextStyle(fontSize: 11, color: AppColor.white),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
