import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetswap/Constant/ImagesPath.dart';
import 'package:meetswap/Constant/Size.dart';

class UserChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  const UserChatAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(AppImagesPath.userBotBarIcon),
          ),
          AppSize.sizedBox10,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Annie",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal),
              ),
              Text(
                "Online 1h ago",
                style: TextStyle(fontSize: 13, color: Colors.black45),
              )
            ],
          )
        ],
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_horiz_outlined,
              size: 30,
            )),
        AppSize.sizedBox5,
      ],
      leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 20,
          )),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
