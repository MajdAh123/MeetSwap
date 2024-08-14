import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetswap/Constant/Colors.dart';
import 'package:meetswap/Constant/Size.dart';

class CustomeAppBar extends StatelessWidget {
  const CustomeAppBar({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSize.paddingElements12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Get.back(),
            child: CircleAvatar(
              radius: 22,
              backgroundColor: AppColor.white.withOpacity(0.6),
              child: const Center(
                child: Icon(
                  Icons.arrow_back_ios_new_outlined,
                  size: 18,
                ),
              ),
            ),
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            width: 40,
          )
        ],
      ),
    );
  }
}
