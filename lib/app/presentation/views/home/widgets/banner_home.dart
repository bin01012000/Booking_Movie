import 'package:booking_movie_ticket/app/common/utils/extensions.dart';
import 'package:booking_movie_ticket/app/presentation/bloc/banner/banner_bloc.dart';
import 'package:booking_movie_ticket/app/presentation/response/response_banner.dart';
import 'package:booking_movie_ticket/app/widgets/try_again.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class BannerHome extends StatefulWidget {
  const BannerHome({Key? key}) : super(key: key);

  @override
  State<BannerHome> createState() => _BannerHomeState();
}

class _BannerHomeState extends State<BannerHome> {
  late PageController _pageController;
  final int _currentPage = 0;
  double positionPage = 1;
  int _activePage = 0;
  final BannerBloc _bannerBloc = BannerBloc();
  @override
  void initState() {
    super.initState();
    _pageController =
        PageController(initialPage: _currentPage, viewportFraction: 0.8);
    _bannerBloc.add(GetBanner());
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BannerBloc, BannerState>(
      bloc: _bannerBloc,
      builder: (context, state) {
        if (state is BannerLoading || state is BannerInitial) {
          return SpinKitThreeBounce(
            color: Colors.white,
            size: 30.sp,
          );
        } else if (state is BannerFailure) {
          return TryAgain(press: () => _bannerBloc.add(GetBanner()));
        } else if (state is BannerSuccess) {
          List<Data>? data = state.responseBanner.data;
          if (data == null || data == []) {
            return const Text("List empty");
          }
          return Wrap(
            spacing: 20.sp,
            children: [
              AspectRatio(
                aspectRatio: 3,
                child: PageView.builder(
                  itemCount: data.length,
                  physics: const ClampingScrollPhysics(),
                  controller: _pageController,
                  onPageChanged: (int index) {
                    setState(() {
                      _activePage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Image.network(
                      data[index].url.toString(),
                      fit: BoxFit.cover,
                    ).paddingSymmetric(horizontal: 8.sp);
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15.sp),
                color: Colors.black12,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(
                    data.length,
                    (index) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.sp),
                      child: InkWell(
                        onTap: () {
                          _pageController.animateToPage(index,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn);
                        },
                        child: CircleAvatar(
                          radius: 5,
                          backgroundColor: _activePage == index
                              ? const Color.fromRGBO(124, 98, 214, 1)
                              : const Color.fromRGBO(255, 255, 255, 0.2),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        }
        return Container();
      },
    );
  }
}
