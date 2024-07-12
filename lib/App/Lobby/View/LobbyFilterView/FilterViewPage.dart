import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetswap/App/Interestes/View/InterestesView.dart';
import 'package:meetswap/App/Lobby/Controller/LobbyController.dart';
import 'package:meetswap/App/Nationality/Controller/NationalityController.dart';
import 'package:meetswap/App/Nationality/View/NationalityView.dart';
import 'package:meetswap/App/SignUp/View/DetailsView/InterstesView.dart';
import 'package:meetswap/App/Widgets/AnimateBorderWidget.dart';
import 'package:meetswap/App/Widgets/YallowBtn.dart';
import 'package:meetswap/App/Widgets/backgroundWidget.dart';
import 'package:meetswap/Constant/Colors.dart';
import 'package:meetswap/Constant/Size.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:meetswap/Constant/policy.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class LobbyFilterPage extends GetView<LobbyController> {
  const LobbyFilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BackgroundWidget(
        child: SingleChildScrollView(
          child: Container(
            width: AppSize.width,
            height: AppSize.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppSize.sizedBox20,
                AppSize.sizedBox10,
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
                            child: Icon(Icons.keyboard_arrow_down_outlined),
                          ),
                        ),
                      ),
                      Text(
                        "Filter",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 40,
                      )
                    ],
                  ),
                ),
                AppSize.sizedBox20,
                Padding(
                  padding: const EdgeInsets.all(AppSize.paddingElements12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Choose your gender",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      AppSize.sizedBox5,
                      AnimatedBorderWidget(
                        child: AnimatedToggleSwitch<int>.size(
                          // textDirection: TextDirection.rtl,
                          current: controller.filterGender.value,
                          height: 50,
                          values: const [
                            0,
                            1,
                          ],
                          iconOpacity: 0.2,
                          indicatorSize: Size.fromWidth(AppSize.width * 0.45),
                          iconBuilder: (value) => [
                            Text(
                              "Male",
                            ),
                            Text("Female")
                          ][value],
                          borderWidth: 0.0,
                          iconAnimationType: AnimationType.onHover,
                          style: ToggleStyle(
                            indicatorColor: AppColor.white,
                            backgroundColor: AppColor.white.withOpacity(0.5),
                            borderColor: Colors.transparent,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          onChanged: (i) => controller.filterGender.value = i,
                        ),
                      )
                    ],
                  ),
                ),
                AppSize.sizedBox20,
                Padding(
                  padding:
                      const EdgeInsets.all(AppSize.paddingElements12 * 1.5),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Age",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "${controller.filterStartAge.value.toStringAsFixed(0)}-${controller.filterEndAge.value.toStringAsFixed(0)}",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      AppSize.sizedBox10,
                      SfRangeSliderTheme(
                        data: SfRangeSliderThemeData(
                            activeTrackColor: AppColor.yallow,
                            inactiveTrackColor: AppColor.blue.withOpacity(0.2),
                            thumbColor: AppColor.yallow,
                            thumbRadius: 14,
                            activeTrackHeight: 2,
                            inactiveTrackHeight: 2),
                        child: Transform.scale(
                          scale: 1.1,
                          child: SfRangeSlider(
                            values: SfRangeValues(
                                controller.filterStartAge.value,
                                controller.filterEndAge.value),
                            stepSize: 1,
                            min: AppPolicy.minimumeYear,
                            max: 60,
                            onChanged: (newValue) {
                              controller.filterStartAge.value = newValue.start;
                              controller.filterEndAge.value = newValue.end;
                            },
                            // onChangeStart: (newValue) {
                            //   setState(() {
                            //     onSliderStartColor = AppColors.accentColor;
                            //   });
                            // },
                            // onChangeEnd: (newValue) {
                            //   setState(() {
                            //     onSliderStartColor = AppColors.mainYellow;
                            //   });
                            // },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                FilterOption(
                  title: "Nationality",
                  onTap: () {
                    // Get.put(NationalityController());

                    Get.to(
                      () => NationalityView(),
                      transition: Transition
                          .rightToLeftWithFade, // Specify the transition here
                      duration: const Duration(milliseconds: 500),
                    );
                  },
                ),
                FilterOption(
                  title: "Location",
                  onTap: () {},
                ),
                FilterOption(
                  title: "Interest",
                  onTap: () {
                    Get.to(
                      () => InterestsView(),
                      transition: Transition
                          .rightToLeftWithFade, // Specify the transition here
                      duration: const Duration(milliseconds: 500),
                    );
                  },
                ),
                FilterOption(
                  title: "Common interests",
                  onTap: () {},
                ),
                Expanded(child: AppSize.sizedBoxEmpty),
                Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: CustomeBtn(
                          onTap: () {},
                          defultPaddeing: false,
                          padding:
                              EdgeInsets.only(left: AppSize.paddingElements12),
                          title: "Clear",
                          btnColor: AppColor.white.withOpacity(0.6),
                        )),
                    Expanded(
                        flex: 5,
                        child: CustomeBtn(onTap: () {}, title: "Apply")),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FilterOption extends StatelessWidget {
  const FilterOption({super.key, required this.title, required this.onTap});
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(AppSize.paddingElements12 * 1.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 20,
            )
          ],
        ),
      ),
    );
  }
}
