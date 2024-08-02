import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class BurningEffect extends StatefulWidget {
  const BurningEffect({Key? key, this.isRun = false}) : super(key: key);
  final bool isRun;
  @override
  _BurningEffectState createState() => _BurningEffectState();
}

class _BurningEffectState extends State<BurningEffect> {
  late RiveAnimationController _controller;

  @override
  void initState() {
    super.initState();
    if (widget.isRun) {
      _controller = OneShotAnimation(
        'burn', // Specify the correct animation name
        autoplay: true,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150, // Adjust the size as needed
      height: 150, // Adjust the size as needed
      child: RiveAnimation.asset(
        'assets/fire.riv', // Path to the Rive animation file
        fit: BoxFit.cover,
        // controllers: [_controller],
      ),
    );
  }
}
