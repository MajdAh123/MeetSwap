import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetswap/App/Home/Components/UserImageTopBar.dart';
import 'package:meetswap/App/Lobby/Controller/LobbyController.dart';
import 'package:meetswap/App/Lobby/View/LobbyFilterView/FilterViewPage.dart';
import 'package:meetswap/App/Lobby/View/LobbyViews/LobbyCardsView.dart';
import 'package:meetswap/App/Notifcation/View/NotificationView.dart';
import 'package:meetswap/Constant/Colors.dart';
import 'package:meetswap/Constant/ImagesPath.dart';
import 'package:meetswap/Constant/Size.dart';

import 'LobbyViews/LobbyEmptyView.dart';

class LobbyViewScreen extends GetView<LobbyController> {
  const LobbyViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          if (controller.isLobbyEmpty.value)
            Image.asset(
              AppImagesPath.backgroundLobbyView,
              fit: BoxFit.fill,
              width: AppSize.width,
            ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () {
                        controller.isLobbyEmpty.value =
                            !controller.isLobbyEmpty.value;
                      },
                      child: UserImageTopBar()),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            right: AppSize.paddingElements12),
                        child: GestureDetector(
                          onTap: () => Get.to(() => const NotificationView(),
                              transition: Transition
                                  .rightToLeftWithFade, // Specify the transition here
                              duration: const Duration(milliseconds: 500)),
                          child: CircleAvatar(
                            radius: 22,
                            backgroundColor: AppColor.white.withOpacity(0.6),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child:
                                  Image.asset(AppImagesPath.notificationIcons),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: AppSize.paddingElements12),
                        child: GestureDetector(
                          onTap: () => Get.bottomSheet(LobbyFilterPage(),
                              isScrollControlled: true),
                          child: CircleAvatar(
                            radius: 22,
                            backgroundColor: AppColor.white.withOpacity(0.6),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Image.asset(AppImagesPath.filterIconLobby),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              controller.isLobbyEmpty.value
                  ? LobbyEmptyView()
                  : LobbyCardsView()
            ],
          ),
        ],
      ),
    );
  }
}
