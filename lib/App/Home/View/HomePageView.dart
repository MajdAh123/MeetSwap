import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetswap/App/Home/Controller/homePageController.dart';
import 'package:meetswap/App/Widgets/BottomBarWidget.dart';
import 'package:meetswap/App/Widgets/backgroundWidget.dart';
import 'package:meetswap/Constant/Colors.dart';
import 'package:meetswap/Constant/ImagesPath.dart';
import 'package:meetswap/Constant/Size.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePageView extends GetView<HomePageController> {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        bottomNavigationBar: BottomBarWidget(),
        body: IndexedStack(
          index: controller.currentPageIndex.value,
          children: [
            Container(),
            Container(),
            Container(),
            Container(),
          ],
        ),
      ),
    );
  }
}
