import 'package:booking_movie_ticket/app/widgets/unicorn_outline_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_like_css/gradient_like_css.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../common/utils/value/styles/app_text_style.dart';
import 'widgets/ticket.dart';

class MobileTicket extends StatelessWidget {
  const MobileTicket({Key? key}) : super(key: key);
  final IconData chair = const IconData(0xe14d, fontFamily: 'MaterialIcons');

  final bool pressAttention = false;
  dynamic getInt(currentPage) async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    int? _res = prefs.getInt("currentPage");
    return _res;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: linearGradient(170, ['#2e1371 2.71%', '#130b2b 97.75%']),
      ),
      child: Scaffold(
          backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(44.sp + 12.sp),
            child: Padding(
              padding: EdgeInsets.only(top: 12.sp),
              child: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                leadingWidth: 44.sp,
                automaticallyImplyLeading: false,
                leading: Transform.translate(
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
                title: Text(
                  "Mobile Ticket",
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
                        Icons.more_vert,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                      background: const [],
                      height: 44.sp,
                      isDateTimeButton: false,
                      width: 44.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 20.sp),
                  Text(
                    'Once you buy a movie ticket simply scan the barcode to acces to your movie.',
                    style: AppTextStyle.st17500,
                    textAlign: TextAlign.center,
                  ),
                  Ticket(),
                ],
              ),
            ),
          )),
    );
  }
}
