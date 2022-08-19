import 'package:booking_movie_ticket/app/common/utils/extensions.dart';
import 'package:booking_movie_ticket/app/common/utils/value/styles/app_text_style.dart';
import 'package:booking_movie_ticket/app/presentation/response/response_movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OneContentHome extends StatelessWidget {
  const OneContentHome({Key? key, required this.data, required this.title})
      : super(key: key);
  final ResponseMovie data;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 20.sp,
      children: [
        Text(
          title,
          style: AppTextStyle.st17700,
        ),
        SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Wrap(
            spacing: 20.sp,
            direction: Axis.horizontal,
            children: data.dataMovie!
                .map(
                  (e) => GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () => Navigator.pushNamed(context, '/detail'),
                    child: Image.network(
                      e.imageOfMovie![0].url.toString(),
                      fit: BoxFit.cover,
                      width: 100.sp,
                      height: 130.sp,
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    ).paddingSymmetric(horizontal: 20.sp);
  }
}
