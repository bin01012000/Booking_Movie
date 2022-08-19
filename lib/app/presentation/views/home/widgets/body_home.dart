import 'package:booking_movie_ticket/app/presentation/bloc/home/home_bloc.dart';
import 'package:booking_movie_ticket/app/presentation/response/response_banner.dart';
import 'package:booking_movie_ticket/app/presentation/response/response_movie.dart';
import 'package:booking_movie_ticket/app/presentation/views/home/widgets/banner_home.dart';
import 'package:booking_movie_ticket/app/presentation/views/home/widgets/one_content_home.dart';
import 'package:booking_movie_ticket/app/widgets/try_again.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class BodyHome extends StatefulWidget {
  const BodyHome({Key? key}) : super(key: key);

  @override
  State<BodyHome> createState() => _BodyHomeState();
}

class _BodyHomeState extends State<BodyHome> {
  final _homeBloc = HomeBloc();
  @override
  void initState() {
    super.initState();
    _homeBloc.add(GetMovie());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      bloc: _homeBloc,
      builder: (context, state) {
        if (state is HomeLoading || state is HomeInitial) {
          return SpinKitChasingDots(color: Colors.white, size: 30.sp);
        } else if (state is HomeFailure) {
          return TryAgain(
            press: () {
              _homeBloc.add(GetMovie());
            },
          );
        } else if (state is HomeSuccess) {
          ResponseMovie _data = state.responseMovie;
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SafeArea(
              child: Wrap(
                runSpacing: 20.sp,
                children: <Widget>[
                  const BannerHome(),
                  OneContentHome(
                    data: _data,
                    title: "Now Playing",
                  ),
                  OneContentHome(
                    data: _data,
                    title: "Coming Soon",
                  ),
                  OneContentHome(
                    data: _data,
                    title: "Top movies",
                  ),
                  OneContentHome(
                    data: _data,
                    title: "Top movies",
                  ),
                ],
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}
