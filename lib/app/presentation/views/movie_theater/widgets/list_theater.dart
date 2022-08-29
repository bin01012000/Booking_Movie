import 'package:booking_movie_ticket/app/presentation/response/response_movie_theater.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'one_theater.dart';

class ListTheater extends StatelessWidget {
  const ListTheater({Key? key, required this.res}) : super(key: key);
  final ResponseMovieTheater res;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Wrap(
        direction: Axis.vertical,
        runSpacing: 10.sp,
        children: res.movie != null && res.movie!.isNotEmpty
            ? [const Text("List movie theater is empty")]
            : res.movie!
                .map(
                  (el) => OneTheater(
                    addressTheater: el.address.toString(),
                    nameTheater: el.tenRap.toString(),
                    urlImage: el.movieTheaterImage!,
                  ),
                )
                .toList(),
      ),
    );
  }
}
