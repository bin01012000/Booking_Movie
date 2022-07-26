import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BodyHome extends StatelessWidget {
  const BodyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            left: -250.sp,
            top: 10,
            child: Container(
              constraints: const BoxConstraints.expand(),
              width: 250.sp,
              height: 250.sp,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xff60ffca),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 200, sigmaY: 200),
                child: Container(
                  width: 250.sp,
                  height: 250.sp,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
