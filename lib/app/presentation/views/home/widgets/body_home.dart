import 'package:booking_movie_ticket/app/common/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../widgets/try_again.dart';
import '../../../bloc/banner/banner_bloc.dart';
import '../../../bloc/movie/movie_bloc.dart';
import '../../../response/response_movie.dart';
import 'banner_home.dart';
import 'one_content_home.dart';

class BodyHome extends StatelessWidget {
  const BodyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MovieBloc _movieBloc = MovieBloc();
    BannerBloc _bannerBloc = BannerBloc();
    RefreshController _homeRefreshController = RefreshController();
    return BlocBuilder<MovieBloc, MovieState>(
      bloc: _movieBloc,
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        _onRefresh() {
          _movieBloc.add(GetMovie());
          _bannerBloc.add(GetBanner());
          _homeRefreshController.refreshCompleted();
        }

        if (state is MovieInitial) {
          _movieBloc.add(GetMovie());
          return SpinKitChasingDots(color: Colors.white, size: 30.sp);
        } else if (state is MovieLoading) {
          return SpinKitChasingDots(color: Colors.white, size: 30.sp);
        } else if (state is MovieSuccess) {
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
              ).paddingOnly(top: 10),
            ),
          );
        }
        return TryAgain(
          press: () {
            _movieBloc.add(GetMovie());
          },
        );
      },
    );
  }
}
