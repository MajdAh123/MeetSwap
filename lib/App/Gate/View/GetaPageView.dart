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
    return Column(
      children: [
        Expanded(
          child: Container(
            width: AppSize.width,
            // height: AppSize.height - 85,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage(AppImagesPath.yallowShadowGate),
              fit: BoxFit.fill,
            )),
            child: Column(
              children: [
                // AppSize.sizedBox20,
                // AppSize.sizedBox10,
                Padding(
                  padding: const EdgeInsets.all(AppSize.paddingElements12),
                  child: Row(
                    children: [
                      Text(
                        "Around Me",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                // Expanded(child: SizedBox()),

                // Expanded(child: SizedBox()),

                Expanded(
                  child: Stack(
                    children: [
                      Positioned.fill(
                          child: Column(
                        children: [
                          SizedBox(
                            height: AppSize.height < 900
                                ? AppSize.height * 0.06
                                : AppSize.height * 0.85,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    width: AppSize.width * 0.95,
                                    height: AppSize.width * 0.95,
                                    decoration: BoxDecoration(
                                        // color: Colors.amber,
                                        borderRadius:
                                            BorderRadius.circular(800),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                AppImagesPath.circulerGate),
                                            fit: BoxFit.fill)),
                                  ),
                                  Positioned.fill(
                                    child: Center(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          AppSize.sizedBox20,
                                          CircleAvatar(
                                            radius: AppSize.width * 0.1,
                                            // backgroundColor: Colors.red,
                                            backgroundImage: AssetImage(
                                                AppImagesPath.userBotBarIcon),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned.fill(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            AppSize.sizedBox20,
                                            RotationTransition(
                                                turns: gateController
                                                    .animationController,
                                                child: Container(
                                                  width: AppSize.width * 0.85,
                                                  height: AppSize.width * 0.85,
                                                  decoration: BoxDecoration(
                                                      // color: Colors.red,
                                                      // color: Colors.red,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              800),
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                            AppImagesPath
                                                                .blueScann,
                                                          ),
                                                          fit: BoxFit.fill)),
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned.fill(
                                      bottom: 12,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Image.asset(
                                            AppImagesPath.scanCover,
                                            width: AppSize.width * .45,
                                          ),
                                        ],
                                      )),
                                  for (int i = 0; i < 5; i++)
                                    Positioned(
                                      top: [null, 110.0, 60.0, 100.0, null]
                                          .elementAt(i),
                                      right: [null, null, null, 80.0, 60.0]
                                          .elementAt(i),
                                      bottom: [100.0, null, null, null, 100.0]
                                          .elementAt(i),
                                      left: [
                                        50.0,
                                        60.0,
                                        ((AppSize.width / 2) - 60).toDouble(),
                                        null,
                                        null
                                      ].elementAt(i),
                                      child: CircleAvatar(
                                        radius: 20,
                                        // backgroundColor: Colors.red,
                                        backgroundImage: AssetImage(
                                            AppImagesPath.userBotBarIcon),
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      )),
                    ],
                  ),
                ),
                Container(
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
                    ],
                  ),
                ),
                // Container(
                //   // height: AppSize.height * 0.55,
                //   // color: Colors.green,
                //   child: Padding(
                //     padding: EdgeInsets.symmetric(
                //         vertical: AppSize.paddingElements12 * 4,
                //         horizontal: AppSize.paddingElements12 * 2),
                //     child: Stack(
                //       children: [
                //         // Container(
                //         //   // margin: EdgeInsets.all(AppSize.paddingElements12 * 4),
                //         //   decoration: BoxDecoration(
                //         //     // color: Colors.amber,
                //         //     borderRadius: BorderRadius.circular(20),
                //         //     // color: Colors.amber,
                //         //   ),
                //         //   child: Center(
                //         //     child: Padding(
                //         //       padding: EdgeInsets.only(bottom: 2),
                //         //       child:
                //         //     ),
                //         //   ),
                //         // ),
                //         for (int i = 0; i < 5; i++)
                //           Positioned(
                //             top: [null, 100.0, 30.0, 100.0, null].elementAt(i),
                //             right: [null, null, null, 80.0, 40.0].elementAt(i),
                //             bottom:
                //                 [100.0, null, null, null, 100.0].elementAt(i),
                //             left: [
                //               50.0,
                //               60.0,
                //               ((AppSize.width / 2) - 80).toDouble(),
                //               null,
                //               null
                //             ].elementAt(i),
                //             child: CircleAvatar(
                //               radius: 20,
                //               // backgroundColor: Colors.red,
                //               backgroundImage:
                //                   AssetImage(AppImagesPath.userBotBarIcon),
                //             ),
                //           ),
                //         Column(
                //           // crossAxisAlignment: CrossAxisAlignment.center,
                //           // mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             Row(
                //               mainAxisAlignment: MainAxisAlignment.center,
                //               children: [
                //                 Stack(
                //                   children: [
                //                     RotationTransition(
                //                         turns:
                //                             gateController.animationController,
                //                         child: Container(
                //                           // width: AppSize.height * .41,
                //                           // height: AppSize.height * .41,
                //                           decoration: BoxDecoration(
                //                               // color: Colors.red,
                //                               // color: Colors.red,
                //                               borderRadius:
                //                                   BorderRadius.circular(800),
                //                               image: DecorationImage(
                //                                   image: AssetImage(
                //                                     AppImagesPath.blueScann,
                //                                   ),
                //                                   fit: BoxFit.fill)),
                //                         )
                //                         // Image.asset(
                //                         //   AppImagesPath.blueScann,
                //                         //   fit: BoxFit.fitHeight,
                //                         // ),
                //                         ),
                //                     Positioned.fill(
                //                       child: Center(
                //                         child: CircleAvatar(
                //                           radius: AppSize.width * 0.1,
                //                           // backgroundColor: Colors.red,
                //                           backgroundImage: AssetImage(
                //                               AppImagesPath.userBotBarIcon),
                //                         ),
                //                       ),
                //                     )
                //                   ],
                //                 ),
                //               ],
                //             ),
                //             // Expanded(child: SizedBox())
                //           ],
                //         ),
                //         Positioned.fill(
                //             bottom: 12,
                //             child: Row(
                //               mainAxisAlignment: MainAxisAlignment.center,
                //               crossAxisAlignment: CrossAxisAlignment.end,
                //               children: [
                //                 Image.asset(
                //                   AppImagesPath.scanCover,
                //                   width: AppSize.width * .45,
                //                 ),
                //               ],
                //             ))
                //       ],
                //     ),
                //   ),
                // ),
                // Expanded(
                //   // flex: 2,
                //   child: Container(
                //     // height: 230,
                //     width: AppSize.width,
                //     // color: Colors.green,
                //     child: Column(
                //       children: [
                //         Text("Say \"Hi\" to people around you"),
                //         SizedBox(
                //             width: AppSize.width * 0.55,
                //             child: CustomeBtn(
                //               onTap: () => gateController.changeViewing(),
                //               title: "Discover",
                //             )),
                //       ],
                //     ),
                //   ),
                // )
              ],
            ),
          ),
        ),
        Container(
          // height: 107,
          child: Column(children: [
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
                                backgroundImage:
                                    AssetImage(AppImagesPath.userBotBarIcon),
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
                      ),
                      AppSize.sizedBox20
                    ],
                  )
                ],
              ),
            )
          ]),
        ),
      ],
    );
  }
}
