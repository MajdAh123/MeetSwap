import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetswap/App/Chat/Controllers/ChatController.dart';
import 'package:meetswap/Constant/Colors.dart';
import 'package:meetswap/Constant/ImagesPath.dart';
import 'package:meetswap/Constant/Size.dart';
import 'package:swipe_to/swipe_to.dart';

import '../Controllers/BottomBarChatingController.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({super.key, required this.isMe, required this.uniqKey});
  final bool isMe;
  final Key uniqKey;
  @override
  Widget build(BuildContext context) {
    return SwipeTo(
      key: uniqKey,

      // iconOnLeftSwipe: Icons.arrow_forward,
      iconOnRightSwipe: Icons.reply,

      onRightSwipe: (details) {
        print("\n Left Swipe Data --> ");
        Get.find<BottomBarChatingController>().showReply.value = true;
        Get.find<BottomBarChatingController>().isMeReply.value = isMe;
        Get.find<BottomBarChatingController>().replyText.value =
            "Hello! how are re you? ";
      },
      swipeSensitivity: 20,
      child: Column(
        children: [
          Row(
            mainAxisAlignment:
                isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              if (!isMe)
                CircleAvatar(
                  radius: 15,
                  backgroundImage: AssetImage(AppImagesPath.userBotBarIcon),
                ),
              AppSize.sizedBox10,
              Container(
                constraints: BoxConstraints(maxWidth: AppSize.width * 0.7),
                child: Material(
                  color: isMe ? AppColor.yallow : AppColor.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                    bottomRight: Radius.circular(isMe ? 0 : 30),
                    bottomLeft: Radius.circular(isMe ? 30 : 0),
                  ),
                  child: Container(
                    constraints: BoxConstraints(maxWidth: AppSize.width * 0.7),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          constraints:
                              BoxConstraints(maxWidth: AppSize.width * 0.53),
                          child: Text(
                            "Hello! how are re you? ",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        AppSize.sizedBox10,
                        Text(
                          "5:05",
                          style: TextStyle(color: Colors.black38, fontSize: 11),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          AppSize.sizedBox10
        ],
      ),
    );
  }
}
