import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../common/utils/value/styles/app_text_style.dart';
import '../../../../widgets/unicorn_outline_button.dart';
import '../../../response/response_scheduled_movie.dart';

class ListScheduledMovie extends StatefulWidget {
  const ListScheduledMovie({Key? key, required this.dataScheduledMovie})
      : super(key: key);
  final List<DataScheduledMovie> dataScheduledMovie;
  @override
  State<ListScheduledMovie> createState() => _ListScheduledMovieState();
}

class _ListScheduledMovieState extends State<ListScheduledMovie> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.dataScheduledMovie[0].id!.toInt();
  }

  _onSelected(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 20.sp),
      child: SingleChildScrollView(
        child: Wrap(
          spacing: 20.sp,
          runSpacing: 20.sp,
          children: widget.dataScheduledMovie
              .map(
                (e) => UnicornOutlineButton(
                  strokeWidth: 2,
                  radius: 10.sp,
                  gradient: LinearGradient(
                    colors: _selectedIndex == e.id
                        ? [
                            const Color.fromRGBO(254, 83, 187, 1),
                            const Color.fromRGBO(9, 251, 211, 0)
                          ]
                        : [
                            const Color.fromRGBO(9, 251, 211, 1),
                            const Color.fromRGBO(9, 251, 211, 0)
                          ],
                    begin: Alignment.topLeft,
                    end: Alignment.centerRight,
                  ),
                  onPressed: () => _onSelected(e.id!.toInt()),
                  background: _selectedIndex == e.id
                      ? [
                          const Color.fromRGBO(182, 17, 107, 1),
                          const Color.fromRGBO(33, 35, 47, 1),
                        ]
                      : [
                          const Color.fromRGBO(46, 19, 113, 1),
                          const Color.fromRGBO(33, 35, 47, 1),
                        ],
                  height: 80.sp,
                  isDateTimeButton: true,
                  width: 1.sw / 2 - 30.sp,
                  child: Center(
                    child: Text(
                      DateFormat.Hm()
                          .format(DateTime.parse(e.startTime.toString())),
                      style: AppTextStyle.st15700,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
