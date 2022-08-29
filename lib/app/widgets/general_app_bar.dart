import 'package:booking_movie_ticket/app/common/utils/value/styles/app_text_style.dart';
import 'package:booking_movie_ticket/app/widgets/unicorn_outline_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GeneralAppBar extends StatelessWidget {
  const GeneralAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 12.sp),
      child: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leadingWidth: 44.sp,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => Navigator.pop(context),
          child: Transform.translate(
            offset: Offset(20.sp, 0),
            child: UnicornOutlineButton(
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
          ),
        ),
        title: Text(
          title,
          style: AppTextStyle.st20700,
        ),
        centerTitle: true,
        actions: [
          Transform.translate(
            offset: Offset(-20.sp, 0),
            child: UnicornOutlineButton(
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
                Icons.calendar_month_outlined,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
              background: const [],
              height: 44.sp,
              isDateTimeButton: false,
              width: 44.sp,
            ),
          ),
        ],
      ),
    );
  }
}
