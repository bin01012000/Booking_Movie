import 'package:booking_movie_ticket/app/common/utils/value/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OneContentHome extends StatelessWidget {
  const OneContentHome({Key? key, required this.fakeData, required this.title})
      : super(key: key);
  final List<Map<String, String>> fakeData;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.sp),
      child: Wrap(
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
              children: fakeData
                  .map((e) => GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () => Navigator.pushNamed(context, '/detail'),
                      // child: FadeInImage.memoryNetwork(
                      //   image: e["img"].toString(),
                      //   placeholder: kTransparentImage,
                      // ),
                      child: Image.asset(
                        e["img"].toString(),
                        fit: BoxFit.contain,
                        width: 100.sp,
                        height: 130.sp,
                      )))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
