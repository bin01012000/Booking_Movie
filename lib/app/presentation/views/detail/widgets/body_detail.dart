import 'package:booking_movie_ticket/app/common/utils/value/styles/app_text_style.dart';
import 'package:booking_movie_ticket/app/widgets/date_time.dart';
import 'package:booking_movie_ticket/app/widgets/raise_button.dart';
import 'package:booking_movie_ticket/app/widgets/time_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../widgets/read_more.dart';

class BodyDetail extends StatelessWidget {
  const BodyDetail({Key? key}) : super(key: key);
  static const List<Map<String, String>> _fakeData = [
    {
      "index": "1",
      "title": "Doctor Strange",
      "title2": "in the Multiverse of Madness",
      "content":
          "Dr. Stephen Strange casts a forbidden spell that opens the doorway to the multiverse, including alternate versions of casts a forbidden spell that opens the doorway to the multiverse"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: 1.sw,
          height: 557.11.sp,
          foregroundDecoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color.fromARGB(255, 23, 12, 53), Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: [0, 0.7],
            ),
          ),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/imgDetail.jpeg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
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
              child: DescriptionTextWidget(
                  text: _fakeData[0]['content'].toString()),
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
            SizedBox(height: 90.sp, width: 350.sp, child: const DateTimeBody()),
            SizedBox(
              height: 30.sp,
            ),
            SizedBox(height: 40.sp, width: 350.sp, child: const TimeButton()),
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
                Navigator.pushNamed(context, '/seats');
              },
            ),
            SizedBox(
              height: 20.sp,
            ),
          ],
        ),
      ],
    );
  }
}
