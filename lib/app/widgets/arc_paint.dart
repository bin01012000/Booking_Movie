import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArcPaintPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Center(
        child: Container(
          color: Colors.transparent,
          width: 500.59.sp,
          height: 35.18.sp,
          child: CustomPaint(
            painter: ArcPainter(),
          ),
        ),
      );
}

class ArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Color.fromRGBO(255, 83, 192, 1)
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke;

    final arc2 = Path();
    arc2.moveTo(size.width * 0.2, size.height * 0.8);
    arc2.arcToPoint(
      Offset(size.width * 0.8, size.height * 0.8),
      radius: Radius.circular(350),
    );

    canvas.drawPath(arc2, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
