import 'dart:ui';

import 'package:flutter/material.dart';

class BackgroundColorPosition extends StatelessWidget {
  const BackgroundColorPosition({
    Key? key,
    required this.bgColor,
  }) : super(key: key);
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: bgColor,
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(
            sigmaX: 140, sigmaY: 140, tileMode: TileMode.mirror),
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.transparent,
          ),
        ),
      ),
    );
  }
}
