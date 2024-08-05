import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetswap/Constant/ImagesPath.dart';
import 'package:meetswap/Constant/Size.dart';

import '../../../../Constant/Colors.dart';
import '../../Controllers/BottomBarChatingController.dart';
import 'WaveRecording.dart';

class RecordingChatingWidget extends GetView<BottomBarChatingController> {
  const RecordingChatingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Obx(
          () => controller.isRecording.isTrue
              ? SizedBox()
              : GestureDetector(
                  onTap: () => controller.deleteRecord(),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: AppColor.white,
                      child: Center(
                        child: Icon(Icons.close),
                      ),
                    ),
                  ),
                ),
        ),
        // if (controller.recordingDuration.value != Duration.zero &&
        //     controller.isRecording.isFalse)
        Expanded(
          child: Row(
            children: [
              // AppSize.sizedBox20,
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: AppColor.white),
                    child: Row(
                      children: [
                        AppSize.sizedBox20,
                        Expanded(
                          child: Stack(
                            children: [
                              Obx(
                                () => CustomPaint(
                                  size: Size(
                                      controller.animationValue.value * 10 <
                                              AppSize.width - 70
                                          ? controller.animationValue.value * 10
                                          : AppSize.width - 70,
                                      20),
                                  painter: controller.isstartRecording.value
                                      ? SineWavePainter(
                                          animationValue:
                                              controller.animationValue.value)
                                      : null,
                                ),
                              ),
                              Obx(
                                () => CustomPaint(
                                  size: Size(
                                      controller.animationValue.value * 10 <
                                              AppSize.width - 70
                                          ? controller.animationValue.value * 10
                                          : AppSize.width - 70,
                                      20),
                                  painter: controller.isstartRecording.value
                                      ? InverseSineWavePainter(
                                          animationValue:
                                              controller.animationValue.value)
                                      : null,
                                ),
                              ),
                            ],
                          ),
                        ),
                        AppSize.sizedBox10,
                        Obx(
                          () => Text(
                            "${controller.recordingDuration.value.inMinutes.toString().padLeft(2, '0')}:${(controller.recordingDuration.value.inSeconds % 60).toString().padLeft(2, '0')}",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        AppSize.sizedBox10,
                        Obx(() => controller.recordingDuration.value !=
                                    Duration.zero &&
                                controller.isRecording.isFalse
                            ? Row(
                                children: [
                                  Image.asset(
                                    AppImagesPath.sendIcon,
                                    width: 22,
                                  ),
                                  AppSize.sizedBox20
                                ],
                              )
                            : AppSize.sizedBoxEmpty)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        Obx(() => controller.isRecording.isTrue
            ? GestureDetector(
                onTap: () => controller.isRecording.isTrue
                    ? controller.stopRecording()
                    : controller.startRecording(),
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
            : SizedBox())
      ],
    );
  }
}
