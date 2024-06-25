import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetswap/App/SignUp/Controller/SignUpController.dart';
import 'package:meetswap/App/SignUp/Models/InterestsModel.dart';
import 'package:meetswap/Constant/Colors.dart';
import 'package:meetswap/Constant/Size.dart';

class InterstesView extends GetView<SignUpController> {
  const InterstesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppSize.sizedBox20,
        AppSize.sizedBox20,
        Text(
          'What are your interests?',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        // AppSize.sizedBox20,
        Obx(
          () => Expanded(
            child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSize.paddingElements12),
                child: GridView(
                    // itemCount: InterestsModel.interestsList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                    children: [
                      for (InterestsModel interestsModel
                          in InterestsModel.interestsList)
                        GestureDetector(
                          onTap: () =>
                              controller.handelAddInterstes(interestsModel.id),
                          child: Container(
                            margin:
                                EdgeInsets.all(AppSize.paddingElements12 / 2),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: controller.addedInterestes
                                            .contains(interestsModel.id)
                                        ? AppColor.teal
                                        : Colors.transparent,
                                    width: 2),
                                borderRadius: BorderRadius.circular(20),
                                color: Theme.of(context).cardColor),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(interestsModel.imagePath),
                                AppSize.sizedBox10,
                                Text(
                                  interestsModel.name,
                                  style: Theme.of(context).textTheme.titleSmall,
                                )
                              ],
                            ),
                          ),
                        ),
                      SizedBox(
                        height: 2,
                      )
                    ])),
          ),
        )
      ],
    );
  }
}
