library circle_nav_bar;

import 'package:flutter/material.dart';

class CircleNavBar extends StatefulWidget {
  const CircleNavBar({
    Key? key,
    required this.initIndex,
    required this.onChanged,
    this.tabCurve = Curves.linearToEaseOut,
    this.iconCurve = Curves.bounceOut,
    this.tabDurationMillSec = 1000,
    this.iconDurationMillSec = 500,
    required this.activeIcons,
    required this.inactiveIcons,
    required this.height,
    required this.circleWidth,
    required this.color,
    this.padding = EdgeInsets.zero,
    this.cornerRadius = BorderRadius.zero,
    this.shadowColor = Colors.white,
    this.elevation = 0,
    this.gradient,
  })  : assert(circleWidth <= height, "circleWidth <= height"),
        assert(activeIcons.length == inactiveIcons.length,
            "activeIcons.length and inactiveIcons.length must be equal!"),
        assert(
            activeIcons.length > initIndex, "activeIcons.length > initIndex"),
        super(key: key);

  final double height;

  final double circleWidth;

  final Color color;

  final List<Widget> activeIcons;

  final List<Widget> inactiveIcons;

  final EdgeInsets padding;

  final BorderRadius cornerRadius;

  final Color shadowColor;

  final double elevation;

  final Gradient? gradient;

  final int initIndex;

  final Curve tabCurve;

  final Curve iconCurve;

  final int tabDurationMillSec;

  final int iconDurationMillSec;

  final Function(int v) onChanged;

  @override
  State<StatefulWidget> createState() => _CircleNavBarState();
}

class _CircleNavBarState extends State<CircleNavBar>
    with TickerProviderStateMixin {
  late AnimationController tabAc = AnimationController(
      vsync: this, duration: Duration(milliseconds: widget.tabDurationMillSec))
    ..addListener(() => setState(() {}))
    ..value = getPosition(widget.initIndex);

  late AnimationController activeIconAc = AnimationController(
      vsync: this, duration: Duration(milliseconds: widget.iconDurationMillSec))
    ..addListener(() => setState(() {}))
    ..value = 1;

  late int _index = widget.initIndex;
  int get index => _index;
  set index(int v) {
    _index = v;
    tabAc.stop();
    tabAc.animateTo(getPosition(v), curve: widget.tabCurve);
    activeIconAc.reset();
    activeIconAc.animateTo(1, curve: widget.iconCurve);

    widget.onChanged(v);
    setState(() {});
  }

  double getPosition(int i) {
    int itemCnt = widget.activeIcons.length;
    return i / itemCnt + (1 / itemCnt) / 2;
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: widget.padding,
      width: double.infinity,
      height: widget.height,
      child: Column(
        children: [
          CustomPaint(
            child: SizedBox(
              height: widget.height,
              width: double.infinity,
              child: Stack(
                children: [
                  Row(
                    children: widget.inactiveIcons.map((e) {
                      int currentIndex = widget.inactiveIcons.indexOf(e);
                      return Expanded(
                          child: GestureDetector(
                        onTap: () => index = currentIndex,
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          color: Colors.transparent,
                          alignment: Alignment.center,
                          child: index == currentIndex ? null : e,
                        ),
                      ));
                    }).toList(),
                  ),
                  Positioned(
                      left: tabAc.value * deviceWidth -
                          widget.circleWidth / 2 -
                          tabAc.value *
                              (widget.padding.left + widget.padding.right),
                      child: Transform.scale(
                        scale: activeIconAc.value,
                        child: Container(
                          width: widget.circleWidth,
                          height: widget.circleWidth,
                          transform: Matrix4.translationValues(
                              0,
                              -(widget.circleWidth * 0.5) +
                                  _CircleBottomPainter.getMiniRadius(
                                      widget.circleWidth) -
                                  widget.circleWidth *
                                      0.5 *
                                      (1 - activeIconAc.value),
                              0),
                          // color: Colors.amber,
                          child: widget.activeIcons[index],
                        ),
                      )),
                ],
              ),
            ),
            painter: _CircleBottomPainter(
              iconWidth: widget.circleWidth,
              color: widget.color,
              xOffsetPercent: tabAc.value,
              boxRadius: widget.cornerRadius,
              shadowColor: widget.shadowColor,
              elevation: widget.elevation,
              gradient: widget.gradient,
            ),
          ),
        ],
      ),
    );
  }
}

class _CircleBottomPainter extends CustomPainter {
  _CircleBottomPainter({
    required this.iconWidth,
    required this.color,
    required this.xOffsetPercent,
    required this.boxRadius,
    required this.shadowColor,
    required this.elevation,
    this.gradient,
  });

  final Color color;
  final double iconWidth;
  final double xOffsetPercent;
  final BorderRadius boxRadius;
  final Color shadowColor;
  final double elevation;
  final Gradient? gradient;

  static double getR(double circleWidth) {
    return circleWidth / 2 * 1.2;
  }

  static double getMiniRadius(double circleWidth) {
    return getR(circleWidth) * 0.3;
  }

  static double convertRadiusToSigma(double radius) {
    return radius * 0.57735 + 0.5;
  }

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();

    Paint paint = Paint();
    final w = size.width;
    final h = size.height;
    final r = getR(iconWidth);
    final miniRadius = getMiniRadius(iconWidth);
    final x = xOffsetPercent * w;
    final firstX = x - r;
    final secontX = x + r;

    path.moveTo(0, 0 + boxRadius.topLeft.y);
    path.quadraticBezierTo(0, 0, boxRadius.topLeft.x, 0);
    path.lineTo(firstX - miniRadius, 0);
    path.quadraticBezierTo(firstX, 0, firstX, miniRadius);

    path.arcToPoint(
      Offset(secontX, miniRadius),
      radius: Radius.circular(r),
      clockwise: false,
    );

    path.quadraticBezierTo(secontX, 0, secontX + miniRadius, 0);

    path.lineTo(w - boxRadius.topRight.x, 0);
    path.quadraticBezierTo(w, 0, w, boxRadius.topRight.y);

    path.lineTo(w, h - boxRadius.bottomRight.y);
    path.quadraticBezierTo(w, h, w - boxRadius.bottomRight.x, h);

    path.lineTo(boxRadius.bottomLeft.x, h);
    path.quadraticBezierTo(0, h, 0, h - boxRadius.bottomLeft.y);

    path.close();

    paint.color = color;

    if (gradient != null) {
      Rect shaderRect =
          Rect.fromCircle(center: Offset(w / 2, h / 2), radius: 180.0);
      paint.shader = gradient!.createShader(shaderRect);
    }

    canvas.drawPath(
        path,
        Paint()
          ..color = shadowColor
          ..maskFilter = MaskFilter.blur(
              BlurStyle.normal, convertRadiusToSigma(elevation)));

    canvas.drawCircle(
        Offset(x, miniRadius),
        iconWidth / 2,
        Paint()
          ..color = shadowColor
          ..maskFilter = MaskFilter.blur(
              BlurStyle.normal, convertRadiusToSigma(elevation)));

    canvas.drawPath(path, paint);

    canvas.drawCircle(Offset(x, miniRadius), iconWidth / 2, paint);
  }

  @override
  bool shouldRepaint(_CircleBottomPainter oldDelegate) => oldDelegate != this;
}
