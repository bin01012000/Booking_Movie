import 'package:booking_movie_ticket/app/common/utils/value/styles/app_text_style.dart';

import 'package:booking_movie_ticket/app/presentation/views/seat/seat_screen.dart';
import 'package:booking_movie_ticket/app/widgets/date_time.dart';
import 'package:booking_movie_ticket/app/widgets/raise_button.dart';
import 'package:booking_movie_ticket/app/widgets/time_button.dart';
import 'package:booking_movie_ticket/app/widgets/unicorn_outline_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BodyDetail extends StatelessWidget {
  const BodyDetail({Key? key}) : super(key: key);
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
    return Scaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        backgroundColor: const Color.fromARGB(255, 23, 12, 53),
        body: Stack(
          children: <Widget>[
            Container(
              width: 389.sp,
              height: 557.11.sp,
              foregroundDecoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color.fromARGB(255, 23, 12, 53), Colors.transparent],
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
                top: 70.sp,
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
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      background: const [],
                      height: 44.sp,
                      isDateTimeButton: false,
                      width: 44.sp,
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
                      background: [],
                      height: 44.sp,
                      isDateTimeButton: false,
                      width: 44.sp,
                    ),
                  ],
                )),
            Column(
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
                SizedBox(
                    height: 90.sp, width: 350.sp, child: const DateTimeBody()),
                SizedBox(
                  height: 30.sp,
                ),
                SizedBox(
                    height: 40.sp, width: 350.sp, child: const TimeButton()),
                SizedBox(
                  height: 20.sp,
                ),
                RaisedGradientButton(
                  child: Text('Reservation', style: AppTextStyle.st17500),
                  gradient: const LinearGradient(
                    colors: <Color>[
                      Color.fromRGBO(182, 17, 107, 1),
                      Color.fromRGBO(59, 21, 120, 1),
                    ],
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SeatScreen()));
                  },
                ),
                SizedBox(
                  height: 20.sp,
                ),
              ],
            ),
          ],
        ));
  }
}
