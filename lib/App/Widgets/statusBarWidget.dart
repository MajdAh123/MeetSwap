import 'package:flutter/material.dart';
import 'package:meetswap/Constant/ImagesPath.dart';
import 'package:meetswap/Constant/Size.dart';

class StatusBarWidget extends StatelessWidget {
  final int totalSteps;
  final int currentStep;

  const StatusBarWidget(
      {super.key, required this.totalSteps, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalSteps, (index) {
        return Expanded(
          child: index >= 0
              ? Image.asset(
                  index == currentStep
                      ? AppImagesPath.currentIndex
                      : index > currentStep
                          ? AppImagesPath.futureIndex
                          : AppImagesPath.passedIndex,
                  fit: BoxFit.fitWidth,
                )
              : AppSize.sizedBoxEmpty,
        );
      }),
    );
  }
}
