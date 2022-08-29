import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../widgets/try_again.dart';
import '../../../bloc/movie_theater/movie_theater_bloc.dart';
import 'list_theater.dart';

class BodyMovieTheater extends StatelessWidget {
  const BodyMovieTheater({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MovieTheaterBloc _movieTheaterBloc = MovieTheaterBloc();
    return Container(
      height: 1.sh,
      child: BlocBuilder<MovieTheaterBloc, MovieTheaterState>(
        bloc: _movieTheaterBloc,
        builder: (BuildContext context, state) {
          if (state is MovieTheaterInitial) {
            _movieTheaterBloc.add(GetListMovieTheater());
            return SpinKitChasingDots(color: Colors.white, size: 30.sp);
          } else if (state is MovieTheaterLoading) {
            return SpinKitChasingDots(color: Colors.white, size: 30.sp);
          } else if (state is MovieTheaterSuccess) {
            return ListTheater(
              res: state.responseMovieTheater,
            );
          }
          return TryAgain(
            press: () {
              _movieTheaterBloc.add(GetListMovieTheater());
            },
          );
        },
      ),
    );
  }
}
