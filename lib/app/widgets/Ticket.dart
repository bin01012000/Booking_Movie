import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TicketData extends StatelessWidget {
  const TicketData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              width: 350.0,
              height: 260.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0.sp),
                      topRight: Radius.circular(20.0.sp)),
                  image: const DecorationImage(
                      image: AssetImage('assets/images/imgDetail.jpeg'),
                      fit: BoxFit.cover)),
            ),
          ],
        ),
        Column(
          children: [
            SizedBox(
              height: 20.sp,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Date: April 23'),
                SizedBox(
                  width: 30.sp,
                ),
                const Text('Time: 6 p.m.')
              ],
            ),
            SizedBox(
              height: 20.sp,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Row: 2'),
                SizedBox(
                  width: 75.sp,
                ),
                const Text('Seats: 9 , 10')
              ],
            )
          ],
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(top: 1.0, left: 30.0, right: 30.0),
          child: Container(
            width: 250.0,
            height: 50.0,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/Code barre.png'),
                    fit: BoxFit.cover)),
          ),
        ),
      ],
    );
  }
}
