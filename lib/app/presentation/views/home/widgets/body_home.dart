import 'package:booking_movie_ticket/app/common/utils/value/styles/app_text_style.dart';
import 'package:booking_movie_ticket/app/widgets/background_color_position.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
          right: 250.sp,
          top: -50.sp,
          bottom: 0,
          left: -100.sp,
          child: const BackgroundColorPosition(bgColor: Color(0xff60ffca)),
        ),
        Positioned(
          right: -100.sp,
          top: 0,
          bottom: -320.sp,
          left: 360.sp,
          child: const BackgroundColorPosition(bgColor: Color(0xffff53c0)),
        ),
        SafeArea(
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
            ],
          ),
        )
      ],
    );
  }
}

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
                      child: Image.asset(e["img"].toString())))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class SearchInput extends StatelessWidget {
  const SearchInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.sp),
      child: TextField(
        keyboardAppearance: Brightness.dark,
        style: AppTextStyle.placeholder.copyWith(color: Colors.white),
        decoration: InputDecoration(
          isDense: true,
          filled: true,
          fillColor: const Color.fromRGBO(118, 118, 128, 0.12),
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(10.sp),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(10.sp),
          ),
          prefixIcon: SvgPicture.asset(
            "assets/icons/search.svg",
            width: 16.sp,
            height: 16.sp,
            fit: BoxFit.scaleDown,
          ),
          suffixIcon: SvgPicture.asset(
            "assets/icons/microphone.svg",
            width: 16.sp,
            height: 16.sp,
            fit: BoxFit.scaleDown,
          ),
          hintText: "Search",
          hintStyle: AppTextStyle.placeholder,
        ),
      ),
    );
  }
}
