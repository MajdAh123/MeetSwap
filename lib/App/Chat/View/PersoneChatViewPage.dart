import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetswap/App/Chat/Components/ChatPersoneCard.dart';
import 'package:meetswap/App/Widgets/SearchContainer.dart';
import 'package:meetswap/App/Widgets/backgroundWidget.dart';
import 'package:meetswap/Constant/Size.dart';

class PersoneChatViewPage extends StatelessWidget {
  const PersoneChatViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Scaffold(
        body: Column(
          children: [
            AppSize.sizedBox20,
            AppSize.sizedBox20,
            Row(
              children: [
                AppSize.sizedBox10,
                InkWell(
                    onTap: () => Get.back(),
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      size: 20,
                    )),
                Expanded(child: SearchContainer(onchange: (value) {})),
              ],
            ),
            Expanded(
                child: ListView.builder(
              padding:
                  EdgeInsets.symmetric(horizontal: AppSize.paddingElements12),
              itemBuilder: (context, index) => ChatPersoneCard(),
            ))
          ],
        ),
      ),
    );
  }
}
