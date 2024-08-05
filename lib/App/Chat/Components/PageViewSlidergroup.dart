import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetswap/App/Chat/Components/GroupOfGroup.dart';
import 'package:meetswap/Constant/Colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../Constant/Size.dart';
import '../Controllers/ChatController.dart';

class SliderGroupChatView extends GetView<ChatController> {
  const SliderGroupChatView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSize.width,
      height: AppSize.width * .88,
      child: Obx(
        () => Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: controller.groupHomeController.value,
                onPageChanged: (value) =>
                    controller.changeHomeActiveIndecator(value),
                itemCount: 4,
                itemBuilder: (context, index) => GroupOfGroupChat(
                  count: 4,
                ),
              ),
            ),
            AnimatedSmoothIndicator(
              activeIndex: controller.indecatorHomeIndex.value,
              count: 4,
              onDotClicked: (index) => controller.changeGroupHomeView(index),
              effect: const WormEffect(
                  // type: SlideTyp.,
                  dotWidth: 8,
                  dotHeight: 8,
                  activeDotColor: AppColor.yallow,
                  dotColor: Colors.black26),
            ),
          ],
        ),
      ),
    );
  }
}
