import 'package:booking_movie_ticket/app/widgets/general_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/body_movie_theater.dart';

class MovieTheaterScreen extends StatelessWidget {
  const MovieTheaterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(44.sp + 12.sp),
        child: const GeneralAppBar(title: "Movie Theater"),
      ),
      backgroundColor: const Color.fromARGB(255, 23, 12, 53),
      body: const BodyMovieTheater(),
    );
  }
}
