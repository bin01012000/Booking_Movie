import 'package:booking_movie_ticket/app/widgets/dateTime_Border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common/utils/value/styles/app_text_style.dart';

class TimeButton extends StatefulWidget {
  const TimeButton({Key? key}) : super(key: key);

  @override
  State<TimeButton> createState() => _TimeButtonState();
}

class _TimeButtonState extends State<TimeButton> {
  static const List<Map<String, String>> _fakeData = [
    {"index": "1", "time": "13:00"},
    {"index": "2", "time": "14:00"},
    {"index": "3", "time": "15:00"},
    {"index": "4", "time": "16:00"},
    {"index": "5", "time": "17:00"},
    {"index": "6", "time": "18:00"},
    {"index": "7", "time": "19:00"},
    {"index": "8", "time": "20:00"},
    {"index": "9", "time": "21:00"},
    {"index": "10", "time": "22:00"},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      Expanded(
        child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 10,
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
      onPressed: () {},
      child: Center(
        child: Text(_fakeData[index]['time'].toString(),
            style: AppTextStyle.st15700),
      ),
    );
  }
}
