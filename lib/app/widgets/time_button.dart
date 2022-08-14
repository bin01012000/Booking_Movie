import 'package:booking_movie_ticket/app/widgets/unicorn_outline_button.dart';
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
  int _selectedIndex = 0;

  _onSelected(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      Expanded(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Wrap(
            spacing: 20.sp,
            children: _fakeData
                .map(
                    (e) => _buildPageItem(int.parse(e['index'].toString()) - 1))
                .toList(),
          ),
        ),
      )
    ]);
  }

  Widget _buildPageItem(int index) {
    return UnicornOutlineButton(
      background: _selectedIndex == index
          ? [
              const Color.fromRGBO(182, 17, 107, 1),
              const Color.fromRGBO(33, 35, 47, 1),
            ]
          : [
              const Color.fromRGBO(46, 19, 113, 1),
              const Color.fromRGBO(33, 35, 47, 1),
            ],
      strokeWidth: 1,
      radius: 10.sp,
      gradient: LinearGradient(
        colors: _selectedIndex == index
            ? [
                const Color.fromRGBO(254, 83, 187, 1),
                const Color.fromRGBO(9, 251, 211, 0)
              ]
            : [
                const Color.fromRGBO(9, 251, 211, 1),
                const Color.fromRGBO(9, 251, 211, 0)
              ],
        begin: Alignment.topLeft,
        end: Alignment.centerRight,
      ),
      onPressed: () => _onSelected(index),
      height: 40.sp,
      isDateTimeButton: true,
      width: 50.sp,
      child: Center(
        child: Text(_fakeData[index]['time'].toString(),
            style: AppTextStyle.st15700),
      ),
    );
  }
}
