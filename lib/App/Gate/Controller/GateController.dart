import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:get/get.dart';
import 'package:meetswap/App/Home/Controller/homePageController.dart';

class GateController extends GetxController with SingleGetTickerProviderMixin {
  var cardSwiperController = CardSwiperController().obs;
  var countDownController = CountDownController().obs;
  RxInt durationSwaping = 5.obs;
  RxBool isCardView = true.obs;

  void changeCard() {
    if (Get.find<HomePageController>().currentPageIndex.value == 2 &&
        isCardView.isTrue) {
      cardSwiperController.value.swipe(CardSwiperDirection.left);
    }
  }

  bool resetCountDown() {
    countDownController.value.restart();
    return true;
  }

  var animationController;

  // final GateController gateController = Get.find<GateController>();

  void changeViewing() {
    isCardView.value = !isCardView.value;
    if (isCardView.value) {
      animationController.dispose();
      animationController = null;
      cardSwiperController = CardSwiperController().obs;
    } else {
      animationController =
          AnimationController(vsync: this, duration: Duration(seconds: 2))
            ..repeat();
      cardSwiperController.value.dispose();

      // countDownController.value.reset();
      // countDownController = ;
    }
  }

  // void changeViewing() {
  //   if (isCardView.value) {
  //     isCardView.value = false;
  //     animationController.dispose();
  //     animationController = null;
  //   } else {
  //     isCardView.value = true;
  //     if (animationController != null) {
  //       animationController!.dispose();
  //     }
  //     animationController =
  //         AnimationController(vsync: this, duration: Duration(seconds: 2))
  //           ..repeat();
  //   }
  // }

  @override
  void onInit() {
    changeViewing();
    // cardSwiperController.value.swipe(CardSwiperDirection.left);
    // cardSwiperController.
    // TODO: implement onInit
    super.onInit();
  }
}
