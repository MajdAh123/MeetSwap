import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetswap/App/Notifcation/View/NotificationViews/NotifcationCardView.dart';
import 'package:meetswap/App/Widgets/backgroundWidget.dart';
import 'package:meetswap/Constant/Colors.dart';
import 'package:meetswap/Constant/ImagesPath.dart';
import 'package:meetswap/Constant/Size.dart';

import 'NotificationViews/EmptyNotificationView.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Scaffold(
        body: Column(
          children: [
            AppSize.sizedBox20,
            AppSize.sizedBox10,
            Padding(
              padding: const EdgeInsets.all(AppSize.paddingElements12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: CircleAvatar(
                      radius: 22,
                      backgroundColor: AppColor.white.withOpacity(0.6),
                      child: Center(
                        child: Icon(
                          Icons.arrow_back_ios_new_outlined,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "Notifications",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    width: 50,
                  )
                ],
              ),
            ),
            // EmptyNotificationView(),
            NotifcationCardView()
          ],
        ),
      ),
    );
  }
}
