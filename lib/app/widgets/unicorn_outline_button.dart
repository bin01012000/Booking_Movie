import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UnicornOutlineButton extends StatefulWidget {
  final _GradientPainter _painter;
  final Widget _child;
  final VoidCallback _callback;
  final double _radius;
  final List<Color> _background;
  final double _width;
  final double _height;
  final bool _isDateTimeButton;

  UnicornOutlineButton(
      {Key? key,
      required double strokeWidth,
      required double radius,
      required Gradient gradient,
      required Widget child,
      required VoidCallback onPressed,
      required List<Color> background,
      required double width,
      required double height,
      required bool isDateTimeButton})
      : _painter = _GradientPainter(
            strokeWidth: strokeWidth, radius: radius, gradient: gradient),
        _child = child,
        _callback = onPressed,
        _radius = radius,
        _background = background,
        _width = width,
        _height = height,
        _isDateTimeButton = isDateTimeButton,
        super(key: key);

  @override
  State<UnicornOutlineButton> createState() => _UnicornOutlineButtonState();
}

class _UnicornOutlineButtonState extends State<UnicornOutlineButton> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: widget._painter,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: widget._callback,
        child: InkWell(
          borderRadius: BorderRadius.circular(widget._radius),
          onTap: widget._callback,
          child: Container(
            clipBehavior: Clip.hardEdge,
            width: widget._width,
            height: widget._height,
            margin: EdgeInsets.only(left: 1.sp, right: 1.sp, top: 1.sp),
            decoration: BoxDecoration(
                gradient: widget._background.isNotEmpty
                    ? LinearGradient(
                        colors: widget._background,
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      )
                    : null,
                color: widget._isDateTimeButton == false
                    ? const Color.fromRGBO(255, 255, 255, 0.3)
                    : null,
                borderRadius: BorderRadius.circular(widget._radius)),
            constraints: BoxConstraints(minWidth: 40.sp, minHeight: 40.sp),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                widget._child,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _GradientPainter extends CustomPainter {
  final Paint _paint = Paint();
  final double radius;
  final double strokeWidth;
  final Gradient gradient;

  _GradientPainter(
      {required this.radius,
      required this.strokeWidth,
      required this.gradient});

  @override
  void paint(Canvas canvas, Size size) {
    // create outer rectangle equals size
    Rect outerRect = Offset.zero & size;
    var outerRRect =
        RRect.fromRectAndRadius(outerRect, Radius.circular(radius));

    // create inner rectangle smaller by strokeWidth
    Rect innerRect = Rect.fromLTWH(strokeWidth, strokeWidth,
        size.width - strokeWidth * 2, size.height - strokeWidth * 2);
    var innerRRect = RRect.fromRectAndRadius(
        innerRect, Radius.circular(radius - strokeWidth));

    // apply gradient shader
    _paint.shader = gradient.createShader(outerRect);

    // create difference between outer and inner paths and draw it
    Path path1 = Path()..addRRect(outerRRect);
    Path path2 = Path()..addRRect(innerRRect);
    var path = Path.combine(PathOperation.difference, path1, path2);
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => oldDelegate != this;
}
