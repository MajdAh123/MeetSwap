import 'package:flutter/material.dart';
import 'package:meetswap/Constant/Size.dart';

import '../../Constant/Colors.dart';

class SeeAllButton extends StatelessWidget {
  const SeeAllButton({super.key, required this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        color: AppColor.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(30),
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: AppSize.paddingElements12 * .3,
              horizontal: AppSize.paddingElements12 * .6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "See All",
                style: TextStyle(
                    color: AppColor.blueBlue,
                    fontSize: 10,
                    fontWeight: FontWeight.w500),
              ),
              AppSize.sizedBox5,
              Icon(
                Icons.arrow_forward_ios,
                size: 9,
                color: AppColor.blueBlue,
              )
            ],
          ),
        ),
      ),
    );
  }
}
