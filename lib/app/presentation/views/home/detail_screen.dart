import 'dart:ui';

import 'package:booking_movie_ticket/app/common/utils/value/styles/app_text_style.dart';
import 'package:booking_movie_ticket/app/presentation/views/home/widgets/body_home.dart';
import 'package:booking_movie_ticket/app/widgets/background_color_position.dart';
import 'package:booking_movie_ticket/app/widgets/time_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_like_css/gradient_like_css.dart';
import 'package:rolling_bottom_bar/rolling_bottom_bar.dart';
import 'package:rolling_bottom_bar/rolling_bottom_bar_item.dart';
import '../../../widgets/date_time.dart';
import '../../../widgets/icon_app.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);
  static const List<Map<String, String>> _fakeData = [
    {
      "index": "1",
      "title": "Doctor Strange",
      "title2": "in the Multiverse of Madness",
      "content":
          "Dr. Stephen Strange casts a forbidden spell that opens the doorway to the multiverse, including alternate versions of... read more"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: linearGradient(170, ['#2e1371 2.71%', '#130b2b 97.75%']),
      ),
      child: Scaffold(
          extendBodyBehindAppBar: true,
          extendBody: true,
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: Colors.transparent,
          ),
          backgroundColor: const Color.fromARGB(255, 23, 12, 53),
          body: Stack(
            children: <Widget>[
              Container(
                width: 389.sp,
                height: 557.11.sp,
                foregroundDecoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 23, 12, 53),
                      Colors.transparent
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    stops: [0, 0.7],
                  ),
                ),
                padding: EdgeInsets.only(left: 1.sp, top: 0.sp),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/imgDetail.jpeg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                  top: 55.sp,
                  left: 20.sp,
                  right: 20.sp,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      UnicornOutlineButton(
                        strokeWidth: 1,
                        radius: 40.sp,
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromRGBO(96, 255, 202, 1),
                            Color.fromRGBO(96, 255, 202, 0)
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                      UnicornOutlineButton(
                        strokeWidth: 1,
                        radius: 40.sp,
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromRGBO(96, 255, 202, 1),
                            Color.fromRGBO(96, 255, 202, 0)
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        child: const Icon(
                          Icons.more_vert,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  )),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Center(
                      child: Text(_fakeData[0]['title'].toString(),
                          style: AppTextStyle.st20700),
                    ),
                    Center(
                      child: Text(_fakeData[0]['title2'].toString(),
                          style: AppTextStyle.st14700),
                    ),
                    SizedBox(
                      height: 30.sp,
                    ),
                    Center(
                      child: Text(
                        _fakeData[0]['content'].toString(),
                        style: AppTextStyle.st15500,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 30.sp,
                    ),
                    Center(
                      child: Text(
                        "Select date and time",
                        style: AppTextStyle.st17500,
                      ),
                    ),
                    SizedBox(
                      height: 30.sp,
                    ),
                    Container(
                        height: 90.sp,
                        width: 350.sp,
                        child: const DateTimeBody()),
                    SizedBox(
                      height: 30.sp,
                    ),
                    Container(
                        height: 40.sp,
                        width: 350.sp,
                        child: const TimeButton()),
                    SizedBox(
                      height: 30.sp,
                    ),
                    Container(
                      height: 60.sp,
                      width: 350.sp,
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color.fromRGBO(182, 17, 107, 1),
                              Color.fromRGBO(59, 21, 120, 1),
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.circular(20.sp)),
                      child: Center(
                        child: Text(
                          "Reservation",
                          style: AppTextStyle.st17500,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
