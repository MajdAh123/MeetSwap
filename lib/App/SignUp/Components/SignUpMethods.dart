import 'package:flutter/material.dart';

import '../../../Constant/Colors.dart';
import '../../../Constant/Size.dart';

class SignUpMethodWidget extends StatelessWidget {
  const SignUpMethodWidget(
      {super.key, required this.image, required this.onTap});
  final String image;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: AppSize.paddingElements12),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(AppSize.paddingElements12),
          decoration: BoxDecoration(
              border: Border.all(color: AppColor.white, width: 1.5),
              borderRadius: BorderRadius.circular(50)),
          child: Image.asset(image),
        ),
      ),
    );
  }
}
