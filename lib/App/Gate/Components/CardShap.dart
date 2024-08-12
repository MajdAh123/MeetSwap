import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:get/get.dart';
import 'package:meetswap/App/Gate/Controller/GateController.dart';
import 'package:meetswap/Constant/Colors.dart';
import 'package:meetswap/Constant/ImagesPath.dart';
import 'package:meetswap/Constant/Size.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
// import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class CustomShapeCard extends StatelessWidget {
  final String username;
  final int age;
  final String country;
  final String description;
  final List<String> interests;

  CustomShapeCard({
    required this.username,
    required this.age,
    required this.country,
    required this.description,
    required this.interests,
  });
  final gateController = Get.find<GateController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(AppSize.paddingElements12 * 2),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: AppColor.seconderyColor,
              ),
              child: Stack(
                children: [
                  ClipPath(
                    clipper: CustomShapeClipper(),
                    child: Container(
                      width: AppSize.width,
                      height: AppSize.height - 270,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                            image: AssetImage(AppImagesPath.backgroundGateCard),
                            fit: BoxFit.fill),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10,
                            offset: Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          Positioned.fill(
                              child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: AppSize.paddingElements12 * 2,
                                    vertical: AppSize.paddingElements12 * 2),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "My Interests",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: AppColor.white,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      width: 120,
                                      height: 40,
                                      child: Stack(
                                        children: [
                                          for (int i = 0;
                                              i < interests.length;
                                              i++)
                                            Positioned(
                                              right: i * 35,
                                              child: CircleAvatar(
                                                radius: 20,
                                                backgroundColor: AppColor.white
                                                    .withOpacity(0.5),
                                                child: Center(
                                                  child: Image.asset(
                                                    interests[i],
                                                    width: 20,
                                                    height: 20,
                                                  ),
                                                ),
                                              ),
                                            )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(child: AppSize.sizedBoxEmpty),
                              Expanded(
                                  child: Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.3)),
                                  ),
                                  ClipRRect(
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 8.0, sigmaY: 8.0),
                                      child: Container(
                                        padding: EdgeInsets.all(
                                            AppSize.paddingElements12 * 2),
                                        alignment: Alignment.center,
                                        color: Colors.black.withOpacity(0.2),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text.rich(TextSpan(
                                                    text: "$username,",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: AppColor.white,
                                                        fontSize: 20),
                                                    children: [
                                                      TextSpan(
                                                          text: " $age",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400))
                                                    ])),
                                                Row(
                                                  children: [
                                                    Image.asset(AppImagesPath
                                                        .flagGateCard),
                                                    AppSize.sizedBox5,
                                                    Text(
                                                      country,
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color:
                                                              AppColor.white),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                            AppSize.sizedBox20,
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Image.asset(AppImagesPath
                                                    .cutaionOneGateCard),
                                                AppSize.sizedBox5,
                                                Expanded(
                                                  child: RichText(
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: description,
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                        WidgetSpan(
                                                          child: Image.asset(
                                                            AppImagesPath
                                                                .cutaionTwoGateCard,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            Expanded(
                                                child: AppSize.sizedBoxEmpty),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    gateController
                                                        .countDownController
                                                        .value
                                                        .restart();
                                                    gateController
                                                        .cardSwiperController
                                                        .value
                                                        .swipe(
                                                            CardSwiperDirection
                                                                .left);
                                                  },
                                                  child: CircleAvatar(
                                                    radius: 30,
                                                    backgroundColor:
                                                        AppColor.white,
                                                    child: Image.asset(
                                                        AppImagesPath
                                                            .skipIconGateCard),
                                                  ),
                                                ),
                                                CircleAvatar(
                                                  radius: 30,
                                                  backgroundColor:
                                                      AppColor.white,
                                                  child: Image.asset(
                                                      AppImagesPath.sayHey),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ))
                            ],
                          ))
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Stack(
                          children: [
                            Obx(
                              () => CircularCountDownTimer(
                                width: 80,
                                height: 80,
                                duration: gateController.durationSwaping.value,
                                strokeWidth: 3,
                                fillColor: AppColor.teal,
                                ringColor: AppColor.white.withOpacity(0.2),
                                onComplete: () => gateController.changeCard(),
                                controller:
                                    gateController.countDownController.value,
                              ),
                            ),
                            Positioned.fill(
                              child: SizedBox(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      if (gateController
                                          .countDownController.value.isPaused) {
                                        gateController.countDownController.value
                                            .resume();
                                      } else {
                                        gateController.countDownController.value
                                            .pause();
                                      }
                                      gateController.update();
                                    },
                                    child: Container(
                                      width: 65,
                                      height: 65,
                                      decoration: BoxDecoration(
                                        color: AppColor.yallow,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        child: GetBuilder<GateController>(
                                          builder: (controller) => controller
                                                  .countDownController
                                                  .value
                                                  .isPaused
                                              ? Icon(
                                                  Icons.play_arrow_rounded,
                                                  size: 35,
                                                )
                                              : Image.asset(AppImagesPath
                                                  .puaseIconGateCard),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double radius = 50.0;
    double buttonRadius = 55.0;

    Path path = Path()
      ..moveTo(0, radius)
      ..quadraticBezierTo(0, 0, radius, 0)
      ..lineTo(size.width - radius, 0)
      ..quadraticBezierTo(size.width, 0, size.width, radius)
      ..lineTo(size.width, size.height - radius)
      ..quadraticBezierTo(
          size.width, size.height, size.width - radius, size.height)
      ..lineTo(size.width / 2 + buttonRadius, size.height)
      ..arcToPoint(
        Offset(size.width / 2 - buttonRadius, size.height),
        radius: Radius.circular(buttonRadius),
        clockwise: false,
      )
      ..lineTo(radius, size.height)
      ..quadraticBezierTo(0, size.height, 0, size.height - radius)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
