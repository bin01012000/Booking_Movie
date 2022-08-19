import 'package:booking_movie_ticket/app/common/utils/extensions.dart';
import 'package:booking_movie_ticket/app/presentation/views/detail/detail_screen.dart';
import 'package:booking_movie_ticket/app/presentation/views/home/home_screen.dart';
import 'package:booking_movie_ticket/app/presentation/views/seat/seat_screen.dart';
import 'package:booking_movie_ticket/app/presentation/views/ticket/mobile_ticket_screen.dart';
import 'package:booking_movie_ticket/app/widgets/circular_nav_bar.dart';
import 'package:booking_movie_ticket/app/widgets/general_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_like_css/gradient_like_css.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  int tabIndex = 0;
  late TabController tabController =
      TabController(length: 4, vsync: this, initialIndex: tabIndex);

  @override
  Widget build(BuildContext context) {
    var _gradient = linearGradient(90.03, [
      '#452495 0.02%',
      '#4C31A0 27.25%',
      '#5641AF 55.2%',
      '#7457B4 69.31%',
      '#A466CD 83.34%',
      '#BA61CC 99.96%',
    ]);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: tabController,
          children: const [
            HomeScreen(),
            DetailScreen(),
            SeatScreen(),
            MobileTicket(),
          ]),
      backgroundColor: Colors.transparent,
      bottomNavigationBar: CircleNavBar(
        inactiveIcons: [
          SvgPicture.asset(
            "assets/icons/home.svg",
          ).paddingOnly(bottom: 20.sp),
          SvgPicture.asset(
            "assets/icons/address.svg",
          ).paddingOnly(bottom: 20.sp),
          SvgPicture.asset(
            "assets/icons/menu.svg",
          ).paddingOnly(bottom: 20.sp),
          SvgPicture.asset(
            "assets/icons/user.svg",
          ).paddingOnly(bottom: 20.sp),
        ],
        activeIcons: const [
          OneActiveIconBottomNavbar(svg: "assets/icons/home.svg"),
          OneActiveIconBottomNavbar(svg: "assets/icons/address.svg"),
          OneActiveIconBottomNavbar(svg: "assets/icons/menu.svg"),
          OneActiveIconBottomNavbar(svg: "assets/icons/user.svg"),
        ],
        circleWidth: 65.sp,
        color: Colors.white,
        shadowColor: Colors.transparent,
        elevation: 0,
        height: 70.sp,
        padding: EdgeInsets.only(top: 40.sp),
        initIndex: tabIndex,
        gradient: _gradient,
        onChanged: (int v) {
          tabIndex = v;
          tabController.animateTo(v);
          setState(() {});
        },
      ),
    );
  }
}
