import 'package:booking_movie_ticket/app/widgets/unicorn_outline_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';

import '../../../../common/utils/value/styles/app_text_style.dart';
import '../../../../widgets/try_again.dart';
import '../../../bloc/schedule/schedule_bloc.dart';
import '../../../response/response_schedule.dart';

class TimeButton extends StatefulWidget {
  const TimeButton({Key? key, required this.id}) : super(key: key);
  final int id;
  @override
  State<TimeButton> createState() => _TimeButtonState();
}

class _TimeButtonState extends State<TimeButton> {
  final ScheduleBloc _scheduleBloc = ScheduleBloc();
  int _selectedIndex = 0;

  _onSelected(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  void initState() {
    super.initState();
    _scheduleBloc.add(GetScheduleMovie(id: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScheduleBloc, ScheduleState>(
        bloc: _scheduleBloc,
        builder: (context, state) {
          if (state is ScheduleLoading || state is ScheduleInitial) {
            return SpinKitChasingDots(color: Colors.white, size: 30.sp);
          } else if (state is ScheduleFailure) {
            return TryAgain(
              press: () {
                _scheduleBloc.add(GetScheduleMovie(id: widget.id));
              },
            );
          } else if (state is ScheduleSuccess) {
            List<Data>? _data = state.responseSchedule.data;

            return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              Expanded(
                child: Wrap(spacing: 20.sp, children: [
                  AspectRatio(
                    aspectRatio: 8,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: _data!.length,
                        physics: const ClampingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return UnicornOutlineButton(
                            strokeWidth: 1,
                            radius: 10.sp,
                            gradient: LinearGradient(
                              colors: _selectedIndex == index
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
                            onPressed: () => _onSelected(index),
                            background: _selectedIndex == index
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
                            width: 50.sp,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: Text(
                                      DateFormat.Hm().format(DateTime.parse(
                                          _data[index].startTime.toString())),
                                      style: AppTextStyle.st15700),
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                              width: 20,
                            )),
                  ),
                ]),
              ),
            ]);
          }
          return Container();
        });
  }
}
