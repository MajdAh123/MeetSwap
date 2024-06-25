import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetswap/App/SignUp/View/CompleteProfile/CompeteProfileScreen.dart';
import 'package:meetswap/App/SignUp/View/DetailsView/InterstesView.dart';
import 'package:meetswap/App/Widgets/YallowBtn.dart';
import 'package:meetswap/Constant/Colors.dart';
import 'package:meetswap/Constant/ImagesPath.dart';
import 'package:meetswap/Constant/Size.dart';

class SimiCompletedView extends StatelessWidget {
  const SimiCompletedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Checkmark
                Expanded(
                  child: SizedBox(
                      // height: AppSize.height * 0.15,
                      ),
                ),
                Container(
                    width: 75,
                    height: 75,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColor.teal,
                    ),
                    child: Image.asset(AppImagesPath.checkIcon)),
                SizedBox(height: 20),
                Expanded(child: SizedBox()),
                // Main text
                Text(
                  'You\'re almost there!',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
                // SizedBox(height: 20),
                // Overlay container
                // SizedBox(
                //   height: AppSize.height * 0.1,
                // ),
                // Container(
                //   width: AppSize.width * 0.85,
                //   decoration: BoxDecoration(
                //       color: AppColor.white.withOpacity(0.2),
                //       borderRadius: BorderRadius.circular(16),
                //       border: Border.all(
                //           color: AppColor.white.withOpacity(0.5), width: 1)),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     children: [
                //       Padding(
                //         padding: EdgeInsets.all(AppSize.paddingElements12 * 2),
                //         child: Column(
                //           crossAxisAlignment: CrossAxisAlignment.center,
                //           children: [
                //             Text(
                //               'Finish setting up the profile',
                //               style: TextStyle(
                //                 fontSize: 18,
                //                 color: AppColor.white,
                //                 fontWeight: FontWeight.w500,
                //               ),
                //             ),
                //             // SizedBox(height: 8),
                //             AppSize.sizedBox5,
                //             Text(
                //               "You're almost there!",
                //               style: TextStyle(
                //                 // fontSize: 16,
                //                 color: AppColor.white,
                //               ),
                //             ),
                //             SizedBox(height: 16),

                //           ],
                //         ),
                //       ),
                //       // Subtext

                //       // SizedBox(height: 16),
                //       // Progress bar

                //       // Buttons
                //       Container(
                //         decoration: BoxDecoration(
                //             border: Border(
                //                 top: BorderSide(
                //                     color: AppColor.white.withOpacity(0.4),
                //                     width: 1))),
                //         child: Row(
                //           // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //           children: [
                //             Expanded(
                //               child: Padding(
                //                 padding: EdgeInsets.all(
                //                     AppSize.paddingElements12 / 2),
                //                 child: TextButton(
                //                   onPressed: () {},
                //                   child: Text(
                //                     'Later',
                //                     style: TextStyle(
                //                         color: AppColor.white.withOpacity(0.8),
                //                         fontSize: 16,
                //                         fontWeight: FontWeight.w500),
                //                   ),
                //                 ),
                //               ),
                //             ),
                //             Container(
                //               color: AppColor.white.withOpacity(0.4),
                //               width: 1,
                //               height: 60,
                //             ),
                //             Expanded(
                //               child: Padding(
                //                 padding: EdgeInsets.all(
                //                     AppSize.paddingElements12 / 2),
                //                 child: TextButton(
                //                   onPressed: () {
                //                     Get.to(() => CompleteProfileScreen());
                //                   },
                //                   child: Text(
                //                     'Add more info',
                //                     style: TextStyle(
                //                         color: AppColor.white.withOpacity(0.8),
                //                         fontSize: 16,
                //                         fontWeight: FontWeight.w700),
                //                   ),
                //                 ),
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                AppSize.sizedBox20,
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppSize.paddingElements12 * 3),
                  child: Row(
                    children: [
                      Text(
                        '80%',
                        style: TextStyle(
                            color: AppColor.white, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: LinearProgressIndicator(
                          minHeight: 4,
                          borderRadius: BorderRadius.circular(20),
                          value: 0.8,
                          backgroundColor: Colors.grey.shade400,
                          color: AppColor.teal,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(child: SizedBox()),
                YallowBtn(
                  onTap: () {
                    Get.to(() => CompleteProfileScreen());
                  },
                  title: "Finsih profile",
                  defultPaddeing: false,
                  padding: EdgeInsets.symmetric(
                      horizontal: AppSize.paddingElements12),
                ),
                YallowBtn(onTap: () {}, title: "Do it later"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
