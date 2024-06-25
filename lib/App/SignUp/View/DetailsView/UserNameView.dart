import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetswap/App/SignUp/Controller/SignUpController.dart';
import 'package:meetswap/App/Widgets/TextFieldCustome.dart';
import 'package:meetswap/Constant/ImagesPath.dart';
import 'package:meetswap/Constant/Size.dart';

import '../../../../Constant/Colors.dart';

class UserNameView extends GetView<SignUpController> {
  const UserNameView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppSize.sizedBox20,
        AppSize.sizedBox20,
        Text(
          "Choose an username",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        TextFieldCustomeWidget(
          widget: Padding(
            padding: const EdgeInsets.only(left: AppSize.paddingElements12),
            child: Image.asset(AppImagesPath.emailAddressSign),
          ),
          title: "",
          hint: "eg. Berryyy02",
          controller: controller.usernameController.value,
          validateBorder: controller.userNameValedation.value.isNotEmpty,
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSize.paddingElements12 + 5),
              child: Text(
                controller.userNameValedation.value,
                style: const TextStyle(color: AppColor.red, height: 0.3),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
