// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:meetswap/Constant/Colors.dart';
import 'package:meetswap/Constant/Size.dart';

class YallowBtn extends StatelessWidget {
  YallowBtn(
      {super.key,
      required this.onTap,
      this.btnColor = AppColor.yallow,
      this.defultPaddeing = true,
      this.padding,
      required this.title});
  final Color btnColor;
  final void Function()? onTap;
  final String title;
  final bool defultPaddeing;
  EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          defultPaddeing ? EdgeInsets.all(AppSize.paddingElements12) : padding!,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 53,
          width: AppSize.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25), color: btnColor),
          child: Center(
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ),
      ),
    );
  }
}
