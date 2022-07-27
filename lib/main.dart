import 'package:booking_movie_ticket/app/presentation/views/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const String MATERIAL_SCREEN = "/material_screen";
const String CUPERTINO_SCREEN = "/cupertino_screen";

void main() {
  Paint.enableDithering = true;
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          title: 'Booking Movie Ticket',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primaryColor: Colors.transparent),
          initialRoute: '/',
          routes: {
            '/': (context) => HomeScreen(),
          },
        );
      },
    );
  }
}
