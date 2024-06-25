import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetswap/App/SignUp/Controller/SignUpController.dart';
import 'package:meetswap/App/SignUp/View/DetailsView/GanderAndDOBView.dart';
import 'package:meetswap/App/SignUp/View/DetailsView/InterstesView.dart';
import 'package:meetswap/App/SignUp/View/DetailsView/UserNameView.dart';
import 'package:meetswap/App/Widgets/YallowBtn.dart';
import 'package:meetswap/App/Widgets/backButtonWidget.dart';
import 'package:meetswap/App/Widgets/backgroundWidget.dart';
import 'package:meetswap/App/Widgets/statusBarWidget.dart';
import 'package:meetswap/Constant/Colors.dart';
import 'package:meetswap/Constant/Size.dart';

import 'DetailsView/SimiCompleted.dart';

class SignUpDetailsView extends GetView<SignUpController> {
  const SignUpDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
          child: Obx(
        () => Stack(
          children: [
            Column(
              children: [
                AppSize.sizedBox20,
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: StatusBarWidget(
                      totalSteps: 3,
                      currentStep: controller.currentIndex.value),
                ),
                Row(
                  children: [
                    BackButtonWidget(
                      onTap: () => controller.previuosView(),
                    ),
                  ],
                ),
                Expanded(
                    child: IndexedStack(
                  index: controller.currentIndex.value,
                  children: [
                    UserNameView(),
                    GanderAndDOBView(),
                    InterstesView(),
                    ImageFiltered(
                      imageFilter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                      child: InterstesView(),
                    ),

                    // SimiCompletedView()
                  ],
                )),
              ],
            ),
            Positioned(
                bottom: 0,
                left: AppSize.paddingElements12 / 2,
                right: AppSize.paddingElements12 / 2,
                child: Container(
                  decoration: controller.currentIndex.value != 2
                      ? BoxDecoration()
                      : BoxDecoration(boxShadow: [
                          BoxShadow(
                              color: AppColor.borderColor.withOpacity(0.5),
                              offset: Offset(40, 40),
                              blurRadius: 40,
                              spreadRadius: 100)
                        ]),
                  child: YallowBtn(
                      onTap: () => controller.nextView(), title: "Continue"),
                )),
            controller.currentIndex.value == 3
                ? Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: double.infinity,
                        color: Colors.black.withOpacity(0.7),
                      ),
                      SimiCompletedView(),
                    ],
                  )
                : SizedBox(),
          ],
        ),
      )),
    );
  }
}
