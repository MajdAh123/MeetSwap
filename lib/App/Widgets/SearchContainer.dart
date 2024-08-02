import 'package:flutter/material.dart';
import 'package:meetswap/Constant/Colors.dart';
import 'package:meetswap/Constant/ImagesPath.dart';
import 'package:meetswap/Constant/Size.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer(
      {super.key, required this.onchange, this.hint = "Search"});
  final void Function(String)? onchange;
  final String hint;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSize.paddingElements12),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColor.white.withOpacity(.7)),
        child: TextField(
            cursorHeight: 25,
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 2, horizontal: AppSize.paddingElements12),
                prefixIcon: Image.asset(AppImagesPath.searchIcon),
                hintText: hint,
                hintStyle: TextStyle(
                    fontSize: 15, color: Colors.black.withOpacity(0.5))),
            onChanged: onchange),
      ),
    );
  }
}
