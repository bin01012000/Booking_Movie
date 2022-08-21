// ignore_for_file: constant_identifier_names

import 'package:booking_movie_ticket/app/common/utils/value/styles/theme.dart';
import 'package:booking_movie_ticket/app/presentation/bloc/auth/auth_bloc.dart';
import 'package:booking_movie_ticket/app/presentation/bloc/banner/banner_bloc.dart';
import 'package:booking_movie_ticket/app/presentation/bloc/detail/detail_bloc.dart';
import 'package:booking_movie_ticket/app/presentation/bloc/home/home_bloc.dart';
import 'package:booking_movie_ticket/app/presentation/bloc/login/login_bloc.dart';
import 'package:booking_movie_ticket/app/presentation/repository/auth_repository.dart';
import 'package:booking_movie_ticket/app/route/app_pages.dart';
import 'package:booking_movie_ticket/simple_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const String MATERIAL_SCREEN = "/material_screen";
const String CUPERTINO_SCREEN = "/cupertino_screen";

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Paint.enableDithering = true;
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  BlocOverrides.runZoned(
    () {
      runApp(const MyApp());
    },
    blocObserver: SimpleBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthRepository authRepository = AuthRepository();
    final AuthBloc authBloc = AuthBloc(authRepository);
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: const Size(390, 844),
      builder: (BuildContext context, Widget? child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<AuthBloc>(
                create: (context) =>
                    AuthBloc(authRepository)..add(AppStarted())),
            BlocProvider<LoginBloc>(
                create: (context) => LoginBloc(
                    authRepository: authRepository, authBloc: authBloc)),
            BlocProvider<HomeBloc>(create: (context) => HomeBloc()),
            BlocProvider<BannerBloc>(create: (context) => BannerBloc()),
            BlocProvider<DetailBloc>(create: (context) => DetailBloc()),
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
