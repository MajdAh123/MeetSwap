import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetswap/App/SignUp/Controller/BlurController.dart';
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

class SignUpDetailsView extends StatelessWidget {
  SignUpDetailsView({super.key});
  final blurController = Get.put(BlurController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: Stack(
          children: [
            Obx(() {
              return Column(
                children: [
                  AppSize.sizedBox20,
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: StatusBarWidget(
                      totalSteps: 3,
                      currentStep:
                          Get.find<SignUpController>().currentIndex.value,
                    ),
                  ),
                  Row(
                    children: [
                      Opacity(
                        opacity: Get.find<SignUpController>().showBlur.isTrue
                            ? 0.4
                            : 1,
                        child: BackButtonWidget(
                          onTap: () =>
                              Get.find<SignUpController>().previuosView(),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: IndexedStack(
                      index: Get.find<SignUpController>().currentIndex.value,
                      children: [
                        UserNameView(),
                        GanderAndDOBView(),
                        GetBuilder<BlurController>(builder: (controller_) {
                          return ImageFiltered(
                              imageFilter: ImageFilter.blur(
                                  sigmaX: controller_.blurAnimation.value,
                                  sigmaY: controller_.blurAnimation.value),
                              child: InterstesViewSignUp());
                        }),
                      ],
                    ),
                  ),
                ],
              );
            }),
            Positioned(
              bottom: 0,
              left: AppSize.paddingElements12 / 2,
              right: AppSize.paddingElements12 / 2,
              child: Obx(() {
                return Container(
                  decoration:
                      Get.find<SignUpController>().currentIndex.value != 2
                          ? BoxDecoration()
                          : BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: AppColor.borderColor.withOpacity(0.5),
                                  offset: Offset(40, 40),
                                  blurRadius: 40,
                                  spreadRadius: 100,
                                ),
                              ],
                            ),
                  child: CustomeBtn(
                    onTap: () => Get.find<SignUpController>().nextView(),
                    title: "Continue",
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class BlurPainter extends CustomPainter {
  final double blurValue;
  final double radiusValue;

  BlurPainter({required this.blurValue, required this.radiusValue});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..imageFilter = ImageFilter.blur(sigmaX: blurValue, sigmaY: blurValue)
      ..shader = RadialGradient(
        center: Alignment.center,
        radius: radiusValue,
        colors: [
          Colors.transparent,
          Colors.black.withOpacity(0.7),
        ],
        stops: [0.5, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
