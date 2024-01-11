import 'package:flutter/material.dart';

class CirclePainter extends CustomPainter {
  final double circleRadius;

  CirclePainter(this.circleRadius);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;
    canvas.drawCircle(size.center(Offset.zero), circleRadius, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
