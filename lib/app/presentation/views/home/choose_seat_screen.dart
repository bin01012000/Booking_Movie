import 'package:booking_movie_ticket/app/presentation/views/home/mobileTicket_screen.dart';
import 'package:booking_movie_ticket/app/widgets/arc_paint.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_like_css/gradient_like_css.dart';

import '../../../common/utils/value/styles/app_text_style.dart';
import '../../../widgets/button_buy.dart';
import '../../../widgets/icon_app.dart';
import '../../../widgets/list_seats.dart';

class ChooseSeat extends StatelessWidget {
  ChooseSeat({Key? key}) : super(key: key);
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
                      "Choose Seats",
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
            Positioned(
              top: 150.sp,
              left: -50.sp,
              width: 500.sp,
              height: 60.sp,
              child: Center(child: ArcPaintPage()),
            ),
            Container(
              margin: EdgeInsets.only(top: 200.sp),
              child: MyGridView(),
            ),
            Container(
              margin: EdgeInsets.only(top: 500.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.brightness_1,
                    color: Colors.white,
                    size: 13.sp,
                  ),
                  SizedBox(width: 5.sp),
                  Text(
                    "Available",
                    style: AppTextStyle.st15500,
                  ),
                  SizedBox(width: 15.sp),
                  Icon(
                    Icons.brightness_1,
                    color: Color.fromRGBO(182, 17, 107, 1),
                    size: 13.sp,
                  ),
                  SizedBox(width: 5.sp),
                  Text(
                    "Reserved",
                    style: AppTextStyle.st15500,
                  ),
                  SizedBox(width: 15.sp),
                  Icon(
                    Icons.brightness_1,
                    color: Color.fromRGBO(96, 255, 202, 1),
                    size: 13.sp,
                  ),
                  SizedBox(width: 5.sp),
                  Text(
                    "Selected",
                    style: AppTextStyle.st15500,
                  ),
                ],
              ),
            ),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image.asset("assets/images/Base.png"),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Padding(
                            padding:
                                EdgeInsets.only(left: 10.sp, bottom: 60.sp)),
                        const Icon(
                          Icons.calendar_month_outlined,
                          color: Colors.white,
                        ),
                        SizedBox(width: 10.sp),
                        Text(
                          "April 23, 2022",
                          style: AppTextStyle.st15400,
                        ),
                        SizedBox(width: 10.sp),
                        Icon(
                          Icons.brightness_1,
                          color: Colors.white,
                          size: 10.sp,
                        ),
                        SizedBox(width: 10.sp),
                        Text(
                          "6 p.m.",
                          style: AppTextStyle.st15400,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10.sp)),
                        const Icon(
                          Icons.airplane_ticket,
                          color: Colors.white,
                        ),
                        SizedBox(width: 10.sp),
                        Text(
                          "VIP Section",
                          style: AppTextStyle.st15400,
                        ),
                        SizedBox(width: 10.sp),
                        Icon(
                          Icons.brightness_1,
                          color: Colors.white,
                          size: 10.sp,
                        ),
                        SizedBox(width: 10.sp),
                        Text(
                          "Seat 9,10",
                          style: AppTextStyle.st15400,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                            padding:
                                EdgeInsets.only(left: 10.sp, bottom: 110.sp)),
                        const Icon(
                          Icons.shopping_cart_rounded,
                          color: Colors.white,
                        ),
                        SizedBox(width: 10.sp),
                        Text(
                          "Total: 30",
                          style: AppTextStyle.st15400,
                        ),
                      ],
                    ),
                  ],
                ),
                Positioned(
                    right: 15.sp,
                    bottom: 70.sp,
                    child: ButtonBuy(
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
                      child: Text(
                        "Buy",
                        style: AppTextStyle.st15400,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MobileTicket()));
                      },
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
