import 'package:booking_movie_ticket/app/presentation/bloc/banner/banner_bloc.dart';
import 'package:booking_movie_ticket/app/presentation/bloc/home/home_bloc.dart';
import 'package:booking_movie_ticket/app/presentation/response/response_movie.dart';
import 'package:booking_movie_ticket/app/presentation/views/home/widgets/banner_home.dart';
import 'package:booking_movie_ticket/app/presentation/views/home/widgets/one_content_home.dart';
import 'package:booking_movie_ticket/app/widgets/try_again.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class BodyHome extends StatefulWidget {
  const BodyHome({Key? key}) : super(key: key);

  @override
  State<BodyHome> createState() => _BodyHomeState();
}

class _BodyHomeState extends State<BodyHome>
    with AutomaticKeepAliveClientMixin {
  final _homeBloc = HomeBloc();
  final _bannerBloc = BannerBloc();
  @override
  void initState() {
    super.initState();
    _homeBloc.add(GetMovie());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    RefreshController _homeRefreshController = RefreshController();
    return BlocBuilder<HomeBloc, HomeState>(
      bloc: _homeBloc,
      builder: (context, state) {
        _onRefresh() {
          _homeBloc.add(GetMovie());
          _bannerBloc.add(GetBanner());
          _homeRefreshController.refreshCompleted();
        }

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
          return SmartRefresher(
            controller: _homeRefreshController,
            onRefresh: _onRefresh,
            header: const WaterDropMaterialHeader(
              backgroundColor: Colors.blue,
            ),
            child: SingleChildScrollView(
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
            ),
          );
        }
        return Container();
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
