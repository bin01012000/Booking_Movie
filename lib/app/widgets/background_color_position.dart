import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BackgroundColorPosition extends StatelessWidget {
  const BackgroundColorPosition({
    Key? key,
    required this.bgColor,
  }) : super(key: key);
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      width: 250.sp,
      height: 250.sp,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: bgColor,
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
    );
  }
}
