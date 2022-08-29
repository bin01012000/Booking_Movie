import 'package:booking_movie_ticket/app/common/utils/helper.dart';
import 'package:booking_movie_ticket/app/presentation/response/response_movie_theater.dart';
import 'package:booking_movie_ticket/app/widgets/image_network_custom.dart';
import 'package:flutter/material.dart';

class OneTheater extends StatelessWidget {
  const OneTheater(
      {Key? key,
      required this.urlImage,
      required this.nameTheater,
      required this.addressTheater})
      : super(key: key);
  final List<MovieTheaterImage> urlImage;
  final String nameTheater;
  final String addressTheater;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(child: ImageNetworkCustom(url: urlImage[0].url.toString())),
          Text(StringHelpers.convertNull(nameTheater)),
          Text(StringHelpers.convertNull(addressTheater)),
        ],
      ),
    );
  }
}
