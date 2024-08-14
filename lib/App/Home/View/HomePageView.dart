import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetswap/App/Chat/View/HomeChatView.dart';
import 'package:meetswap/App/Home/Controller/homePageController.dart';
import 'package:meetswap/App/Profile/View/ProfileView.dart';
import 'package:meetswap/App/SignUp/Controller/BlurController.dart';
import 'package:meetswap/App/Widgets/BottomBarWidget.dart';
import 'package:meetswap/App/Widgets/FireAnimationEffect.dart';
import 'package:meetswap/App/Widgets/backgroundWidget.dart';
import 'package:meetswap/Constant/Colors.dart';
import 'package:meetswap/Constant/Size.dart';
import 'package:animations/animations.dart';
import '../../Gate/View/GatePage.dart';
import '../../Lobby/View/LobbyViewSccreen.dart';

class HomePageView extends GetView<HomePageController> {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: BlurController(),
        builder: (controller_) {
          return ImageFiltered(
            imageFilter: ImageFilter.blur(
                sigmaX: controller_.blurAnimation.value,
                sigmaY: controller_.blurAnimation.value),
            child: Obx(
              () => BackgroundWidget(
                child: Scaffold(
                  body: SafeArea(
                    child: Stack(
                      children: [
                        SizedBox(
                          width: AppSize.width,
                          height: AppSize.height,
                          child: PageTransitionSwitcher(
                            duration: const Duration(milliseconds: 500),
                            reverse: controller.currentPageIndex.value <
                                controller.previousPageIndex.value,
                            transitionBuilder: (Widget child,
                                Animation<double> animation,
                                Animation<double> secondaryAnimation) {
                              return SharedAxisTransition(
                                fillColor: Colors.transparent,
                                animation: animation,
                                secondaryAnimation: secondaryAnimation,
                                transitionType:
                                    SharedAxisTransitionType.horizontal,
                                child: child,
                              );
                            },
                            child: IndexedStack(
                              key: ValueKey<int>(
                                  controller.currentPageIndex.value),
                              index: controller.currentPageIndex.value,
                              children: [
                                HomeChatViewPage(),
                                LobbyViewScreen(),
                                GatePageScreen(),
                                ProfileView(),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                            bottom: 0,
                            right: 0,
                            left: 0,
                            child: BottomBarWidget())
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
