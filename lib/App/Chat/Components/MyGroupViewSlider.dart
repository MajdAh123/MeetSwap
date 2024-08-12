import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetswap/App/Chat/Controllers/ChatController.dart';
import 'package:meetswap/App/Widgets/SearchContainer.dart';
import 'package:meetswap/App/Widgets/TitleBetweenArrows.dart';
import 'package:meetswap/Constant/ImagesPath.dart';
import 'package:meetswap/Constant/Size.dart';

import 'GroupOfGroup.dart';

class MyGroupViewSlider extends GetView<ChatController> {
  const MyGroupViewSlider({super.key, required this.model});
  final MyGroupModel model;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppSize.sizedBox5,
        Expanded(
          child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return GroupOfGroupChat(
                count: model.countCard,
                isTraning: model.isTranding,
              );
            },
          ),
        ),
      ],
    );
  }
}

class MyGroupModel {
  final String hint;
  final String title;
  final String image;
  final int countCard;
  final List<bool> isTranding;
  MyGroupModel(
      {required this.hint,
      required this.title,
      required this.image,
      required this.countCard,
      required this.isTranding});
}

List<MyGroupModel> allMyGroupSlids = [
  MyGroupModel(
      hint: 'Search "interest"',
      title: "my groups",
      image: AppImagesPath.dimondIcon,
      countCard: 4,
      isTranding: [false, false, false, false]),
  MyGroupModel(
      hint: 'Search "group"',
      title: "joined groups",
      image: AppImagesPath.pinIcon,
      countCard: 5,
      isTranding: [false, false, false, false, false]),
  MyGroupModel(
      hint: 'Search "people"',
      title: "trending groups",
      image: AppImagesPath.fireIcon,
      countCard: 6,
      isTranding: [true, false, false, false, false, false]),
  MyGroupModel(
      hint: 'Search "interest"',
      title: "nearby groups",
      image: AppImagesPath.locationRedIcon,
      countCard: 3,
      isTranding: [false, false, false]),
];
