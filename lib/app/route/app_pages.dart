import 'package:booking_movie_ticket/app/presentation/views/detail/detail_screen.dart';
import 'package:booking_movie_ticket/app/presentation/views/home/home_screen.dart';
import 'package:booking_movie_ticket/app/presentation/views/home/home_view.dart';
import 'package:booking_movie_ticket/app/presentation/views/seat/seat_screen.dart';
import 'package:booking_movie_ticket/app/presentation/views/ticket/mobile_ticket_screen.dart';
import 'package:flutter/material.dart';

part 'app_routes.dart';

class AppPages {
  const AppPages._();
  static const initial = '/homeview';

  static get routes => <String, Widget Function(BuildContext)>{
        '/homeview': (context) => const HomeView(),
        '/home': (context) => const HomeScreen(),
        '/detail': (context) => const DetailScreen(),
        '/mobileticket': (context) => const MobileTicket(),
        '/seats': (context) => const SeatScreen(),
      };
}
