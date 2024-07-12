import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetswap/App/Home/Controller/homePageController.dart';
import '../../../../Constant/Size.dart';
import '../../../Widgets/YallowBtn.dart';

class LobbyEmptyView extends StatelessWidget {
  const LobbyEmptyView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(flex: 2, child: AppSize.sizedBoxEmpty),
          Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: AppSize.width * 0.65,
                    child: Text(
                      "“This is your lobby! After meeting new people, they will land here!”",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(flex: 1, child: AppSize.sizedBoxEmpty),
                  // AppSize.sizedBox20,
                  SizedBox(
                      width: AppSize.width * 0.5,
                      child: Text(
                        "Someone’s waiting at your gate! Tap to see who it is",
                        textAlign: TextAlign.center,
                      )),
                  SizedBox(
                      width: AppSize.width * 0.5,
                      child: CustomeBtn(
                          onTap: () {
                            Get.find<HomePageController>().setPageIndex(2);
                          },
                          title: "Explore")),
                  Expanded(flex: 2, child: AppSize.sizedBoxEmpty),
                ],
              )),
        ],
      ),
    );
  }
}
