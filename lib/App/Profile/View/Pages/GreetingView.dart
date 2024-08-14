import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetswap/App/Profile/Controller/profileController.dart';
import 'package:meetswap/App/Widgets/CustomeAppBar.dart';
import 'package:meetswap/App/Widgets/TextFieldCustome.dart';
import 'package:meetswap/App/Widgets/YallowBtn.dart';
import 'package:meetswap/App/Widgets/backgroundWidget.dart';
import 'package:meetswap/Constant/Colors.dart';
import 'package:meetswap/Constant/ImagesPath.dart';
import 'package:meetswap/Constant/Size.dart';

class GreetingViewProfile extends GetView<ProfileController> {
  const GreetingViewProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomeAppBar(title: "Personal greeting"),
                Padding(
                  padding: const EdgeInsets.all(AppSize.paddingElements12),
                  child: Text(
                    'How would you like\nto greet people?',
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: AppSize.paddingElements12),
                  child: Text(
                    "People nearby will see this message",
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
                AppSize.sizedBox10,
                TextFieldCustomeWidget(
                    maxLines: 7,
                    controller: controller.greetController.value,
                    title: "",
                    hint: "Enter your greet message here..."),
                Expanded(child: SizedBox()),
                CustomeBtn(onTap: () {}, title: "Save")
              ],
            ),
            Positioned.fill(
                // bottom: AppSize.height * 0.1,
                child: Column(
              children: [
                Expanded(child: SizedBox()),
                Image.asset(AppImagesPath.greetImage),
                SizedBox(
                  height: 170,
                )
              ],
            ))
          ],
        )),
      ),
    );
  }
}
