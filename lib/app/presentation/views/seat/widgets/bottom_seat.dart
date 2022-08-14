import 'package:booking_movie_ticket/app/common/utils/value/styles/app_text_style.dart';
import 'package:booking_movie_ticket/app/widgets/button_buy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BottomSeat extends StatelessWidget {
  const BottomSeat({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 1.sw,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                "assets/images/Base.png",
              ),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 52.sp, bottom: 52.sp, left: 33.sp),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildDetailSeat(
                    "assets/icons/calendar.svg", "April 23, 2022", "6 p.m."),
                SizedBox(height: 22.sp),
                buildDetailSeat(
                    "assets/icons/ticket.svg", "VIP Section", "Seat 9 ,10"),
                SizedBox(height: 22.sp),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 10.sp,
                  children: [
                    SvgPicture.asset(
                      "assets/icons/cart.svg",
                      width: 18.sp,
                      height: 20.sp,
                      fit: BoxFit.scaleDown,
                    ),
                    Text(
                      "Total: \$30",
                      style: AppTextStyle.st15400,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const Spacer(),
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
              Navigator.pushNamed(context, "/mobileticket");
            },
          ),
        ),
      ],
    );
  }

  Wrap buildDetailSeat(String svg, String firstText, String lastText) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 10.sp,
      children: [
        SvgPicture.asset(svg,
            width: 18.sp, height: 20.sp, fit: BoxFit.scaleDown),
        Text(
          firstText,
          style: AppTextStyle.st15400,
        ),
        Container(
          width: 6.sp,
          height: 6.sp,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
        ),
        Text(
          lastText,
          style: AppTextStyle.st15400,
        ),
      ],
    );
  }
}
