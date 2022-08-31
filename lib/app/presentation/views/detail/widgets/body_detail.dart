import 'package:booking_movie_ticket/app/common/utils/value/styles/app_text_style.dart';
import 'package:booking_movie_ticket/app/presentation/bloc/detail/detail_bloc.dart';
import 'package:booking_movie_ticket/app/presentation/response/response_detail_movie.dart';
import 'package:booking_movie_ticket/app/widgets/raise_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/read_more.dart';
import '../../../../widgets/try_again.dart';

class BodyDetail extends StatelessWidget {
  final int idMovie;

  const BodyDetail({Key? key, required this.idMovie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

    final DetailBloc _detailBloc = DetailBloc();
    return BlocBuilder<DetailBloc, DetailState>(
      bloc: _detailBloc,
      builder: (context, state) {
        if (state is DetailInitial) {
          _detailBloc.add(GetDetailMovie(id: idMovie));
          return SpinKitChasingDots(color: Colors.white, size: 30.sp);
        } else if (state is DetailLoading) {
          return SpinKitChasingDots(color: Colors.white, size: 30.sp);
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
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              _data.data!.imageOfMovie![0].url.toString()),
                          fit: BoxFit.cover),
                    ),
                    padding: EdgeInsets.only(left: 1.sp, top: 0.sp)),
                Padding(
                  padding: EdgeInsets.only(top: 250.sp, bottom: 20.sp),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    runSpacing: 20.sp,
                    children: [
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: _data.data!.name!
                              .substring(0, (_data.data!.name!.indexOf(' '))),
                          style: AppTextStyle.st20700,
                          children: [
                            TextSpan(
                              text: _data.data!.name!
                                  .substring(_data.data!.name!.indexOf(' '))
                                  .replaceFirst(' ', '\n')
                                  .toString(),
                              style: AppTextStyle.st14700,
                            )
                          ],
                        ),
                      ),
                      Center(
                        child: DescriptionTextWidget(
                          text: _data.data!.description.toString(),
                        ),
                      ),
                      const Spacer(),
                      RaisedGradientButton(
                        child: Text('Reservation', style: AppTextStyle.st17500),
                        gradient: const LinearGradient(
                          colors: <Color>[
                            Color.fromRGBO(182, 17, 107, 1),
                            Color.fromRGBO(59, 21, 120, 1),
                          ],
                        ),
                        onPressed: () async {
                          SharedPreferences prefs = await _prefs;
                          prefs.setInt('idMovie', idMovie);
                          Navigator.pushNamed(context, '/movie-theater');
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        }
        return TryAgain(
          press: () {
            _detailBloc.add(GetDetailMovie(id: idMovie));
          },
        );
      },
    );
  }
}
