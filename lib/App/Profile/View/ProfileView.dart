import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetswap/App/Interestes/View/InterestesView.dart';
import 'package:meetswap/App/Profile/Bindings/ProfileBindings.dart';
import 'package:meetswap/App/Profile/View/Pages/EditProfileView.dart';
import 'package:meetswap/App/Profile/View/Pages/GreetingView.dart';
import 'package:meetswap/App/Profile/View/Pages/Security&PrivacyView.dart';
import 'package:meetswap/App/Profile/View/Pages/SupportCenterView.dart';
import 'package:meetswap/App/Profile/View/Pages/TermsOfServiceView.dart';
import 'package:meetswap/Constant/Colors.dart';
import 'package:meetswap/Constant/ImagesPath.dart';
import 'package:meetswap/Constant/Size.dart';

import '../Components/OptionProfileCard.dart';
import '../Earning/View/YourEarnings.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSize.paddingElements12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: AppSize.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColor.white.withOpacity(0.7),
            ),
            child: Column(children: [
              Padding(
                padding: EdgeInsets.all(AppSize.paddingElements12),
                child: Row(
                  children: [
                    TweenAnimationBuilder<double>(
                      tween: Tween<double>(
                          begin: 0, end: 0.6), // animate from 0 to 1
                      duration: Duration(seconds: 3), // animation duration
                      builder: (context, value, child) {
                        return Stack(
                          alignment: Alignment.center,
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  width: 70,
                                  height: 70,
                                  child: RotatedBox(
                                    quarterTurns: 2,
                                    child: CircularProgressIndicator(
                                      value:
                                          value, // apply animated value to progress indicator
                                      strokeWidth: 3.0,
                                      // color: Colors.red,
                                      backgroundColor:
                                          Colors.black54.withOpacity(0.1),
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          AppColor.teal),
                                    ),
                                  ),
                                ),
                                AppSize.sizedBox10
                              ],
                            ),
                            Column(
                              children: [
                                CircleAvatar(
                                  radius: 28,
                                  backgroundImage: AssetImage(
                                    AppImagesPath.userBotBarIcon,
                                  ),
                                ),
                                AppSize.sizedBox10
                              ],
                            ),
                            Positioned(
                              bottom: 0,

                              // alignment: Alignment.bottomCenter,
                              child: SizedBox(
                                width: 70,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Material(
                                      borderRadius: BorderRadius.circular(40),
                                      color: AppColor.yallow,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 3, vertical: 1),
                                        child: Text(
                                          '${(value * 100).toInt()}%',
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        );
                      },
                    ),
                    AppSize.sizedBox20,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Annie Alpiana",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                        Text(
                          "@reww23",
                          style: TextStyle(fontSize: 13, color: Colors.black54),
                        ),
                        AppSize.sizedBox10,
                        GestureDetector(
                          onTap: () {
                            Get.to(
                              () => const EditProfileView(),
                              transition: Transition
                                  .rightToLeftWithFade, // Specify the transition here
                              duration: const Duration(milliseconds: 500),
                            );
                          },
                          child: const Row(
                            children: [
                              Text(
                                "Edit Profile",
                                style: TextStyle(
                                    color: AppColor.blue, fontSize: 12),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 10,
                                color: AppColor.blue,
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Divider(
                color: Colors.black12,
                height: 0.5,
              ),
              Padding(
                padding: EdgeInsets.all(AppSize.paddingElements12),
                child: Row(
                  children: [
                    Image.asset(AppImagesPath.flagGateCard),
                    AppSize.sizedBox5,
                    Text("Spain"),
                    Expanded(child: AppSize.sizedBoxEmpty),
                    Image.asset(
                      AppImagesPath.twoUserIcon,
                      width: 15,
                    ),
                    AppSize.sizedBox5,
                    Text("Lobby: 89")
                  ],
                ),
              )
            ]),
          ),
          AppSize.sizedBox20,
          GestureDetector(
            onTap: () {
              Get.to(
                () => const YourEarningsView(),
                binding: ProfileBinding(),
                transition: Transition
                    .rightToLeftWithFade, // Specify the transition here
                duration: const Duration(milliseconds: 500),
              );
            },
            child: Container(
              padding:
                  EdgeInsets.symmetric(horizontal: AppSize.paddingElements12),
              width: AppSize.width,
              height: 55,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AppImagesPath.earnMeetswapCard),
                      fit: BoxFit.fill)),
              child: Row(
                children: [
                  Container(
                    width: 70,
                    height: 55,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage(AppImagesPath.daimonedIcon),
                    )),
                  ),
                  AppSize.sizedBox20,
                  Text("Earn on Meetswap")
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(AppSize.paddingElements12),
            child: Text(
              "PREFERENCES",
              style: TextStyle(fontSize: 16, color: Colors.black45),
            ),
          ),
          OptionProfileCard(
            title: "Interests",
            image: AppImagesPath.heartIconProfile,
            onTap: () {
              Get.to(
                () => InterestsView(
                  subject: "What are your interests?",
                ),
                transition: Transition
                    .rightToLeftWithFade, // Specify the transition here
                duration: const Duration(milliseconds: 500),
              );
            },
          ),
          OptionProfileCard(
            title: "Personal greeting",
            image: AppImagesPath.hiIconProfile,
            onTap: () {
              Get.to(
                () => GreetingViewProfile(),
                transition: Transition
                    .rightToLeftWithFade, // Specify the transition here
                duration: const Duration(milliseconds: 500),
              );
            },
          ),
          OptionProfileCard(
            title: "Media upload quality",
            image: AppImagesPath.hdIconProfile,
            onTap: () {},
          ),
          const Padding(
            padding: EdgeInsets.all(AppSize.paddingElements12),
            child: Text(
              "SETTINGS",
              style: TextStyle(fontSize: 16, color: Colors.black45),
            ),
          ),
          OptionProfileCard(
            title: "Security & Privacy",
            image: AppImagesPath.securityIconProfile,
            onTap: () {
              Get.to(
                () => SecurityPrivacyView(),
                transition: Transition
                    .rightToLeftWithFade, // Specify the transition here
                duration: const Duration(milliseconds: 500),
              );
            },
          ),
          OptionProfileCard(
            title: "Support Centre",
            image: AppImagesPath.supportIconProfile,
            onTap: () {
              Get.to(
                () => SupportCenterView(),
                transition: Transition
                    .rightToLeftWithFade, // Specify the transition here
                duration: const Duration(milliseconds: 500),
              );
            },
          ),
          OptionProfileCard(
            title: "Terms of Service",
            image: AppImagesPath.termsIconProfile,
            onTap: () {
              Get.to(
                () => TermsOfServiceView(),
                transition: Transition
                    .rightToLeftWithFade, // Specify the transition here
                duration: const Duration(milliseconds: 500),
              );
            },
          ),
          Container(
            width: AppSize.width,
            padding: const EdgeInsets.all(AppSize.paddingElements12),
            margin: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColor.white.withOpacity(0.7)),
            child: const Text(
              "  Log Out",
              style: TextStyle(
                  color: AppColor.red,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }
}
