import 'dart:ui';

import 'package:booking_movie_ticket/app/common/utils/value/styles/app_text_style.dart';
import 'package:booking_movie_ticket/app/presentation/views/home/widgets/body_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_like_css/gradient_like_css.dart';
import 'package:rolling_bottom_bar/rolling_bottom_bar.dart';
import 'package:rolling_bottom_bar/rolling_bottom_bar_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: linearGradient(170, ['#2e1371 2.71%', '#130b2b 97.75%']),
      ),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text(
            "Choose Movie ",
            style: AppTextStyle.st20700,
          ),
        ),
        backgroundColor: Colors.transparent,
        body: const BodyHome(),
        //   bottomNavigationBar: RollingBottomBar(
        //   controller: _controller,
        //   items: const [
        //     RollingBottomBarItem(Icons.home, label: 'Page 1'),
        //     RollingBottomBarItem(Icons.star, label: 'Page 2'),
        //     RollingBottomBarItem(Icons.person, label: 'Page 3'),
        //     RollingBottomBarItem(Icons.access_alarm, label: 'Page 4'),
        //   ],
        //   activeItemColor: Colors.green.shade700,
        //   enableIconRotation: true,
        //   onTap: (index) {
        //     _controller.animateToPage(
        //       index,
        //       duration: const Duration(milliseconds: 400),
        //       curve: Curves.easeOut,
        //     );
        //   },
        // ),
      ),
    );
  }
}
