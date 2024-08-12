import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetswap/App/Chat/Controllers/ChatController.dart';
import 'package:meetswap/App/Chat/View/HomeChatView.dart';
import 'package:meetswap/App/Widgets/SearchContainer.dart';
import 'package:meetswap/App/Widgets/TitleBetweenArrows.dart';
import 'package:meetswap/App/Widgets/backgroundWidget.dart';
import 'package:meetswap/Constant/ImagesPath.dart';
import 'package:meetswap/Constant/Size.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../Constant/Colors.dart';
import '../Components/GroupOfGroup.dart';
import '../Components/MyGroupViewSlider.dart';

class MyGroupChatViewPage extends GetView<ChatController> {
  const MyGroupChatViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Scaffold(
          body: SizedBox(
        width: AppSize.width,
        child: Obx(
          () => Stack(
            children: [
              Column(
                children: [
                  AppSize.sizedBox20,
                  AppSize.sizedBox10,
                  Row(
                    children: [
                      AppSize.sizedBox10,
                      InkWell(
                          onTap: () {
                            Get.back();
                            controller.indecatorMyGroupIndex.value = 0;
                          },
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            size: 20,
                          )),
                      Expanded(
                          child: SearchContainer(
                              onchange: (value) {},
                              hint: allMyGroupSlids[
                                      controller.indecatorMyGroupIndex.value]
                                  .hint

                              // "model.hint",
                              )),
                    ],
                  ),
                  TitleBetweenArrows(
                      textcolor: Colors.black45,
                      child: Image.asset(allMyGroupSlids[
                              controller.indecatorMyGroupIndex.value]
                          .image),
                      title: allMyGroupSlids[
                              controller.indecatorMyGroupIndex.value]
                          .title),
                  Expanded(
                    child: PageView.builder(
                        controller: controller.myGroupController.value,
                        onPageChanged: (value) =>
                            controller.changeMyGroupActiveIndecator(value),
                        itemCount: allMyGroupSlids.length,
                        itemBuilder: (context, index) => MyGroupViewSlider(
                              model: allMyGroupSlids[index],
                            )),
                  ),
                ],
              ),
              Positioned.fill(
                  bottom: 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Obx(
                        () => AnimatedSmoothIndicator(
                          activeIndex: controller.indecatorMyGroupIndex.value,
                          count: allMyGroupSlids.length,
                          onDotClicked: (index) =>
                              controller.changeMyGroupView(index),
                          effect: const WormEffect(
                              dotWidth: 8,
                              dotHeight: 8,
                              activeDotColor: AppColor.yallow,
                              dotColor: Colors.black26),
                        ),
                      ),
                      AppSize.sizedBox20,
                    ],
                  ))
            ],
          ),
        ),
      )),
    );
  }
}
