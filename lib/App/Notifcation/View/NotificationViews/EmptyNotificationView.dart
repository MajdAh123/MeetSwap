import 'package:flutter/material.dart';
import 'package:meetswap/Constant/ImagesPath.dart';

import '../../../../Constant/Size.dart';

class EmptyNotificationView extends StatelessWidget {
  const EmptyNotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: AppSize.sizedBoxEmpty,
            flex: 1,
          ),
          Stack(
            children: [
              Image.asset(AppImagesPath.notificationImage),
              Positioned.fill(
                  child: Column(
                children: [
                  Expanded(child: AppSize.sizedBoxEmpty),
                  Text(
                    "No notifications yet",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  AppSize.sizedBox10,
                  SizedBox(
                    width: AppSize.width * .8,
                    child: Text(
                      "Your notifications will appear here once you’ve received them",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ))
            ],
          ),
          Expanded(flex: 2, child: AppSize.sizedBoxEmpty)
          // SizedBox(
          //   height: 50,
          // )
        ],
      ),
    );
  }
}
