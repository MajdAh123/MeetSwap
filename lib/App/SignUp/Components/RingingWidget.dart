import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import '../../../Constant/Colors.dart';

class RingingAnimationPainter extends CustomPainter {
  final List<double> ringProgresses;

  RingingAnimationPainter({required this.ringProgresses});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = AppColor.white.withOpacity(0.3)
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    double radius = min(size.width / 2.5, size.height / 2.5);
    double centerX = size.width / 2;
    double centerY = size.height / 2;

    for (double progress in ringProgresses) {
      double currentRadius = radius * (1 + progress);
      double alpha = (1.0 - progress).clamp(0.0, 1.0);
      paint.color = AppColor.white.withOpacity(alpha);
      canvas.drawCircle(Offset(centerX, centerY), currentRadius, paint);

      // Draw intermediate rings
      // double intermediateRadius1 = radius * (1 + progress + 0.15);
      // double intermediateAlpha1 = (1.0 - progress - 0.075).clamp(0.0, 1.0);
      // paint.color = AppColor.white.withOpacity(intermediateAlpha1);
      // canvas.drawCircle(Offset(centerX, centerY), intermediateRadius1, paint);

      // double intermediateRadius2 = radius * (1 + progress + 0.3);
      // double intermediateAlpha2 = (1.0 - progress - 0.15).clamp(0.0, 1.0);
      // paint.color = AppColor.white.withOpacity(intermediateAlpha2);
      // canvas.drawCircle(Offset(centerX, centerY), intermediateRadius2, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class RingingAnimationWidget extends StatefulWidget {
  const RingingAnimationWidget({super.key, required this.widget_});

  final Widget widget_;
  @override
  _RingingAnimationWidgetState createState() => _RingingAnimationWidgetState();
}

class _RingingAnimationWidgetState extends State<RingingAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  List<double> ringProgresses = [];
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..addListener(() {
        setState(() {
          // Update ring progresses
          ringProgresses = ringProgresses.map((progress) {
            return progress + 0.01;
          }).toList();
          ringProgresses.removeWhere((progress) => progress > 1.0);
        });
      });
    _controller.repeat();

    // Add new ring immediately and then every 0.5 seconds
    _timer = Timer.periodic(Duration(milliseconds: 500), (Timer timer) {
      setState(() {
        ringProgresses.add(0.0);
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            painter: RingingAnimationPainter(ringProgresses: ringProgresses),
            size: Size(200, 200), // Set max size to 400x400
          ),
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: widget.widget_,
          ),
        ],
      ),
    );
  }
}
