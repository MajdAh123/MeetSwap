import 'package:flutter/material.dart';

import '../../Constant/Colors.dart';
import '../../Constant/ImagesPath.dart';
import '../../Constant/Size.dart';

class InterestsSmallCard extends StatelessWidget {
  const InterestsSmallCard({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(50),
      color: AppColor.white.withOpacity(0.2),
      // height: 40,

      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppSize.paddingElements12 * 0.4,
            vertical: AppSize.paddingElements12 * 0.3),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 12,
              backgroundColor: AppColor.white,
              child: Center(
                child: Image.asset(
                  AppImagesPath.musicIcon,
                  width: 14,
                ),
              ),
            ),
            AppSize.sizedBox10,
            Text(
              title,
              style: TextStyle(
                  color: AppColor.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            ),
            AppSize.sizedBox10,
          ],
        ),
      ),
    );
  }
}
