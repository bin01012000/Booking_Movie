import 'package:booking_movie_ticket/app/common/utils/extensions.dart';
import 'package:booking_movie_ticket/app/common/utils/value/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
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
    ).paddingSymmetric(horizontal: 24.sp);
  }
}
