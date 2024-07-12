import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetswap/App/Home/Controller/homePageController.dart';
import 'package:meetswap/App/Lobby/Controller/LobbyController.dart';
import 'package:meetswap/App/Lobby/View/FriendProfile/FriendProfileView.dart';
import 'package:meetswap/Constant/Colors.dart';
import 'package:meetswap/Constant/Size.dart';
import '../../../../Constant/ImagesPath.dart';

class LobbyCardsView extends StatefulWidget {
  const LobbyCardsView({super.key});

  @override
  State<LobbyCardsView> createState() => _LobbyCardsViewState();
}

class _LobbyCardsViewState extends State<LobbyCardsView> {
  final controller = Get.find<LobbyController>();
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 1)).then((value) {
      if (Get.find<HomePageController>().currentPageIndex.value == 1) {
        controller.showChatRequst();
      }
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView(
        // itemCount: 15,
        padding:
            const EdgeInsets.symmetric(horizontal: AppSize.paddingElements12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 160,
            crossAxisCount: 3,
            childAspectRatio: 0.7,
            mainAxisSpacing: 0,
            crossAxisSpacing: 20),
        children: [
          for (int index = 0; index < 15; index++)
            Stack(
              children: [
                Column(
                  children: [
                    AppSize.sizedBox20,
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          // Get.to(
                          //   () => const FreindProfileView(),
                          //   transition: Transition
                          //       .rightToLeftWithFade, // Specify the transition here
                          //   duration: const Duration(milliseconds: 500),
                          // );
                          Get.bottomSheet(
                              FreindProfileView(
                                isrequest: index == 4,
                              ),
                              isScrollControlled: true);
                        },
                        child: Container(
                          // height: 140,
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppSize.paddingElements12 * 0.8,
                              vertical: AppSize.paddingElements12 * 0.8),
                          // height: 300,
                          decoration: BoxDecoration(
                            // color: Colors.red,
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: AssetImage(
                                    AppImagesPath.backgroundGateCard),
                                fit: BoxFit.cover),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Row(
                                children: [
                                  Text(
                                    "Anne,",
                                    style: TextStyle(
                                        shadows: [
                                          BoxShadow(
                                              color: Colors.black,
                                              offset: Offset(2, 1),
                                              blurRadius: 1)
                                        ],
                                        fontWeight: FontWeight.w700,
                                        color: AppColor.white),
                                  ),
                                  AppSize.sizedBox5,
                                  Text(
                                    "25",
                                    style: TextStyle(shadows: [
                                      BoxShadow(
                                          color: Colors.black,
                                          offset: Offset(2, 1),
                                          blurRadius: 1)
                                    ], color: AppColor.white),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 120,
                                height: 20,
                                child: Stack(
                                  children: [
                                    for (int i = 0; i < 3; i++)
                                      Positioned(
                                        left: i * 18,
                                        child: CircleAvatar(
                                          radius: 10,
                                          backgroundColor:
                                              AppColor.white.withOpacity(0.5),
                                          child: Center(
                                            child: i == 2
                                                ? Text(
                                                    "+2",
                                                    style: TextStyle(
                                                        fontSize: 8,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: AppColor.white),
                                                  )
                                                : Image.asset(
                                                    [
                                                      AppImagesPath
                                                          .photographyIcon,
                                                      AppImagesPath.musicIcon
                                                    ][i],
                                                    width: 10,
                                                    height: 10,
                                                  ),
                                          ),
                                        ),
                                      )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    // if ([14, 13, 12].contains(index))
                    //   SizedBox(
                    //     height: 50,
                    //   )
                  ],
                ),
                if ([0, 3, 4].contains(index))
                  Stack(
                    children: [
                      Image.asset(AppImagesPath.popUpLobbyCard),
                      Positioned.fill(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "View group ${index == 4 ? "request" : "invite"}",
                                style: TextStyle(fontSize: 9.5),
                              ),
                              AppSize.sizedBox10
                            ],
                          ),
                        ),
                      )
                    ],
                  )
              ],
            ),
          AppSize.sizedBox5
        ],
      ),
    );
  }
}
