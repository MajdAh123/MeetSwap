import 'package:flutter/material.dart';

import '../../Constant/Colors.dart';

class AnimatedBorderWidget extends StatefulWidget {
  const AnimatedBorderWidget({super.key, required this.child});
  final Widget child;
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
                ColorTween(begin: AppColor.white, end: AppColor.borderColor)
                        .lerp(_controller.value) ??
                    AppColor.white,
                ColorTween(begin: AppColor.borderColor, end: AppColor.white)
                        .lerp(_controller.value) ??
                    AppColor.borderColor,
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
