import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetswap/App/Chat/Controllers/CreateChatController.dart';
import 'package:meetswap/App/Chat/View/CreateGroupChat/AddGroupInfoView.dart';
import 'package:meetswap/App/Chat/View/CreateGroupChat/AddMembersView.dart';
import 'package:meetswap/App/SignUp/Controller/BlurController.dart';
import 'package:meetswap/App/Widgets/YallowBtn.dart';
import 'package:meetswap/Constant/Colors.dart';
import 'package:meetswap/Constant/ImagesPath.dart';
import 'package:meetswap/Constant/Size.dart';

class DialogBlurCompleteGroupInfo extends StatefulWidget {
  @override
  _DialogBlurCompleteGroupInfoState createState() =>
      _DialogBlurCompleteGroupInfoState();
}

class _DialogBlurCompleteGroupInfoState
    extends State<DialogBlurCompleteGroupInfo>
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
        // body: SizedBox(),
        backgroundColor: Colors.transparent,
        body: Container(
          // margin: EdgeInsets.only(bottom: 80),
          // height: 200,
          // color: Colors.red,
          child: GetBuilder<BlurController>(
            init: blurController,
            builder: (controller) {
              return Opacity(
                opacity: _animationController.value,
                child: ScaleTransition(
                  scale: CurvedAnimation(
                    parent: _animationController,
                    curve: Curves.easeOut,
                  ),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.e,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(child: AppSize.sizedBoxEmpty),
                      Image.asset(AppImagesPath.flagRace),
                      AppSize.sizedBox10,
                      Text(
                        "Finish setting up the group",
                        style: TextStyle(
                            color: AppColor.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Expanded(child: AppSize.sizedBoxEmpty),
                      CustomeBtn(
                        defultPaddeing: false,
                        padding: EdgeInsets.symmetric(
                            horizontal: AppSize.paddingElements12),
                        onTap: () {},
                        title: "Finish later",
                        textColor: AppColor.blue,
                        btnColor: AppColor.white.withOpacity(0.7),
                      ),
                      CustomeBtn(
                        onTap: () {
                          Get.back();
                          Get.to(
                            () => AddGroupInfoView(),
                            duration: Duration(milliseconds: 500),
                            transition: Transition.rightToLeftWithFade,
                          );

                          Get.find<BlurController>().resetController();
                        },
                        title: "Continue",
                        btnColor: AppColor.blue,
                        textColor: AppColor.white,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
