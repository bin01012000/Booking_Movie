import 'package:booking_movie_ticket/app/presentation/views/home/widgets/one_content_home.dart';
import 'package:booking_movie_ticket/app/presentation/views/home/widgets/search_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BodyHome extends StatelessWidget {
  const BodyHome({Key? key}) : super(key: key);

  static const List<Map<String, String>> _fakeData = [
    {"index": "1", "img": "assets/images/test.png"},
    {"index": "2", "img": "assets/images/test2.png"},
    {"index": "3", "img": "assets/images/test3.png"},
    {"index": "4", "img": "assets/images/test4.png"},
    {"index": "5", "img": "assets/images/test5.png"},
  ];

  static const List<Map<String, String>> _fakeDataComing = [
    {"index": "1", "img": "assets/images/test6.png"},
    {"index": "2", "img": "assets/images/test7.png"},
    {"index": "3", "img": "assets/images/test8.png"},
    {"index": "4", "img": "assets/images/test9.png"},
    {"index": "5", "img": "assets/images/test10.png"},
  ];

  static const List<Map<String, String>> _fakeDataTop = [
    {"index": "1", "img": "assets/images/test11.png"},
    {"index": "2", "img": "assets/images/test12.png"},
    {"index": "3", "img": "assets/images/test13.png"},
    {"index": "4", "img": "assets/images/test14.png"},
    {"index": "5", "img": "assets/images/test.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SafeArea(
        child: Wrap(
          runSpacing: 20.sp,
          children: const <Widget>[
            SearchInput(),
            OneContentHome(
              fakeData: _fakeData,
              title: "Now Playing",
            ),
            OneContentHome(
              fakeData: _fakeDataComing,
              title: "Coming Soon",
            ),
            OneContentHome(
              fakeData: _fakeDataTop,
              title: "Top movies",
            ),
            OneContentHome(
              fakeData: _fakeDataTop,
              title: "Top movies",
            ),
          ],
        ),
      ),
    );
  }
}
