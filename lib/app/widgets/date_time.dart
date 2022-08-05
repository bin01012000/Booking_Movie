import 'dart:ui';

import 'package:booking_movie_ticket/app/widgets/dateTime_Border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common/utils/value/styles/app_text_style.dart';

class DateTimeBody extends StatefulWidget {
  const DateTimeBody({Key? key}) : super(key: key);

  @override
  State<DateTimeBody> createState() => _DateTimeBodyState();
}

class _DateTimeBodyState extends State<DateTimeBody> {
  static const List<Map<String, String>> _fakeData = [
    {"index": "1", "date": "Mon", "day": "20"},
    {"index": "2", "date": "Tue", "day": "21"},
    {"index": "3", "date": "Wed", "day": "22"},
    {"index": "4", "date": "Thu", "day": "23"},
    {"index": "5", "date": "Fri", "day": "24"},
    {"index": "6", "date": "Sat", "day": "25"},
    {"index": "7", "date": "Sun", "day": "26"},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      Expanded(
        child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 7,
            separatorBuilder: (context, _) => SizedBox(
                  width: 20.sp,
                ),
            itemBuilder: (context, index) => _buildPageItem(index)),
      ),
    ]);
  }

  Widget _buildPageItem(int index) {
    return UnicornOutlineButton(
        strokeWidth: 1,
        radius: 10.sp,
        gradient: const LinearGradient(
          colors: [
            Color.fromRGBO(9, 251, 211, 1),
            Color.fromRGBO(9, 251, 211, 0)
          ],
          begin: Alignment.topLeft,
          end: Alignment.centerRight,
        ),
        onPressed: () => {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(_fakeData[index]['date'].toString(),
                  style: AppTextStyle.st15400),
            ),
            Center(
              child: Text(_fakeData[index]['day'].toString(),
                  style: AppTextStyle.st15700),
            ),
          ],
        ),);
  }
}
