import 'package:booking_movie_ticket/app/common/utils/extensions.dart';
import 'package:booking_movie_ticket/app/common/utils/value/styles/app_text_style.dart';
import 'package:booking_movie_ticket/app/presentation/response/response_movie.dart';
import 'package:booking_movie_ticket/app/widgets/image_network_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OneContentHome extends StatefulWidget {
  const OneContentHome({Key? key, required this.data, required this.title})
      : super(key: key);
  final ResponseMovie data;
  final String title;

  @override
  State<OneContentHome> createState() => _OneContentHomeState();
}

class _OneContentHomeState extends State<OneContentHome> {
  int? idMovie;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 20.sp,
      children: [
        Text(
          widget.title,
          style: AppTextStyle.st20700,
        ),
        SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Wrap(
            spacing: 20.sp,
            direction: Axis.horizontal,
            children: widget.data.dataMovie!
                .map(
                  (e) => GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () => {
                      Navigator.pushNamed(context, '/detail', arguments: e.id),
                    },
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: ImageNetworkCustom(
                                url: e.imageOfMovie!.isNotEmpty
                                    ? e.imageOfMovie![0].url.toString()
                                    : "",
                                width: 140.sp,
                                height: 220.sp,
                              ),
                            ),
                            Positioned(
                              bottom: 7.sp,
                              left: 20.sp,
                              right: 20.sp,
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 3.sp),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(7.sp),
                                ),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.play_arrow_rounded,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        "Trailer",
                                        style: AppTextStyle.st14700,
                                      ),
                                    ],
                                  ).center,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.sp),
                        Container(
                          constraints: BoxConstraints(maxWidth: 140.sp),
                          child: Text(
                            e.name.toString(),
                            style: AppTextStyle.st15700,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
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
