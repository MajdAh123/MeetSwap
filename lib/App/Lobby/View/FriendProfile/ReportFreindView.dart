import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetswap/App/Lobby/Controller/LobbyController.dart';
import 'package:meetswap/App/Widgets/YallowBtn.dart';
import 'package:meetswap/App/Widgets/backgroundWidget.dart';
import 'package:meetswap/Constant/Size.dart';

import '../../../../Constant/Colors.dart';

class ReportFriendView extends GetView<LobbyController> {
  const ReportFriendView({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSize.sizedBox20,
            Padding(
              padding: const EdgeInsets.all(AppSize.paddingElements12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: CircleAvatar(
                      radius: 22,
                      backgroundColor: AppColor.white.withOpacity(0.6),
                      child: Center(
                        child: Icon(
                          Icons.arrow_back_ios_new_sharp,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "Report",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: 40,
                  )
                ],
              ),
            ),
            AppSize.sizedBox20,
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSize.paddingElements12,
                  vertical: AppSize.paddingElements12 * 0.5),
              child: Text(
                "Why are you reporting?",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSize.paddingElements12),
              child: Text(
                "Your report is anonymous, except if you're reporting an intellectual property infringement.",
                style: TextStyle(fontSize: 14),
              ),
            ),
            AppSize.sizedBox20,
            Expanded(
                child: ListView.builder(
              itemCount: allReportReasons.length,
              itemBuilder: (context, index) {
                return Obx(
                  () => Directionality(
                    textDirection: TextDirection.rtl,
                    child: RadioListTile(
                      activeColor: Colors.black,
                      title: Text(
                        allReportReasons[index],
                        textAlign: TextAlign.end,
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      value: allReportReasons[index],
                      groupValue: controller.reportReason.value,
                      onChanged: (value) {
                        controller.reportReason.value = allReportReasons[index];
                      },
                    ),
                  ),
                );
              },
            )),
            CustomeBtn(onTap: () {}, title: "OK")
          ],
        ),
      ),
    );
  }
}

List<String> allReportReasons = [
  "Bullying or harassment",
  "False information",
  "I just don't like it",
  "Suicide or self-injury",
  "Sale of illegal or regulated goods",
  "Intellectual property violation",
  "Eating disorders"
];
