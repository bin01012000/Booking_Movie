import 'package:booking_movie_ticket/app/widgets/unicorn_outline_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OneActiveIconBottomNavbar extends StatelessWidget {
  const OneActiveIconBottomNavbar({
    Key? key,
    required this.svg,
  }) : super(key: key);
  final String svg;
  @override
  Widget build(BuildContext context) {
    return UnicornOutlineButton(
        background: const [],
        gradient: const LinearGradient(
          colors: [
            Color.fromRGBO(96, 255, 202, 1),
            Color.fromRGBO(96, 255, 202, 0)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        height: 60.sp,
        isDateTimeButton: true,
        onPressed: () {},
        radius: 50.sp,
        strokeWidth: 2.sp,
        width: 60.sp,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: SvgPicture.asset(svg, fit: BoxFit.scaleDown),
          ),
        ));
  }
}
