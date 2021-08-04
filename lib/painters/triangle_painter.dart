import 'package:flutter/material.dart';

class TrianglePainter extends CustomPainter {
  final Color fillColor;
  int da5t;

  TrianglePainter({
    required this.fillColor,required this.da5t
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = fillColor
      ..style = PaintingStyle.fill;

    if(da5t==0){
      canvas.drawPath(getTrianglePathda5t1(70, 70), paint);
    }else if(da5t==1){
      canvas.drawPath(getTrianglePath(size.width, size.height), paint);
    }else if(da5t==2){
      canvas.drawPath(getTrianglePathda5t2(70, 70), paint);
    }
  }

  Path getTrianglePath(double x, double y) {
    return Path()
      ..moveTo(0, y)
      ..lineTo(x / 2, 0)
      ..lineTo(x, y)
      ..lineTo(0, y);
  }
  Path getTrianglePathda5t1(double x, double y) {
    return Path()
      ..moveTo(0, y)
      ..lineTo(0, y)
      ..lineTo(x, y/2)
      ..lineTo(0, 0);
  }
  Path getTrianglePathda5t2(double x, double y) {
    return Path()
      ..moveTo(0, y/2)
      ..lineTo(0, y/2)
      ..lineTo(x, y)
      ..lineTo(x, 0);
  }

  @override
  bool shouldRepaint(TrianglePainter oldDelegate) {
    return true;
  }
}