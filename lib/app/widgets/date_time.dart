import 'package:booking_movie_ticket/app/widgets/unicorn_outline_button.dart';
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
      ),
    ]);
  }

  Widget _buildPageItem(int index) {
    return UnicornOutlineButton(
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
      background: _selectedIndex == index
          ? [
              const Color.fromRGBO(182, 17, 107, 1),
              const Color.fromRGBO(33, 35, 47, 1),
            ]
          : [
              const Color.fromRGBO(46, 19, 113, 1),
              const Color.fromRGBO(33, 35, 47, 1),
            ],
      height: 80.sp,
      isDateTimeButton: true,
      width: 50.sp,
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
      ),
    );
  }
}
