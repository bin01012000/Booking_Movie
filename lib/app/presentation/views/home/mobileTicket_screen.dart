import 'package:booking_movie_ticket/app/widgets/arc_paint.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_like_css/gradient_like_css.dart';

import '../../../common/utils/value/styles/app_text_style.dart';
import '../../../widgets/button_buy.dart';
import '../../../widgets/icon_app.dart';
import '../../../widgets/list_seats.dart';

class MobileTicket extends StatelessWidget {
  MobileTicket({Key? key}) : super(key: key);
  static const IconData chair = IconData(0xe14d, fontFamily: 'MaterialIcons');

  bool pressAttention = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: linearGradient(170, ['#2e1371 2.71%', '#130b2b 97.75%']),
      ),
      child: Scaffold(
          backgroundColor: Color.fromRGBO(0, 0, 0, 0),
          body: Stack(
            children: <Widget>[
              Positioned(
                  top: 70.sp,
                  left: 20.sp,
                  right: 20.sp,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      UnicornOutlineButton(
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
                          }),
                      Text(
                        "Mobile Ticket",
                        style: AppTextStyle.st20700,
                      ),
                      UnicornOutlineButton(
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
                        onPressed: () {},
                      ),
                    ],
                  )),
            ],
          )),
    );
  }
}
