import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetswap/App/SignUp/Controller/BlurController.dart';
import 'package:meetswap/App/Widgets/AnimateBorderWidget.dart';
import 'package:meetswap/App/Widgets/CustomeAppBar.dart';
import 'package:meetswap/App/Widgets/backgroundWidget.dart';
import 'package:meetswap/Constant/Colors.dart';
import 'package:meetswap/Constant/Size.dart';
import '../Components/EmptyEarningsView.dart';

class YourEarningsView extends StatelessWidget {
  const YourEarningsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BlurController>(builder: (controller_) {
      return ImageFiltered(
        imageFilter: ImageFilter.blur(
            sigmaX: controller_.blurAnimation.value,
            sigmaY: controller_.blurAnimation.value),
        child: BackgroundWidget(
            child: Scaffold(
          body: SafeArea(
              child: Column(
            children: [
              const CustomeAppBar(title: "Your Earnings"),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppSize.paddingElements12),
                      child: AnimatedBorderWidget(
                          child: Container(
                        padding: const EdgeInsets.all(
                          15,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: AppColor.white.withOpacity(0.7)),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total Earnings",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "AED 0",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            )
                          ],
                        ),
                      )),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppSize.paddingElements12),
                      child: Center(child: EmptyEarningsView()),
                    ),
                    // const EarningView()
                  ],
                ),
              )
            ],
          )),
          floatingActionButton: FloatingActionButton(
            // elevation: 1,
            backgroundColor: AppColor.yallow,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            onPressed: () {},
            child: Icon(Icons.add),
          ),
        )),
      );
    });
  }
}
