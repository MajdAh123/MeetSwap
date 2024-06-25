import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetswap/App/SignUp/Controller/SignUpController.dart';
import 'package:meetswap/App/SignUp/View/SignUpDetailsViewPage.dart';
import 'package:meetswap/App/Widgets/TextFieldCustome.dart';
import 'package:meetswap/App/Widgets/YallowBtn.dart';
import 'package:meetswap/Constant/Colors.dart';
import 'package:meetswap/Constant/ImagesPath.dart';
import 'package:meetswap/Constant/Size.dart';
import '../../Widgets/backgroundWidget.dart';
import '../Components/SignUpMethods.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpController());
    return Scaffold(
      body: BackgroundWidget(
        child: Column(
          children: [
            Obx(
              () => Expanded(
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          AppImagesPath.logoWithcloud,
                          height: AppSize.height * 0.4,
                        ),
                        TextFieldCustomeWidget(
                          hint: 'name@email.com',
                          title: "Your Email",
                          controller: controller.emailController.value,
                          validateBorder:
                              controller.emailValedation.value.isNotEmpty,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppSize.paddingElements12),
                          child: Text(
                            controller.emailValedation.value,
                            style: TextStyle(color: AppColor.red, height: 0.3),
                          ),
                        ),
                        YallowBtn(
                            btnColor: controller.isSend.isTrue
                                ? AppColor.white
                                : AppColor.yallow,
                            title: controller.isSend.isTrue
                                ? "Open email"
                                : controller.isLogIn.isTrue
                                    ? "Log In"
                                    : "Sign Up",
                            onTap: () => controller.handelSend()),
                        AppSize.sizedBox5,
                        controller.isSend.isTrue
                            ? const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Magic link sent to email"),
                                ],
                              )
                            : AppSize.sizedBoxEmpty,
                        SizedBox(
                          height: AppSize.height * 0.1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(AppImagesPath.continueWithleft),
                            Text("Or continue with"),
                            Image.asset(AppImagesPath.continueWithright),
                          ],
                        ),
                        AppSize.sizedBox20,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SignUpMethodWidget(
                              image: AppImagesPath.googleIcon,
                              onTap: () {
                                Get.to(() => SignUpDetailsView());
                                print("object");
                              },
                            ),
                            SignUpMethodWidget(
                              image: AppImagesPath.appleIcons,
                              onTap: () {
                                print("object");
                              },
                            ),
                            // SignUpMethodWidget(
                            //   image: AppImagesPath.phoneIcon,
                            //   onTap: () {
                            //     print("object");
                            //   },
                            // ),
                          ],
                        ),
                        AppSize.sizedBox20,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Secured by",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            Image.asset(AppImagesPath.magicLink),
                          ],
                        ),
                        AppSize.sizedBox20,
                      ]),
                ),
              ),
            ),
            AppSize.sizedBox20,
            Obx(
              () => RichText(
                text: TextSpan(
                  text: controller.isLogIn.isTrue
                      ? 'Don\'t have an account yet? '
                      : 'Already have an account? ',
                  style: TextStyle(color: Colors.black), // Regular text style
                  children: <TextSpan>[
                    TextSpan(
                        text: controller.isLogIn.isTrue ? 'Sign Up' : 'Log In',
                        style: TextStyle(
                            color: AppColor.blue,
                            fontWeight:
                                FontWeight.w500), // Blue text for "log in"
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => controller.changeToLogin()),
                  ],
                ),
              ),
            ),
            AppSize.sizedBox10,
          ],
        ),
      ),
    );
  }
}
