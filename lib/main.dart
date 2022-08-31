import 'package:booking_movie_ticket/app/common/utils/value/styles/theme.dart';
import 'package:booking_movie_ticket/app/presentation/bloc/auth/auth_bloc.dart';
import 'package:booking_movie_ticket/app/presentation/bloc/banner/banner_bloc.dart';
import 'package:booking_movie_ticket/app/presentation/bloc/detail/detail_bloc.dart';
import 'package:booking_movie_ticket/app/presentation/bloc/login/login_bloc.dart';
import 'package:booking_movie_ticket/app/presentation/bloc/movie/movie_bloc.dart';
import 'package:booking_movie_ticket/app/presentation/repository/auth_repository.dart';
import 'package:booking_movie_ticket/app/presentation/repository/signup_repository.dart';
import 'package:booking_movie_ticket/app/route/app_pages.dart';
import 'package:booking_movie_ticket/simple_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app/presentation/bloc/schedule/schedule_bloc.dart';
import 'app/presentation/bloc/signup/signup_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Paint.enableDithering = true;
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthRepository authRepository = AuthRepository();
    final AuthBloc authBloc = AuthBloc(authRepository);
    final SignUpRepository signupRepository = SignUpRepository();

    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: const Size(390, 844),
      builder: (BuildContext context, Widget? child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<AuthBloc>(
                create: (context) =>
                    AuthBloc(authRepository)..add(AppStarted())),
            // BlocProvider<LoginBloc>(
            //     create: (context) => LoginBloc(
            //         authRepository: authRepository, authBloc: authBloc)),
            // BlocProvider<MovieBloc>(create: (context) => MovieBloc()),
            // BlocProvider<BannerBloc>(create: (context) => BannerBloc()),
            // BlocProvider<DetailBloc>(create: (context) => DetailBloc()),
            // BlocProvider<ScheduleBloc>(create: (context) => ScheduleBloc()),
            // BlocProvider<SignUpBloc>(
            //     create: (context) =>
            //         SignUpBloc(signupRepository: signupRepository)),
          ],
          child: MaterialApp(
            title: 'Booking Movie Ticket',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.theme,
            initialRoute: AppPages.initial,
            routes: AppPages.routes,
          ),
        );
      },
    );
  }
}
