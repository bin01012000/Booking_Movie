import 'package:booking_movie_ticket/app/presentation/views/detail/widgets/body_detail.dart';
import 'package:booking_movie_ticket/app/widgets/general_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Object? args = ModalRoute.of(context)!.settings.arguments;
    int i = int.parse(args.toString());

    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(44.sp + 12.sp),
        child: const GeneralAppBar(title: ""),
      ),
      backgroundColor: const Color.fromARGB(255, 23, 12, 53),
      body: BodyDetail(
        idMovie: i,
      ),
    );
  }
}
