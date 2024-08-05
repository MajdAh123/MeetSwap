import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetswap/App/SignUp/Controller/SignUpController.dart';
import 'package:meetswap/Constant/Colors.dart';
import 'package:meetswap/Constant/ImagesPath.dart';
import 'package:meetswap/Constant/Size.dart';

class GanderAndDOBView extends GetView<SignUpController> {
  const GanderAndDOBView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AppSize.sizedBox20,
          AppSize.sizedBox20,
          Text(
            'Choose your \ngender and birthday',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          AppSize.sizedBox20,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => controller.changeGanderToMale(),
                child: Stack(
                  children: [
                    Image.asset(controller.isMale.isTrue
                        ? AppImagesPath.activeMale
                        : AppImagesPath.anActiveMale),
                    Positioned.fill(
                        child:
                            Center(child: Image.asset(AppImagesPath.maleIcon)))
                  ],
                ),
              ),
              AppSize.sizedBox20,
              GestureDetector(
                onTap: () => controller.changeGanderToFemale(),
                child: Stack(
                  children: [
                    Image.asset(controller.isMale.isTrue
                        ? AppImagesPath.anActiveFemale
                        : AppImagesPath.activeFemale),
                    Positioned.fill(
                        child: Image.asset(AppImagesPath.femaleIcon)),
                  ],
                ),
              ),
            ],
          ),
          // Image.asset(name)
          AppSize.sizedBox20,
          AppSize.sizedBox20,
          // AppSize.sizedBox20,
          Expanded(
            child: CupertinoTheme(
              data: const CupertinoThemeData(
                textTheme: CupertinoTextThemeData(
                  // actionTextStyle: TextStyle(color: AppColor.blue),
                  // textStyle: TextStyle(color: AppColor.blue),
                  // primaryColor: AppColor.blue,

                  dateTimePickerTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                initialDateTime: controller.userDOB.value,
                minimumYear: 1900,
                maximumYear: controller.maxData.value,
                onDateTimeChanged: (DateTime newDateTime) {
                  // setState(() {
                  controller.userDOB.value = newDateTime;
                  // });
                },
              ),
            ),
          ),
          // SizedBox(
          //   height: 250,
          //   child: ScrollDatePicker(

          //     indicator: Container(
          //       color: Colors.transparent,
          //       width: 50,
          //       height: 20,
          //     ),
          //     options: DatePickerOptions(

          //       // backgroundColor: Colors.transparent,
          //       isLoop: true,
          //     ),
          //     scrollViewOptions: DatePickerScrollViewOptions(

          //     ),
          //     selectedDate: DateTime.now(),
          //     locale: Locale('en'),
          //     onDateTimeChanged: (DateTime value) {
          //       // setState(() {
          //       //   _selectedDate = value;
          //       // });
          //     },
          //   ),
          // ),
          AppSize.sizedBox20,
          AppSize.sizedBox20,
        ],
      ),
    );
  }
}
