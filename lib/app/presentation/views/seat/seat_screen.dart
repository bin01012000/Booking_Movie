import 'package:booking_movie_ticket/app/presentation/views/seat/widgets/dot_status.dart';
import 'package:flutter/material.dart';
import 'package:booking_movie_ticket/app/common/utils/value/app_color.dart';
import 'package:booking_movie_ticket/app/common/utils/value/styles/app_text_style.dart';
import 'package:booking_movie_ticket/app/presentation/views/ticket/mobile_ticket_screen.dart';
import 'package:booking_movie_ticket/app/widgets/arc_paint.dart';
import 'package:booking_movie_ticket/app/widgets/button_buy.dart';
import 'package:booking_movie_ticket/app/presentation/views/seat/widgets/list_seats.dart';
import 'package:booking_movie_ticket/app/widgets/unicorn_outline_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_like_css/gradient_like_css.dart';

class SeatScreen extends StatelessWidget {
  const SeatScreen({Key? key}) : super(key: key);

  final IconData chair = const IconData(0xe14d, fontFamily: 'MaterialIcons');
  final bool pressAttention = false;

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
                "Choose Seats",
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
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 65.sp),
                child: const Center(child: ArcPaintPage()),
              ),
              Padding(
                padding: EdgeInsets.only(top: 65.sp),
                child: const MyGridView(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 50.sp),
                child: Wrap(
                  spacing: 20.sp,
                  children: <Widget>[
                    const DotStatus(
                      status: "Available",
                      color: Colors.white,
                    ),
                    DotStatus(
                      status: "Reserved",
                      color: AppColors.red,
                    ),
                    DotStatus(
                      status: "Selected",
                      color: AppColors.green,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 34.sp),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Image.asset(
                      "assets/images/Base.png",
                      fit: BoxFit.contain,
                    ),
                    Wrap(
                      spacing: 10.sp,
                      children: [
                        Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 10.sp, bottom: 60.sp)),
                            Image.asset('assets/icons/Calendar.png'),
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
                            Image.asset('assets/icons/Ticket.png'),
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
                                padding: EdgeInsets.only(
                                    left: 10.sp, bottom: 110.sp)),
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
                                builder: (context) => const MobileTicket()));
                          },
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
