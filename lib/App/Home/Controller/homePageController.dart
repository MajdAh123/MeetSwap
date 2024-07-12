import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:get/get.dart';
import 'package:meetswap/App/Gate/Controller/GateController.dart';
import 'package:meetswap/App/Interestes/Controller/InterestsController.dart';
import 'package:meetswap/App/Lobby/Controller/LobbyController.dart';

import '../../Nationality/Controller/NationalityController.dart';

class HomePageController extends GetxController {
  RxInt currentPageIndex = 2.obs;
  RxInt previousPageIndex = 2.obs;
  void setPageIndex(int index) {
    previousPageIndex.value = currentPageIndex.value;
    currentPageIndex.value = index;

    if (index != 2 && Get.find<GateController>().isCardView.value) {
      Get.find<GateController>().cardSwiperController.value.dispose();
    }
    if (index == 2 && Get.find<GateController>().isCardView.value) {
      Get.find<GateController>().cardSwiperController =
          CardSwiperController().obs;
    }
    //  else {
    //   // Get.find<GateController>().changeViewing();
    // }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
