import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetswap/App/Nationality/Controller/NationalityController.dart';
import 'package:meetswap/App/Nationality/View/NationalityView.dart';
import 'package:meetswap/App/Profile/Controller/profileController.dart';
import 'package:meetswap/App/SignUp/Components/RingingWidget.dart';
import 'package:meetswap/App/Widgets/AnimateBorderWidget.dart';
import 'package:meetswap/App/Widgets/CustomeAppBar.dart';
import 'package:meetswap/App/Widgets/SelectImageBottomSheet.dart';
import 'package:meetswap/App/Widgets/TextFieldCustome.dart';
import 'package:meetswap/App/Widgets/YallowBtn.dart';
import 'package:meetswap/App/Widgets/backgroundWidget.dart';
import 'package:meetswap/Constant/Colors.dart';
import 'package:meetswap/Constant/ImagesPath.dart';
import 'package:meetswap/Constant/Size.dart';

class EditProfileView extends GetView<ProfileController> {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomeAppBar(
                title: "Profile",
              ),
              AppSize.sizedBox20,
              Obx(
                () => Stack(
                  children: [
                    RingingAnimationWidget(
                        size_: const Size(170, 170),
                        widget_: controller.userPhoto.value.path == ""
                            ? Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: SizedBox(
                                  child: Image.asset(
                                    AppImagesPath.userPhoto,
                                  ),
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(200),
                                      image: DecorationImage(
                                          image: FileImage(
                                              controller.userPhoto.value),
                                          fit: BoxFit.cover)),
                                ),
                              )),
                    Positioned(
                      bottom: 25,
                      right: 150,
                      child: GestureDetector(
                        onTap: () {
                          // Get.put(BlurController()).startBlurAnimation();

                          Get.bottomSheet(SelectImageBottomSheet(
                            controller: controller,
                          ));
                        },
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: AppColor.yallow,
                          child: Center(
                            child: Image.asset(
                              AppImagesPath.editIcon,
                              width: 20,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              AppSize.sizedBox10,
              TextFieldCustomeWidget(
                controller: controller.userName.value,
                title: "Your Username",
                hint: "Username",
                widget: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Image.asset(AppImagesPath.emailAddressSign),
                ),
              ),
              // AppSize.sizedBox20,
              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  "You can only change your username once every 7 days.",
                  style: TextStyle(fontSize: 11, color: Colors.black38),
                ),
              ),
              AppSize.sizedBox10,
              Padding(
                padding: const EdgeInsets.all(AppSize.paddingElements12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Choose your gender",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    AppSize.sizedBox5,
                    Obx(
                      () => AnimatedBorderWidget(
                        child: AnimatedToggleSwitch<int>.size(
                          // textDirection: TextDirection.rtl,
                          current: controller.userGander.value,
                          height: 50,
                          values: const [
                            0,
                            1,
                          ],
                          iconOpacity: 0.99,
                          indicatorSize: Size.fromWidth(AppSize.width * 0.5),
                          iconBuilder: (value) => [
                            const Text(
                              "Male",
                              style: TextStyle(fontSize: 11),
                            ),
                            const Text(
                              "Female",
                              style: TextStyle(fontSize: 11),
                            ),
                          ][value],
                          borderWidth: 0.0,
                          iconAnimationType: AnimationType.onHover,
                          style: ToggleStyle(
                            indicatorColor: AppColor.white,
                            backgroundColor: AppColor.white.withOpacity(0.5),
                            borderColor: Colors.transparent,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          onChanged: (i) => controller.userGander.value = i,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              AppSize.sizedBox5,
              Obx(
                () => TextFieldCustomeWidget(
                  controller: controller.userDOBTextField.value,
                  title: "Choose your birthday",
                  hint: "DOB",
                  readOnly: true,
                  suffixIcon: const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: AppColor.primaryColor,
                  ),
                  onTap: () => controller.selectDOBBottom(),
                  widget: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Image.asset(
                      AppImagesPath.calanderIcon,
                      width: 25,
                    ),
                  ),
                ),
              ),
              AppSize.sizedBox5,
              TextFieldCustomeWidget(
                  controller: controller.userNationalty.value,
                  title: "Choose your nationality",
                  readOnly: true,
                  onTap: () {
                    Get.to(
                      () => NationalityView(
                        onTap: () {
                          var country = Get.find<NationalityController>()
                              .selectedNationlity
                              .value;
                          controller.userNationalty.value.text =
                              "${country.flagEmoji}  ${country.isoShortName}";
                          Get.find<NationalityController>()
                              .saveSelectedCountry();
                          Get.back();
                        },
                      ),
                      transition: Transition
                          .rightToLeftWithFade, // Specify the transition here
                      duration: const Duration(milliseconds: 500),
                    );
                  },
                  suffixIcon: const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: AppColor.primaryColor,
                  ),
                  hint: "Nationality"),
              CustomeBtn(onTap: () {}, title: "Save")
            ],
          ),
        )),
      ),
    );
  }
}
