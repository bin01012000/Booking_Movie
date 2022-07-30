import 'dart:ui';

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
  // ScrollController scrollController = ScrollController();
  // var _currPageValue = 0.0;
  // void initState() {
  //   super.initState();
  //   scrollController.addListener(() {
  //     setState(() {

  //     });
  //   })
  // }

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
          child: Text("18:00", style: AppTextStyle.st15400),
        ));
  }
}
