import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetswap/App/Gate/Controller/GateController.dart';
import 'package:meetswap/App/Gate/View/GetaPageView.dart';

import 'UserCardView.dart';

class GatePageScreen extends GetView<GateController> {
  const GatePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (Widget child, Animation<double> animation) {
                final inAnimation = Tween<Offset>(
                        begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))
                    .animate(animation);
                final outAnimation = Tween<Offset>(
                        begin: Offset(0.0, 0.0), end: Offset(-1.0, 0.0))
                    .animate(animation);

                if (child.key == ValueKey(controller.isCardView.value)) {
                  return SlideTransition(position: inAnimation, child: child);
                } else {
                  return SlideTransition(position: outAnimation, child: child);
                }
              },
              child: controller.isCardView.isTrue
                  ? UserCardView(key: ValueKey(true))
                  : GatePageView(key: ValueKey(false)),
            ),
          ),
          Container(
            color: Colors.transparent,
            height: 85,
          )
        ],
      ),
    );
    // Obx(
    //   () => controller.isCardView.isTrue ? UserCardView() : GatePageView(),
    // );
  }
}
