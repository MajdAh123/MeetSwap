import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetswap/App/Profile/Controller/profileController.dart';
import 'package:meetswap/App/Widgets/CustomeAppBar.dart';
import 'package:meetswap/App/Widgets/backgroundWidget.dart';
import 'package:meetswap/Constant/Colors.dart';
import 'package:meetswap/Constant/Size.dart';

class SecurityPrivacyView extends GetView<ProfileController> {
  const SecurityPrivacyView({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Scaffold(
          body: SafeArea(
              child: Column(
        children: [
          CustomeAppBar(title: "Security & Privacy"),
          AppSize.sizedBox20,
          Padding(
            padding: const EdgeInsets.all(AppSize.paddingElements12),
            child: Container(
                padding: const EdgeInsets.all(AppSize.paddingElements12),
                width: AppSize.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppColor.white.withOpacity(0.7),
                ),
                child: Column(
                  children: [
                    Obx(
                      () => SecurityOptionCard(
                        title: "Ratings",
                        value: controller.reaingsSecur.value,
                        onchange: (value) {
                          controller.reaingsSecur.value = value;
                        },
                      ),
                    ),
                    const Divider(
                      height: 0.8,
                      color: Colors.black12,
                    ),
                    Obx(
                      () => SecurityOptionCard(
                        title: "Number of encounters",
                        value: controller.numOfencoSecur.value,
                        onchange: (value) {
                          controller.numOfencoSecur.value = value;
                        },
                      ),
                    ),
                    const Divider(
                      height: 0.8,
                      color: Colors.black12,
                    ),
                    Obx(
                      () => SecurityOptionCard(
                        title: "Lobby size",
                        value: controller.lobbySecur.value,
                        onchange: (value) {
                          controller.lobbySecur.value = value;
                        },
                      ),
                    ),
                    const Divider(
                      height: 0.8,
                      color: Colors.black12,
                    ),
                    Obx(
                      () => SecurityOptionCard(
                        title: "Visit lobby",
                        value: controller.visitSecur.value,
                        onchange: (value) {
                          controller.visitSecur.value = value;
                        },
                      ),
                    ),
                    const Divider(
                      height: 0.8,
                      color: Colors.black12,
                    ),
                    Obx(
                      () => SecurityOptionCard(
                        title: "Online label",
                        value: controller.onlineSecur.value,
                        onchange: (value) {
                          controller.onlineSecur.value = value;
                        },
                      ),
                    ),
                    const Divider(
                      height: 0.8,
                      color: Colors.black12,
                    ),
                    Obx(
                      () => SecurityOptionCard(
                        title: "Age",
                        value: controller.ageSecur.value,
                        onchange: (value) {
                          controller.ageSecur.value = value;
                        },
                      ),
                    ),
                    const Divider(
                      height: 0.8,
                      color: Colors.black12,
                    ),
                    Obx(
                      () => SecurityOptionCard(
                        title: "Who can message me",
                        value: controller.whoCanMessageSecur.value,
                        onchange: (value) {
                          controller.whoCanMessageSecur.value = value;
                        },
                      ),
                    ),
                  ],
                )),
          )
        ],
      ))),
    );
  }
}

class SecurityOptionCard extends GetView<ProfileController> {
  const SecurityOptionCard(
      {super.key,
      required this.title,
      required this.value,
      required this.onchange});
  final String title;
  final bool value;
  final void Function(bool)? onchange;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 2),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          Expanded(child: AppSize.sizedBoxEmpty),
          Text(
            "Private",
            style: TextStyle(fontSize: 12, color: Colors.black45),
          ),
          AppSize.sizedBox10,
          Switch.adaptive(
              activeTrackColor: AppColor.teal,
              thumbIcon:
                  MaterialStateProperty.resolveWith((states) => const Icon(
                        Icons.circle,
                        color: AppColor.white,
                        size: 35,
                      )),
              trackOutlineWidth:
                  MaterialStateProperty.resolveWith((states) => 0),
              inactiveTrackColor: AppColor.primaryColor,
              thumbColor:
                  MaterialStateColor.resolveWith((states) => AppColor.white),
              value: value,
              onChanged: onchange!),
        ],
      ),
    );
  }
}
