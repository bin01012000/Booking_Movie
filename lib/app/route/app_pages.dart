import 'package:booking_movie_ticket/app/presentation/views/detail/detail_screen.dart';
import 'package:booking_movie_ticket/app/presentation/views/home/home_screen.dart';
import 'package:flutter/material.dart';

part 'app_routes.dart';

class AppPages {
  const AppPages._();
  static const initial = '/home';

  static get routes => <String, Widget Function(BuildContext)>{
        '/home': (context) => const HomeScreen(),
        '/detail': (context) => const DetailScreen(),
      };
}
