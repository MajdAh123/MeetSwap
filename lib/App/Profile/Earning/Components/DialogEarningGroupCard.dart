import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetswap/App/Chat/Components/ChatGroupCard.dart';
import 'package:meetswap/App/Profile/Earning/View/SetGroupPriceView.dart';
import 'package:meetswap/Constant/Colors.dart';
import 'package:meetswap/Constant/Size.dart';

import '../../../SignUp/Controller/BlurController.dart';

class DialogEarningsGroupCard extends StatefulWidget {
  const DialogEarningsGroupCard({
    super.key,
    required this.tapPosition,
  });

  final Offset tapPosition;

  @override
  State<DialogEarningsGroupCard> createState() =>
      _DialogEarningsGroupCardState();
}

class _DialogEarningsGroupCardState extends State<DialogEarningsGroupCard>
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
    return WillPopScope(
      onWillPop: () async {
        Get.find<BlurController>().resetController();
        return true;
      },
      child: Scaffold(
        body: GetBuilder<BlurController>(builder: (cc) {
          return Opacity(
            opacity: _animationController.value,
            child: ScaleTransition(
              scale: CurvedAnimation(
                parent: _animationController,
                curve: Curves.easeOut,
              ),
              child: Stack(children: [
                Positioned(
                  top: 12,
                  left: 12,
                  child: GestureDetector(
                    onTap: () {
                      Get.find<BlurController>().resetController();
                      Get.back();
                    },
                    child: CircleAvatar(
                      radius: 22,
                      backgroundColor: AppColor.white.withOpacity(0.6),
                      child: const Center(
                        child: Icon(
                          Icons.arrow_back_ios_new_outlined,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                    left: (AppSize.width * 0.5) - 125,
                    bottom: widget.tapPosition.dy > 600
                        ? 30 + AppSize.width * .45
                        : (AppSize.height - 580) + AppSize.width * .45,
                    child: Container(
                      width: 250,
                      height: 90,
                      padding: const EdgeInsets.all(AppSize.paddingElements12),
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              // print('0');
                              // Get.back();

                              Get.find<BlurController>().resetController();

                              Get.off(
                                () => const SetGroupPriceView(),
                                transition: Transition
                                    .rightToLeftWithFade, // Specify the transition here
                                duration: const Duration(milliseconds: 500),
                              );
                            },
                            child: const SizedBox(
                              width: 250,
                              height: 32,
                              child: Text(
                                "Change price",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          const Divider(
                            color: Colors.black12,
                            height: 0.5,
                          ),
                          GestureDetector(
                            onTap: () {
                              print("1");
                            },
                            child: const SizedBox(
                              width: 250,
                              height: 32,
                              child: Text(
                                "Cancel subscription",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    height: 2,
                                    color: AppColor.red),
                              ),
                            ),
                          )
                        ],
                      ),
                    )),
                Positioned(
                  left: widget.tapPosition.dx > AppSize.width * 0.5
                      ? AppSize.width * 0.48
                      : 10,
                  bottom:
                      widget.tapPosition.dy > 600 ? 30 : AppSize.height - 580,
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                          elevation: 0,
                          color: AppColor.yallow,
                          borderRadius: BorderRadius.circular(20),
                          child: const ChatGroupCard(
                            isInDialog: true,
                          ),
                        ),
                      ),
                      Positioned(
                        right: widget.tapPosition.dx > AppSize.width * 0.5
                            ? null
                            : 0,
                        left: widget.tapPosition.dx > AppSize.width * 0.5
                            ? 0
                            : null,
                        top: 0,
                        child: const CircleAvatar(
                          radius: 17,
                          backgroundColor: Color(0xff5f606f),
                          child: CircleAvatar(
                            radius: 12,
                            backgroundColor: AppColor.blue,
                            child: Icon(
                              Icons.check_rounded,
                              color: AppColor.white,
                              size: 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          );
        }),
      ),
    );
  }
}
