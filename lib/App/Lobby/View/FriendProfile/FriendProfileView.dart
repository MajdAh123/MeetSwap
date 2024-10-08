import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetswap/App/Lobby/Controller/LobbyController.dart';
import 'package:meetswap/App/Lobby/View/FriendProfile/ReportFreindView.dart';
import 'package:meetswap/App/SignUp/Controller/BlurController.dart';
import 'package:meetswap/App/Widgets/YallowBtn.dart';
import 'package:meetswap/App/Widgets/backgroundWidget.dart';
import 'package:meetswap/Constant/Colors.dart';
import 'package:meetswap/Constant/ImagesPath.dart';
import 'package:meetswap/Constant/Size.dart';

import '../../../Widgets/InterestesSmallCard.dart';

class FreindProfileView extends GetView<LobbyController> {
  const FreindProfileView({super.key, this.isrequest = false});
  final bool isrequest;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BlurController>(builder: (controller_) {
      return ImageFiltered(
        imageFilter: ImageFilter.blur(
            sigmaX: controller_.blurAnimation.value,
            sigmaY: controller_.blurAnimation.value),
        child: BackgroundWidget(
          child: SingleChildScrollView(
            child: Obx(
              () => Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(AppSize.paddingElements12),
                    width: AppSize.width,
                    height: AppSize.height * 0.45,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(AppImagesPath.backgroundGateCard),
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter)),
                    child: Column(
                      children: [
                        AppSize.sizedBox20,
                        AppSize.sizedBox10,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.back();
                              },
                              hoverColor: Colors.transparent,
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor:
                                    AppColor.white.withOpacity(0.4),
                                child: Icon(Icons.keyboard_arrow_down_outlined),
                              ),
                            ),
                            InkWell(
                              hoverColor: Colors.transparent,
                              onTap: () {
                                showCustomDialog(context);
                                controller.openDialog();
                              },
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor: AppColor.white.withOpacity(
                                    controller.isDialogOpen.isTrue ? 1 : 0.4),
                                child: Icon(Icons.more_horiz),
                              ),
                            ),
                          ],
                        ),
                        Expanded(child: AppSize.sizedBoxEmpty),
                        Row(
                          children: [
                            Text(
                              "Annie Calzoni",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: AppColor.white),
                            ),
                            Text(
                              ", 25",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.white),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(AppImagesPath.flagGateCard),
                            AppSize.sizedBox5,
                            Text(
                              "Spain",
                              style: TextStyle(
                                  inherit: false,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w300,
                                  color: AppColor.white),
                            ),
                          ],
                        ),
                        AppSize.sizedBox20
                      ],
                    ),
                  ),
                  SizedBox(
                    width: AppSize.width,
                    child: Padding(
                      padding: const EdgeInsets.all(AppSize.paddingElements12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppSize.sizedBox20,
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppSize.paddingElements12),
                            child: Text(
                              "About Me",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 17),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.all(AppSize.paddingElements12),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(AppImagesPath.cutaionOneGateCard),
                                AppSize.sizedBox5,
                                Expanded(
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text:
                                              "  Heyyy I’m a foodie on a mission to find the best local eats!  ",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color:
                                                  Colors.black.withOpacity(0.8),
                                              fontWeight: FontWeight.w300),
                                        ),
                                        WidgetSpan(
                                          child: Image.asset(
                                            AppImagesPath.cutaionTwoGateCard,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          AppSize.sizedBox20,
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppSize.paddingElements12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "My Interests",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 17),
                                ),
                                Text(
                                  "3+ same interests",
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.7),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                          ),
                          AppSize.sizedBox10,
                          Wrap(
                            spacing: 5,
                            runSpacing: 5,
                            children: [
                              "Photography",
                              "Sports",
                              "Music",
                              "Food",
                              "Sports",
                              "Food",
                              "Sports",
                              "Music",
                              "Food",
                              "Sports",
                              "Food",
                              "Sports"
                            ]
                                .map((e) => InterestsSmallCard(
                                      title: e,
                                    ))
                                .toList(),
                          ),
                          AppSize.sizedBox20,
                          Row(
                            children: [
                              Image.asset(AppImagesPath.dateIcon),
                              AppSize.sizedBox10,
                              Text(
                                "Date of encounter: 7/11/2023",
                                style: TextStyle(
                                  color: AppColor.white,
                                ),
                              )
                            ],
                          ),
                          AppSize.sizedBox5,
                          Row(
                            children: [
                              Image.asset(AppImagesPath.locationIcon),
                              AppSize.sizedBox10,
                              Text(
                                "Location of encounter: Abu Dhabi, UAE",
                                style: TextStyle(
                                  color: AppColor.white,
                                ),
                              )
                            ],
                          ),
                          AppSize.sizedBox20,
                          isrequest
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius: 28,
                                      backgroundColor: AppColor.red,
                                      child: Icon(
                                        Icons.close,
                                        color: AppColor.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    CircleAvatar(
                                        radius: 28,
                                        backgroundColor: AppColor.green,
                                        child: Icon(
                                          Icons.check,
                                          color: AppColor.white,
                                        ))
                                  ],
                                )
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                        radius: 28,
                                        backgroundColor: AppColor.white,
                                        child: Center(
                                            child: Image.asset(AppImagesPath
                                                .optionsIconFreindProfile))),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    CircleAvatar(
                                      radius: 28,
                                      backgroundColor: AppColor.yallow,
                                      child: Center(
                                          child: Image.asset(AppImagesPath
                                              .chatIconFreindProfile)),
                                    ),
                                  ],
                                ),
                          AppSize.sizedBox20
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  void showCustomDialog(BuildContext context) {
    Get.dialog(
      Stack(
        children: [
          Positioned(
            top: 70, // Adjust top position as needed
            right: 10, // Adjust right position as needed
            child: Material(
              color: Colors.transparent,
              child: Container(
                width: AppSize.width * 0.5,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: () {
                        controller.closeDialog();
                        Get.back();
                        Get.to(() => ReportFriendView(),
                            duration: Duration(milliseconds: 500),
                            transition: Transition.rightToLeftWithFade);
                      },
                      child: Padding(
                        padding:
                            const EdgeInsets.all(AppSize.paddingElements12),
                        child: Row(
                          children: [
                            AppSize.sizedBox20,
                            Image.asset(AppImagesPath.dangerIcon),
                            AppSize.sizedBox10,
                            Text('Report'),
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      height: 0.5,
                      thickness: 0.5,
                    ),
                    InkWell(
                      onTap: () {
                        controller.closeDialog();
                        Get.back();
                        // showBlockDialog();
                        Get.find<BlurController>().startBlurAnimation();
                        Get.dialog(
                          DialogWithAnimationBlock(),
                          barrierDismissible: true,
                        );
                      },
                      child: Padding(
                        padding:
                            const EdgeInsets.all(AppSize.paddingElements12),
                        child: Row(
                          children: [
                            AppSize.sizedBox20,
                            Image.asset(AppImagesPath.closeIcon),
                            AppSize.sizedBox10,
                            Text('Block'),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ).then((value) => controller.closeDialog());
  }
}

class DialogWithAnimationBlock extends StatefulWidget {
  @override
  _DialogWithAnimationBlockState createState() =>
      _DialogWithAnimationBlockState();
}

class _DialogWithAnimationBlockState extends State<DialogWithAnimationBlock>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final blurController = Get.find<BlurController>();
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: GetBuilder<BlurController>(
          init: blurController,
          builder: (controller) {
            return Opacity(
              opacity: _animationController.value,
              child: Stack(
                children: [
                  Center(
                    child: ScaleTransition(
                      scale: CurvedAnimation(
                        parent: _animationController,
                        curve: Curves.easeOut,
                      ),
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(child: AppSize.sizedBoxEmpty),
                          Image.asset(AppImagesPath.blockWarning),
                          SizedBox(
                            width: AppSize.width * .8,
                            child: Text(
                              "Do you want to block them?",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: AppColor.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          AppSize.sizedBox20,
                          SizedBox(
                            width: AppSize.width * .8,
                            child: Text(
                              "We don't investigate this kind of problem, but we're sorry you had a bad experience. ",
                              style: TextStyle(color: AppColor.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(child: AppSize.sizedBoxEmpty),
                          CustomeBtn(
                            onTap: () {
                              Get.back();
                              Get.find<BlurController>().resetController();
                            },
                            title: "Cancel",
                            defultPaddeing: false,
                            padding: EdgeInsets.symmetric(
                                horizontal: AppSize.paddingElements12),
                            textColor: AppColor.blue,
                            btnColor: AppColor.white.withOpacity(0.9),
                          ),
                          CustomeBtn(
                            onTap: () {},
                            title: "Block",
                            textColor: Colors.white,
                            btnColor: AppColor.blue,
                          ),
                          AppSize.sizedBox20
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
