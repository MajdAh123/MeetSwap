import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetswap/App/Chat/Components/BottomBarChating/RecordingChatingWidget.dart';
import 'package:meetswap/Constant/Colors.dart';
import 'package:meetswap/Constant/Size.dart';

import '../../Controllers/BottomBarChatingController.dart';
import 'TextChatingWidget.dart';

class BottomCharBar extends StatelessWidget {
  BottomCharBar({
    super.key,
  });
  final controller =
      Get.put<BottomBarChatingController>(BottomBarChatingController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomBarChatingController>(builder: (controller) {
      return Obx(
        () => Container(
            margin: const EdgeInsets.fromLTRB(12, 0, 12, 12),
            decoration: BoxDecoration(
                borderRadius: controller.showReply.value
                    ? BorderRadius.vertical(
                        bottom: Radius.circular(30), top: Radius.circular(13))
                    : BorderRadius.circular(30),
                color: AppColor.white.withOpacity(0.3)),
            child: Column(
              children: [
                // if (controller.showReply.value)
                Obx(() => controller.showReply.value
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IntrinsicHeight(
                          child: Container(
                            // color: Colors.red,
                            decoration: BoxDecoration(
                                color: AppColor.primaryColor.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(15)),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    width: 8,
                                    // height: 50,
                                    decoration: BoxDecoration(
                                        color: AppColor.primaryColor,
                                        borderRadius: BorderRadius.horizontal(
                                            left: Radius.circular(15))),
                                  ),
                                ),
                                AppSize.sizedBox5,
                                Expanded(
                                  flex: 40,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AppSize.sizedBox5,
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              controller.isMeReply.value
                                                  ? "You"
                                                  : "Annie",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              controller.isMeReply.value =
                                                  false;
                                              controller.replyText.value = "";
                                              controller.showReply.value =
                                                  false;
                                            },
                                            child: Icon(
                                              Icons.close,
                                              size: 15,
                                            ),
                                          ),
                                          AppSize.sizedBox10
                                        ],
                                      ),
                                      AppSize.sizedBox5,
                                      Text(
                                        controller.replyText.value,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      AppSize.sizedBox5
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : SizedBox()),
                Obx(
                  () => controller.isstartRecording.isTrue
                      ? RecordingChatingWidget()
                      : TextChatingWidget(),
                ),
              ],
            )),
      );
    });
  }
}
