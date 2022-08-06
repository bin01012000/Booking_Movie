import 'package:booking_movie_ticket/app/presentation/views/detail/widgets/body_detail.dart';
import 'package:flutter/material.dart';
import 'package:gradient_like_css/gradient_like_css.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: linearGradient(170, ['#2e1371 2.71%', '#130b2b 97.75%']),
      ),
      child: const BodyDetail(),
    );
  }
}
