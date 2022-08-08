import 'package:booking_movie_ticket/app/presentation/views/detail/widgets/body_detail.dart';
import 'package:flutter/material.dart';
import 'package:gradient_like_css/gradient_like_css.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      backgroundColor: Color.fromARGB(255, 23, 12, 53),
      body: BodyDetail(),
    );
  }
}
