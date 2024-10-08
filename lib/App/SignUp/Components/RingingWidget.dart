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
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class RingingAnimationWidget extends StatefulWidget {
  const RingingAnimationWidget(
      {super.key, required this.widget_, required this.size_});
  final Size size_;
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
      duration: Duration(milliseconds: 2000), // Increased duration
    )..addListener(() {
        setState(() {
          // Update ring progresses
          ringProgresses = ringProgresses.map((progress) {
            return progress + 0.0025; // Slower increment
          }).toList();
          ringProgresses.removeWhere((progress) => progress > 1.0);
        });
      });
    _controller.repeat();

    // Add new ring immediately and then every 1 second
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      // Increased period
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
            size: widget.size_, // Set max size to 400x400
          ),
          Container(
            width: widget.size_.width,
            height: widget.size_.height,
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
