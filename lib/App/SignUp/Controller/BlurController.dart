import 'package:get/get.dart';
import 'package:flutter/material.dart';

class BlurController extends GetxController with SingleGetTickerProviderMixin {
  late AnimationController _animationController;
  late Animation<double> _blurAnimation;
  late Animation<double> _radiusAnimation;

  Animation<double> get blurAnimation => _blurAnimation;
  Animation<double> get radiusAnimation => _radiusAnimation;

  @override
  void onInit() {
    super.onInit();
    // resetController();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _blurAnimation =
        Tween<double>(begin: 0, end: 10).animate(_animationController)
          ..addListener(() {
            update();
          });
    _radiusAnimation =
        Tween<double>(begin: 0, end: 1).animate(_animationController)
          ..addListener(() {
            update();
          });
  }

  void resetController() {
    _animationController.reset();
    update();
  }

  void startBlurAnimation() {
    _animationController.forward(from: 0);
  }

  @override
  void onClose() {
    Future.delayed(Duration(seconds: 1))
        .then((vaue) => _animationController.dispose());

    super.onClose();
  }
}
