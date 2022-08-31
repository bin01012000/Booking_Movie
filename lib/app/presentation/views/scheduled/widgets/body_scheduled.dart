import 'package:booking_movie_ticket/app/presentation/bloc/schedule/schedule_bloc.dart';
import 'package:booking_movie_ticket/app/widgets/try_again.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'list_scheduled_movie.dart';

class BodyScheduled extends StatefulWidget {
  const BodyScheduled({Key? key}) : super(key: key);

  @override
  State<BodyScheduled> createState() => _BodyScheduledState();
}

class _BodyScheduledState extends State<BodyScheduled> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  int idMovie = 1;
  int idTheater = 1;
  @override
  void initState() {
    super.initState();
    getId();
  }

  getId() async {
    idMovie = await _prefs.then((SharedPreferences prefs) {
      return prefs.getInt("idMovie") ?? 1;
    });
    idTheater = await _prefs.then((SharedPreferences prefs) {
      return prefs.getInt("idMovie") ?? 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ScheduleBloc _scheduledBloc = ScheduleBloc();

    return BlocBuilder<ScheduleBloc, ScheduleState>(
      bloc: _scheduledBloc,
      builder: (context, state) {
        if (state is ScheduleInitial) {
          _scheduledBloc
              .add(GetScheduleMovie(idMovie: idMovie, idTheater: idTheater));
          return SpinKitChasingDots(color: Colors.white, size: 30.sp);
        } else if (state is ScheduleLoading) {
          return SpinKitChasingDots(color: Colors.white, size: 30.sp);
        } else if (state is ScheduleSuccess) {
          return ListScheduledMovie(
            dataScheduledMovie: state.responseSchedule.data!.toList(),
          );
        }
        return TryAgain(press: () {
          _scheduledBloc
              .add(GetScheduleMovie(idMovie: idMovie, idTheater: idTheater));
        });
      },
    );
  }
}
