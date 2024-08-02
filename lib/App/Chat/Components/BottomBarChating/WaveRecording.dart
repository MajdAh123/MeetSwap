import 'dart:math';

import 'package:flutter/material.dart';

class SineWavePainter extends CustomPainter {
  final double animationValue;

  SineWavePainter({required this.animationValue});

  @override
  void paint(Canvas canvas, Size size) {
    final double width = size.width;
    final double height = size.height;
    final Paint paint = Paint()
      ..color = Colors.black38
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    final Path path = Path();
// Initialize the starting point outside the loop
    const double startX = 0.0;
    final double startY = height / 4 * sin(startX / 10 + animationValue);
    path.moveTo(startX, startY + height / 2);

    for (double x = startX; x <= width; x++) {
      final double y = height / 4 * sin(x / 10 + animationValue);
      path.lineTo(x, y + height / 2);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class InverseSineWavePainter extends CustomPainter {
  final double animationValue;

  InverseSineWavePainter({required this.animationValue});

  @override
  void paint(Canvas canvas, Size size) {
    final double width = size.width;
    final double height = size.height;
    final Paint paint = Paint()
      ..color = Colors.black38
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    final Path path = Path();
    const double startX = 0.0;
    final double startY =
        height / 4 * -sin(startX / 10 + animationValue); // Inverse sine wave
    path.moveTo(startX, startY + height / 2);

    for (double x = startX; x <= width; x++) {
      final double y =
          height / 4 * -sin(x / 10 + animationValue); // Inverse sine wave
      path.lineTo(x, y + height / 2);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
