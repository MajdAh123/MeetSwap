import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetswap/App/Chat/Controllers/ChatController.dart';
import 'package:meetswap/Constant/ImagesPath.dart';

import '../../../Constant/Size.dart';

class EmptyChatPersonView extends GetView<ChatController> {
  const EmptyChatPersonView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
              onTap: () {
                controller.isEmptyView.value = false;
              },
              child: Image.asset(AppImagesPath.emptyChatImage)),
          AppSize.sizedBox20,
          Text(
            "Your chat will appear here",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
