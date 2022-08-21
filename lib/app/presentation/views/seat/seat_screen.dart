import 'package:booking_movie_ticket/app/common/utils/extensions.dart';
import 'package:booking_movie_ticket/app/common/utils/value/app_color.dart';
import 'package:booking_movie_ticket/app/presentation/views/seat/widgets/bottom_seat.dart';
import 'package:booking_movie_ticket/app/presentation/views/seat/widgets/dot_status.dart';
import 'package:booking_movie_ticket/app/presentation/views/seat/widgets/list_seats.dart';
import 'package:booking_movie_ticket/app/widgets/arc_paint.dart';
import 'package:booking_movie_ticket/app/widgets/general_app_bar.dart';
import 'package:flutter/material.dart';
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
          child: const GeneralAppBar(title: "Choose Seats"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const Center(child: ArcPaintPage()).paddingOnly(top: 65.sp),
              const MyGridView().paddingOnly(top: 65.sp),
              Wrap(
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
              ).paddingOnly(top: 50.sp),
              const BottomSeat().paddingOnly(top: 34.sp),
            ],
          ),
        ),
      ),
    );
  }
}
