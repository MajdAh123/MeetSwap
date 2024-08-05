import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetswap/App/Home/Bindings/HomeBindings.dart';
import 'package:meetswap/App/Home/View/HomePageView.dart';
import 'package:meetswap/App/SignUp/Controller/SignUpController.dart';
import 'package:meetswap/App/Widgets/TextFieldCustome.dart';
import 'package:meetswap/App/Widgets/YallowBtn.dart';
import 'package:meetswap/Constant/ImagesPath.dart';

import '../../../../Constant/Size.dart';

class GreetView extends GetView<SignUpController> {
  const GreetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            AppSize.sizedBox10,
            Center(
              child: Text(
                'How would you like to\nsay hello to people?',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            AppSize.sizedBox10,
            TextFieldCustomeWidget(
                maxLines: 7,
                controller: controller.greetController.value,
                title: "",
                hint: "Enter your greet message here..."),
            Expanded(child: SizedBox()),
            CustomeBtn(
                onTap: () {
                  Get.to(() => HomePageView(),
                      binding: HomeBinding(),
                      duration: Duration(milliseconds: 500),
                      transition: Transition.leftToRightWithFade);
                },
                title: "Continue")
          ],
        ),
        Positioned.fill(
            // bottom: AppSize.height * 0.1,
            child: Column(
          children: [
            Expanded(child: SizedBox()),
            Image.asset(AppImagesPath.greetImage),
            SizedBox(
              height: 160,
            )
          ],
        ))
      ],
    );
  }
}
