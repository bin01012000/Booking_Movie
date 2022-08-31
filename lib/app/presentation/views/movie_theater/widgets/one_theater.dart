import 'package:booking_movie_ticket/app/common/utils/extensions.dart';
import 'package:booking_movie_ticket/app/common/utils/helper.dart';
import 'package:booking_movie_ticket/app/common/utils/value/styles/app_text_style.dart';
import 'package:booking_movie_ticket/app/presentation/response/response_movie_theater.dart';
import 'package:booking_movie_ticket/app/widgets/image_network_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OneTheater extends StatelessWidget {
  const OneTheater(
      {Key? key,
      required this.urlImage,
      required this.nameTheater,
      required this.addressTheater,
      required this.idTheater})
      : super(key: key);
  final List<MovieTheaterImage> urlImage;
  final String nameTheater;
  final String addressTheater;
  final int idTheater;
  @override
  Widget build(BuildContext context) {
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    return GestureDetector(
      onTap: () async {
        SharedPreferences prefs = await _prefs;
        prefs.setInt("idTheater", idTheater);
        Navigator.pushNamed(context, '/scheduled-movies');
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
              width: 1.sw,
              height: 150.sp,
              child: ImageNetworkCustom(url: urlImage[0].url.toString())),
          Text(
            StringHelpers.convertNull(nameTheater),
            style: AppTextStyle.st14700,
          ).paddingOnly(top: 10.sp),
          Text(
            StringHelpers.convertNull(addressTheater),
            style: AppTextStyle.st14300,
          ),
        ],
      ).paddingSymmetric(vertical: 10.sp),
    );
  }
}
