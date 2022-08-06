import 'package:booking_movie_ticket/app/common/utils/value/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DotStatus extends StatelessWidget {
  const DotStatus({
    Key? key,
    required this.status,
    required this.color,
  }) : super(key: key);

  final String status;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 10.sp,
      children: [
        Container(
          width: 10.sp,
          height: 10.sp,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        Text(
          status,
          style: AppTextStyle.st15400.copyWith(
            color: const Color.fromRGBO(255, 255, 255, 0.87),
          ),
        ),
      ],
    );
  }
}
