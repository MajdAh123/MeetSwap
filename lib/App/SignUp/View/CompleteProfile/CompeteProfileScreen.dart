import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetswap/App/SignUp/Controller/SignUpController.dart';
import 'package:meetswap/App/SignUp/View/CompleteProfile/GreetView.dart';
import 'package:meetswap/App/SignUp/View/CompleteProfile/UserPhotoView.dart';
import '../../../../Constant/Size.dart';
import '../../../Widgets/backButtonWidget.dart';
import '../../../Widgets/backgroundWidget.dart';
import '../../../Widgets/statusBarWidget.dart';

class CompleteProfileScreen extends GetView<SignUpController> {
  const CompleteProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BackgroundWidget(
          child: Obx(
        () => Stack(
          children: [
            Column(
              children: [
                AppSize.sizedBox20,
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: StatusBarWidget(
                      totalSteps: 2,
                      currentStep: controller.completeCurrentIndex.value),
                ),
                Row(
                  children: [
                    BackButtonWidget(
                      onTap: () => controller.previuosCompleteView(),
                    ),
                  ],
                ),
                Expanded(
                    child: IndexedStack(
                  index: controller.completeCurrentIndex.value,
                  children: const [
                    UserPhotoView(),
                    GreetView(),
                    // SimiCompletedView()
                  ],
                )),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
