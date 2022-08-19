import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TryAgain extends StatelessWidget {
  const TryAgain({
    Key? key,
    required this.press,
  }) : super(key: key);
  final Function() press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.sp),
      child: Center(
          child: GestureDetector(
        onTap: press,
        child: Column(
          children: const <Widget>[
            Icon(Icons.refresh, color: Colors.white),
            Text(
              "Try Again",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      )),
    );
  }
}
