import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetswap/App/Gate/Controller/GateController.dart';
import 'package:meetswap/App/Widgets/YallowBtn.dart';
import 'package:meetswap/Constant/Colors.dart';
import 'package:meetswap/Constant/ImagesPath.dart';
import 'package:meetswap/Constant/Size.dart';

class GatePageView extends StatelessWidget {
  GatePageView({super.key});

  final GateController gateController = Get.find<GateController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.width,
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage(AppImagesPath.getBackground),
        fit: BoxFit.cover,
      )),
      child: Column(
        children: [
          AppSize.sizedBox20,
          AppSize.sizedBox10,
          Padding(
            padding: const EdgeInsets.all(AppSize.paddingElements12),
            child: Row(
              children: [
                Text(
                  "Around Me",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Expanded(
              flex: 6,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: AppSize.paddingElements12 * 4.5,
                    horizontal: AppSize.paddingElements12 * 3),
                child: Stack(
                  children: [
                    Container(
                      // margin: EdgeInsets.all(AppSize.paddingElements12 * 4),
                      decoration: BoxDecoration(
                        // color: Colors.amber,
                        borderRadius: BorderRadius.circular(800),
                        // color: Colors.amber,
                      ),
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 2),
                          child: CircleAvatar(
                            radius: 40,
                            // backgroundColor: Colors.red,
                            backgroundImage:
                                AssetImage(AppImagesPath.userBotBarIcon),
                          ),
                        ),
                      ),
                    ),
                    for (int i = 0; i < 5; i++)
                      Positioned(
                        top: [null, 100.0, 30.0, 100.0, null].elementAt(i),
                        right: [null, null, null, 80.0, 40.0].elementAt(i),
                        bottom: [100.0, null, null, null, 100.0].elementAt(i),
                        left: [
                          50.0,
                          60.0,
                          ((AppSize.width / 2) - 80).toDouble(),
                          null,
                          null
                        ].elementAt(i),
                        child: CircleAvatar(
                          radius: 20,
                          // backgroundColor: Colors.red,
                          backgroundImage:
                              AssetImage(AppImagesPath.userBotBarIcon),
                        ),
                      ),
                    // Positioned.fill(
                    //   // left: 1 - 3,
                    //   // right: -8,
                    //   // top: 8,
                    //   // bottom: -5,
                    //   child:
                    //   RotationTransition(
                    //       turns: gateController.animationController,
                    //       child: Container(
                    //         // width: AppSize.width*.3,
                    //         decoration: BoxDecoration(
                    //             // color: Colors.red,
                    //             // color: Colors.red,
                    //             borderRadius: BorderRadius.circular(800),
                    //             image: DecorationImage(
                    //                 image: AssetImage(
                    //                   AppImagesPath.blueScann,
                    //                 ),
                    //                 fit: BoxFit.fill)),
                    //       )
                    //       // Image.asset(
                    //       //   AppImagesPath.blueScann,
                    //       //   fit: BoxFit.fitHeight,
                    //       // ),
                    //       ),
                    // ),
                    Positioned.fill(
                        bottom: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Image.asset(
                              AppImagesPath.scanCover,
                              width: AppSize.width * .45,
                            ),
                          ],
                        ))
                  ],
                ),
              )),
          Expanded(
            flex: 3,
            child: Container(
              // height: 230,
              width: AppSize.width,
              // color: Colors.green,
              child: Column(
                children: [
                  Text("Say \"Hi\" to people around you"),
                  SizedBox(
                      width: AppSize.width * 0.55,
                      child: CustomeBtn(
                        onTap: () => gateController.changeViewing(),
                        title: "Discover",
                      )),
                  AppSize.sizedBox20,
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppSize.paddingElements12 * 1.5),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "More people nearby",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w500),
                            ),
                            AppSize.sizedBox10,
                            Row(
                              children: [
                                for (int i = 0; i < 4; i++)
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: AppSize.paddingElements12 * 0.8),
                                    child: CircleAvatar(
                                      radius: 20,
                                      // backgroundColor: Colors.red,
                                      backgroundImage: AssetImage(
                                          AppImagesPath.userBotBarIcon),
                                    ),
                                  ),
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      border: Border.all(
                                          color: AppColor.white, width: 2)),
                                  child: Center(
                                    child: Text(
                                      "+5",
                                      style: TextStyle(
                                          color: AppColor.white,
                                          fontSize: 11,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
