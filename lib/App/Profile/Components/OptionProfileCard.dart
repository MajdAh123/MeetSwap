import 'package:flutter/material.dart';
import 'package:meetswap/Constant/Colors.dart';
import 'package:meetswap/Constant/Size.dart';

class OptionProfileCard extends StatelessWidget {
  const OptionProfileCard(
      {super.key,
      required this.image,
      required this.title,
      required this.onTap});
  final String title;
  final String image;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        width: AppSize.width,
        padding: const EdgeInsets.all(AppSize.paddingElements12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColor.white.withOpacity(0.7)),
        child: Row(
          children: [
            AppSize.sizedBox10,
            Image.asset(
              image,
              width: 20,
            ),
            AppSize.sizedBox10,
            Text(
              title,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
            Expanded(child: AppSize.sizedBoxEmpty),
            Icon(
              Icons.arrow_forward_ios,
              size: 15,
              color: AppColor.blue,
            )
          ],
        ),
      ),
    );
  }
}
