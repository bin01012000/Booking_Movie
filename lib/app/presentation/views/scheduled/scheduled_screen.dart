import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/general_app_bar.dart';
import 'widgets/body_scheduled.dart';

class ScheduledScreen extends StatelessWidget {
  const ScheduledScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(44.sp + 12.sp),
        child: const GeneralAppBar(title: "Scheduled Movie"),
      ),
      backgroundColor: const Color.fromARGB(255, 23, 12, 53),
      body: const BodyScheduled(),
    );
  }
}
