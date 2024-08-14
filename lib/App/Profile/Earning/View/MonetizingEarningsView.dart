import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetswap/App/Profile/Earning/Controller/EarningController.dart';
import 'package:meetswap/App/Profile/View/Pages/TermsOfServiceView.dart';
import 'package:meetswap/App/Widgets/YallowBtn.dart';
import 'package:meetswap/App/Widgets/backgroundWidget.dart';
import 'package:meetswap/App/Widgets/shiningEffectWidget.dart';
import 'package:meetswap/Constant/Colors.dart';
import 'package:meetswap/Constant/ImagesPath.dart';
import 'package:meetswap/Constant/Size.dart';

class MonetizingEarningsView extends GetView<EarningsContoller> {
  const MonetizingEarningsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: WillPopScope(
        onWillPop: () async {
          controller.showText.value = false;
          return true;
        },
        child: Scaffold(
          body: SafeArea(
              child: Stack(
            children: [
              Positioned(
                top: 50,
                child: ShiningWidget(
                  maxSize: AppSize.width * 1,
                  isDroping: true,
                  child: Image.asset(
                    AppImagesPath.giftImage,
                    width: 250,
                  ),
                ),
              ),
              Positioned.fill(
                  child: SizedBox(
                width: AppSize.width,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      AppSize.sizedBox20,
                      Obx(
                        () => AnimatedOpacity(
                          duration: const Duration(milliseconds: 800),
                          opacity: controller.showText.value ? 1 : 0,
                          child: const Text(
                            "Earn by monetizing \nyour group chats ",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: AppSize.width * .75,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Container(
                          width: AppSize.width,
                          height: 60,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(AppImagesPath.goldBorder),
                                  fit: BoxFit.fill)),
                          child: const Padding(
                            padding: EdgeInsets.all(15),
                            child: Row(
                              children: [
                                AppSize.sizedBox10,
                                Text(
                                  "Monthly Plan",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                Expanded(
                                  child: AppSize.sizedBoxEmpty,
                                ),
                                Text(
                                  "AED 200",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18),
                                ),
                                Text("/mo"),
                                AppSize.sizedBox10
                              ],
                            ),
                          ),
                        ),
                      ),
                      AppSize.sizedBox20,
                      const MemberAdvantage(),
                      const MemberAdvantage(),
                      const MemberAdvantage(),
                      CustomeBtn(onTap: () {}, title: "Subscribe"),
                      SizedBox(
                        width: AppSize.width * 0.8,
                        child: GestureDetector(
                          onTap: () {
                            Get.to(
                              () => const TermsOfServiceView(),

                              transition: Transition
                                  .rightToLeftWithFade, // Specify the transition here
                              duration: const Duration(milliseconds: 500),
                            );
                          },
                          child: const Column(
                            children: [
                              Text(
                                "By subscribing to our admin membership plan, you acknowledge that you have read and agreed to these\n",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black38,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "terms and conditions.",
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    height: -2,
                                    fontSize: 13,
                                    color: Colors.black38),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                      ),
                      AppSize.sizedBox20
                    ],
                  ),
                ),
              ))
            ],
          )),
        ),
      ),
    );
  }
}

class MemberAdvantage extends StatelessWidget {
  const MemberAdvantage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: AppSize.width * .8,
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Column(
                children: [
                  AppSize.sizedBox5,
                  CircleAvatar(
                    radius: 10,
                    backgroundColor: AppColor.teal,
                    child: Icon(
                      Icons.check_sharp,
                      size: 15,
                    ),
                  ),
                ],
              ),
              AppSize.sizedBox10,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Member Advantages",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    width: AppSize.width * 0.7,
                    child: const Text(
                      "Lorem ipsum dolor sit amet. Aut eaque necessi",
                      style: TextStyle(fontSize: 13, color: Colors.black38),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        )
      ],
    );
  }
}
