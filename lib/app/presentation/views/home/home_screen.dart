import 'dart:math';

import 'package:booking_movie_ticket/app/common/utils/value/styles/app_text_style.dart';
import 'package:booking_movie_ticket/app/presentation/views/home/widgets/body_home.dart';
import 'package:booking_movie_ticket/app/widgets/unicorn_outline_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradient_like_css/gradient_like_css.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = PageController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Container(
        decoration: BoxDecoration(
          gradient: linearGradient(170, ['#2e1371 2.71%', '#130b2b 97.75%']),
        ),
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            extendBodyBehindAppBar: true,
            extendBody: true,
            appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              backgroundColor: Colors.transparent,
              title: Text(
                "Choose Movie ",
                style: AppTextStyle.st20700,
              ),
            ),
            backgroundColor: Colors.transparent,
            body: const BodyHome(),
            bottomNavigationBar: Container(
              width: 1.sw,
              height: 90.sp,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                gradient: linearGradient(90.03, [
                  '#452495 0.02%',
                  '#4C31A0 27.25%',
                  '#5641AF 55.2%',
                  '#7457B4 69.31%',
                  '#A466CD 83.34%',
                  '#BA61CC 99.96%',
                ]),
              ),
              child: BottomNavigationBar(
                showSelectedLabels: false,
                showUnselectedLabels: false,
                backgroundColor: Colors.transparent,
                elevation: 0,
                type: BottomNavigationBarType.fixed,
                items: [
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset("assets/icons/home.svg"),
                      activeIcon: Transform.translate(
                        offset: Offset(0, -37.sp),
                        child: Container(
                          constraints: BoxConstraints.expand(
                              width: 80.sp, height: 80.sp),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white.withOpacity(0),
                            ),
                            child: UnicornOutlineButton(
                              background: const [],
                              gradient: const LinearGradient(
                                colors: [
                                  Color.fromRGBO(96, 255, 202, 1),
                                  Color.fromRGBO(96, 255, 202, 0)
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                              height: 80.sp,
                              isDateTimeButton: true,
                              onPressed: () {},
                              radius: 50.sp,
                              strokeWidth: 2.sp,
                              width: 80.sp,
                              child: SvgPicture.asset("assets/icons/home.svg"),
                            ),
                          ),
                        ),
                      ),
                      label: ""),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset("assets/icons/address.svg"),
                      label: ""),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset("assets/icons/ticket.svg"),
                      label: ""),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset("assets/icons/menu.svg"),
                      label: ""),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset("assets/icons/user.svg"),
                      label: ""),
                ],
              ),
            )),
      ),
    );
  }
}

class CircleBlurPainter extends CustomPainter {
  CircleBlurPainter({required this.circleWidth, required this.blurSigma});

  double circleWidth;
  double blurSigma;

  @override
  void paint(Canvas canvas, Size size) {
    Paint line = Paint()
      ..color = Colors.lightBlue
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = circleWidth
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, blurSigma);
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);
    canvas.drawCircle(center, radius, line);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
