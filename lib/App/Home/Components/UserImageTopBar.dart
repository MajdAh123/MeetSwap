import 'package:flutter/material.dart';

import '../../../Constant/ImagesPath.dart';
import '../../../Constant/Size.dart';

class UserImageTopBar extends StatelessWidget {
  const UserImageTopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: const EdgeInsets.all(AppSize.paddingElements12),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage(AppImagesPath.userBotBarIcon),
          ),
          AppSize.sizedBox10,
          Text.rich(TextSpan(
              text: "Hey ",
              style: TextStyle(fontWeight: FontWeight.w500),
              children: [
                TextSpan(
                    text: "Annie!",
                    style: TextStyle(fontWeight: FontWeight.bold))
              ]))
        ],
      ),
    );
  }
}
