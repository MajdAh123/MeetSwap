import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetswap/App/Profile/Controller/profileController.dart';
import 'package:meetswap/App/Widgets/CustomeAppBar.dart';
import 'package:meetswap/App/Widgets/TextFieldCustome.dart';
import 'package:meetswap/App/Widgets/YallowBtn.dart';
import 'package:meetswap/App/Widgets/backgroundWidget.dart';
import 'package:meetswap/Constant/Colors.dart';
import 'package:meetswap/Constant/Size.dart';

class SupportCenterView extends GetView<ProfileController> {
  const SupportCenterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomeAppBar(title: "Support Centre"),
            Padding(
              padding: const EdgeInsets.all(AppSize.paddingElements12),
              child: Text(
                'How can we help you?',
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: AppSize.paddingElements12),
              child: Text(
                "Fill the form to let us know the problem and help us improve",
                style: TextStyle(color: Colors.black54, fontSize: 12),
              ),
            ),
            AppSize.sizedBox10,
            TextFieldCustomeWidget(
                maxLines: 7,
                controller: controller.greetController.value,
                title: "Share your problem below:",
                hint: "Type your problem here..."),
            Expanded(child: SizedBox()),
            CustomeBtn(onTap: () {}, title: "Submit")
          ],
        )),
      ),
    );
  }
}
