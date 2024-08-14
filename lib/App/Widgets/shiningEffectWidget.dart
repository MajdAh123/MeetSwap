import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:meetswap/Constant/ImagesPath.dart';
import 'package:meetswap/Constant/Size.dart';

class ShiningWidget extends StatefulWidget {
  const ShiningWidget(
      {super.key,
      required this.maxSize,
      this.child = AppSize.sizedBoxEmpty,
      this.isDroping = false});
  final double maxSize;
  final Widget child;
  final bool isDroping;
  @override
  _ShiningWidgetState createState() => _ShiningWidgetState();
}

class _ShiningWidgetState extends State<ShiningWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Timer _timer;
  double _opacity = 0.0;
  bool startDrop = false;
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(seconds: 5),
      vsync: this,
    )..repeat(); // Repeats the rotation animation forever
    if (widget.isDroping) {
      Future.delayed(Duration(milliseconds: 500)).then((value) {
        startDrop = true;
        setState(() {});
      });
    } else {
      _startOpacityAnimation();
    }
  }

  void _startOpacityAnimation() {
    _timer = Timer.periodic(Duration(seconds: 2), (timer) {
      setState(() {
        _opacity = _opacity == 1.0 ? 0.0 : 1.0;
      });
    });
  }

  @override
  void dispose() {
    if (!widget.isDroping) {
      _timer.cancel();
    }
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.maxSize,
      width: widget.maxSize,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: TweenAnimationBuilder<double>(
              tween: Tween<double>(
                begin: 0,
                end: widget.maxSize,
              ),
              duration: Duration(seconds: 1),
              builder: (context, size, child) {
                return AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: _controller.value * 2 * pi,
                      child: SizedBox(width: size, height: size, child: child),
                    );
                  },
                  child: Image.asset(AppImagesPath
                      .shainingImage), // Replace with your image path
                );
              },
            ),
          ),
          widget.isDroping
              ? AnimatedPositioned(
                  curve: Curves.easeInOut,
                  left: 80.0,
                  top: startDrop ? 50.0 : -300.0,
                  duration: Duration(seconds: 1),
                  child: Center(
                    child: widget.child,
                  ))
              : Positioned.fill(
                  child: AnimatedOpacity(
                    opacity: _opacity,
                    duration: Duration(seconds: 1),
                    child: Center(
                      child: widget.child,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
