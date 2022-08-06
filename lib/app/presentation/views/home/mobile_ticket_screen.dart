import 'package:booking_movie_ticket/app/widgets/unicorn_outline_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_like_css/gradient_like_css.dart';
import 'package:ticket_widget/ticket_widget.dart';

import '../../../common/utils/value/styles/app_text_style.dart';
import '../../../widgets/ticket.dart';

class MobileTicket extends StatelessWidget {
  const MobileTicket({Key? key}) : super(key: key);
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
          body: Stack(
            children: <Widget>[
              Positioned(
                  top: 70.sp,
                  left: 20.sp,
                  right: 20.sp,
                  child: Column(
                    children: [
                      Row(
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
                            },
                            background: const [],
                            height: 44.sp,
                            isDateTimeButton: false,
                            width: 44.sp,
                          ),
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
                            background: const [],
                            height: 44.sp,
                            isDateTimeButton: false,
                            width: 44.sp,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.sp,
                      ),
                      Center(
                        child: Text(
                          'Once you buy a movie ticket simply scan the barcode to acces to your movie.',
                          style: AppTextStyle.st17500,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  )),
              const Padding(
                padding: EdgeInsets.only(top: 70),
                child: Center(
                  child: TicketWidget(
                    width: 250,
                    height: 400,
                    isCornerRounded: true,
                    child: TicketData(),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
