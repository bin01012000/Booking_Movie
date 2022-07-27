import 'package:booking_movie_ticket/app/common/utils/value/styles/app_text_style.dart';
import 'package:booking_movie_ticket/app/widgets/background_color_position.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BodyHome extends StatelessWidget {
  const BodyHome({Key? key}) : super(key: key);

  static const List<Map<String, String>> _fakeData = [
    {"index": "1", "img": "assets/images/test.png"},
    {"index": "2", "img": "assets/images/test.png"},
    {"index": "3", "img": "assets/images/test.png"},
    {"index": "4", "img": "assets/images/test.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
          right: 250.sp,
          top: -250.sp,
          bottom: 0,
          left: -250.sp,
          child: const BackgroundColorPosition(bgColor: Color(0xff60ffca)),
        ),
        Positioned(
          right: -320.sp,
          top: 0,
          bottom: -320.sp,
          left: 320.sp,
          child: const BackgroundColorPosition(bgColor: Color(0xffff53c0)),
        ),
        SafeArea(
          child: Wrap(
            runSpacing: 20.sp,
            children: <Widget>[
              const SearchInput(),
              Padding(
                padding: EdgeInsets.only(left: 20.sp),
                child: Wrap(
                  runSpacing: 20.sp,
                  children: [
                    Text(
                      "Now Playing",
                      style: AppTextStyle.st17700,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Wrap(
                        spacing: 20.sp,
                        direction: Axis.horizontal,
                        children: _fakeData
                            .map((e) => Image.asset(e["img"].toString()))
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
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
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color.fromRGBO(118, 118, 128, 0.12),
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
