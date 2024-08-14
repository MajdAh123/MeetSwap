import 'package:flutter/material.dart';

import '../../Constant/Colors.dart';

class AnimatedBorderWidget extends StatefulWidget {
  const AnimatedBorderWidget(
      {super.key,
      required this.child,
      this.beginColor = AppColor.white,
      this.endColor = AppColor.borderColor});
  final Widget child;
  final Color beginColor;
  final Color endColor;
  @override
  State<AnimatedBorderWidget> createState() => _AnimatedBorderWidgetState();
}

class _AnimatedBorderWidgetState extends State<AnimatedBorderWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          padding: EdgeInsets.all(3), // padding to show the gradient border
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              colors: [
                ColorTween(begin: widget.beginColor, end: widget.endColor)
                        .lerp(_controller.value) ??
                    widget.beginColor,
                ColorTween(begin: widget.endColor, end: widget.beginColor)
                        .lerp(_controller.value) ??
                    widget.endColor,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)
                  // color: focusNode.hasFocus
                  //     ? AppColor.white
                  //     : AppColor.white
                  //         .withOpacity(0.6), // background color of the TextField
                  ),
              child: widget.child),
        );
      },
    );
  }
}
