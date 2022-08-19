import 'package:booking_movie_ticket/app/common/utils/value/styles/app_text_style.dart';
import 'package:booking_movie_ticket/app/presentation/bloc/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gradient_like_css/gradient_like_css.dart';

class BodySplash extends StatelessWidget {
  const BodySplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        Future.delayed(const Duration(milliseconds: 1500), () {
          if (state is AuthAuthenticated) {
            WidgetsBinding.instance!.addPostFrameCallback((_) {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/homeview', (route) => false);
            });
          } else if (state is AuthUnauthenticated) {
            WidgetsBinding.instance!.addPostFrameCallback((_) {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/login', (route) => false);
            });
          }
        });
        return const ContentSplash();
      },
    );
  }
}

class ContentSplash extends StatelessWidget {
  const ContentSplash({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 1.sh,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: linearGradient(170.53, ['#2e1371 2.71%', '#130b2b 97.75%']),
      ),
      child: Wrap(
        direction: Axis.horizontal,
        runSpacing: 40.sp,
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40.sp, vertical: 20.sp),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.sp)),
              gradient: const LinearGradient(
                colors: <Color>[
                  Color.fromRGBO(182, 17, 107, 1),
                  Color.fromRGBO(59, 21, 120, 1),
                ],
              ),
            ),
            child: Text(
              "Booking Movies",
              style: AppTextStyle.st15700.copyWith(color: Colors.white),
            ),
          ),
          SpinKitWave(
            color: Colors.white,
            size: 30.sp,
          ),
        ],
      ),
    );
  }
}
