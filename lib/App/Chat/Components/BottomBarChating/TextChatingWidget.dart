import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetswap/App/Chat/Controllers/BottomBarChatingController.dart';
import 'package:meetswap/Constant/Colors.dart';
import 'package:meetswap/Constant/ImagesPath.dart';
import 'package:meetswap/Constant/Size.dart';

class TextChatingWidget extends GetView<BottomBarChatingController> {
  const TextChatingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Obx(
          () => controller.isRecording.isTrue
              ? SizedBox()
              : Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: AppColor.white,
                    child: Center(
                      child: Image.asset(
                        AppImagesPath.imageIcon,
                        width: 22,
                      ),
                    ),
                  ),
                ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Container(
                padding:
                    EdgeInsets.symmetric(horizontal: AppSize.paddingElements12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: AppColor.white),
                child: Row(
                  children: [
                    Expanded(
                      child: Obx(
                        () => TextField(
                          controller: controller.messageTextEditing.value,
                          textDirection: controller.textDirection.value,
                          onChanged: (value) {
                            controller.update();
                          },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Write a message",
                              hintStyle: TextStyle(fontSize: 13)),
                        ),
                      ),
                    ),
                    if (controller.messageTextEditing.value.text.isNotEmpty)
                      Image.asset(
                        AppImagesPath.sendIcon,
                        width: 22,
                      )
                  ],
                )),
          ),
        ),
        if (controller.messageTextEditing.value.text.isEmpty)
          GestureDetector(
            onTap: () {
              controller.isstartRecording.value = true;
              controller.startRecording();
            },
            child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Obx(
                  () => CircleAvatar(
                    radius: 25,
                    backgroundColor: controller.isRecording.isTrue
                        ? AppColor.yallow
                        : AppColor.white,
                    child: Center(
                        child: Image.asset(
                      AppImagesPath.voiceIcon,
                      width: 22,
                    )),
                  ),
                )),
          )
      ],
    );
  }
}
