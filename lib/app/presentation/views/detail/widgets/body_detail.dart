import 'package:booking_movie_ticket/app/common/utils/value/styles/app_text_style.dart';
import 'package:booking_movie_ticket/app/presentation/bloc/detail/detail_bloc.dart';
import 'package:booking_movie_ticket/app/presentation/response/response_detail_movie.dart';
import 'package:booking_movie_ticket/app/presentation/views/detail/widgets/date_time.dart';
import 'package:booking_movie_ticket/app/widgets/image_network_custom.dart';
import 'package:booking_movie_ticket/app/widgets/raise_button.dart';
import 'package:booking_movie_ticket/app/presentation/views/detail/widgets/time_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../widgets/read_more.dart';
import '../../../../widgets/try_again.dart';

class BodyDetail extends StatefulWidget {
  const BodyDetail({Key? key, required this.idMovie}) : super(key: key);
  final int idMovie;

  @override
  State<BodyDetail> createState() => _BodyDetailState();
}

class _BodyDetailState extends State<BodyDetail> {
  final DetailBloc _detailBloc = DetailBloc();

  @override
  void initState() {
    super.initState();
    _detailBloc.add(GetDetailMovie(id: widget.idMovie));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailBloc, DetailState>(
      bloc: _detailBloc,
      builder: (context, state) {
        if (state is DetailLoading || state is DetailInitial) {
          return SpinKitChasingDots(color: Colors.white, size: 30.sp);
        } else if (state is DetailFailure) {
          return TryAgain(
            press: () {
              _detailBloc.add(GetDetailMovie(id: widget.idMovie));
            },
          );
        } else if (state is DetailSuccess) {
          ResponseDetailMovie _data = state.responseMovie;
          return SingleChildScrollView(
              child: Stack(
            children: <Widget>[
              Container(
                  width: 1.sw,
                  height: 557.11.sp,
                  foregroundDecoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 23, 12, 53),
                        Colors.transparent
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      stops: [0, 0.7],
                    ),
                  ),
                  padding: EdgeInsets.only(left: 1.sp, top: 0.sp),
                  child: ImageNetworkCustom(
                      url: _data.data!.imageOfMovie![0].url.toString())),
              Padding(
                padding: EdgeInsets.only(top: 250.sp, bottom: 20.sp),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  runSpacing: 20.sp,
                  children: [
                    Center(
                      child: Text(
                          _data.data!.name!
                              .substring(0, (_data.data!.name!.indexOf(' '))),
                          style: AppTextStyle.st20700),
                    ),
                    Center(
                      child: Text(
                          _data.data!.name!
                              .substring(_data.data!.name!.indexOf(' '))
                              .toString(),
                          style: AppTextStyle.st14700),
                    ),
                    Center(
                      child: DescriptionTextWidget(
                        text: _data.data!.description.toString(),
                      ),
                    ),
                    Center(
                      child: Text(
                        "Select date and time",
                        style: AppTextStyle.st17500,
                      ),
                    ),
                    SizedBox(
                        height: 90.sp,
                        width: 350.sp,
                        child: DateTimeBody(
                          id: widget.idMovie,
                        )),
                    SizedBox(
                      height: 40.sp,
                      width: 350.sp,
                      child: TimeButton(
                        id: widget.idMovie,
                      ),
                    ),
                    RaisedGradientButton(
                      child: Text('Reservation', style: AppTextStyle.st17500),
                      gradient: const LinearGradient(
                        colors: <Color>[
                          Color.fromRGBO(182, 17, 107, 1),
                          Color.fromRGBO(59, 21, 120, 1),
                        ],
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/seats');
                      },
                    ),
                  ],
                ),
              )
            ],
          ));
        }
        return Container();
      },
    );
  }
}
