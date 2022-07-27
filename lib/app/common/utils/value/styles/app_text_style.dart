import 'package:booking_movie_ticket/app/common/utils/value/app_color.dart';
import 'package:booking_movie_ticket/app/common/utils/value/styles/dimens.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  const AppTextStyle._();

  static final TextStyle st14300 = GoogleFonts.poppins(
      textStyle: TextStyle(
    color: Colors.white,
    fontSize: Dimens.fontSize14,
    fontWeight: FontWeight.w300,
    decoration: TextDecoration.none,
  ));
  static final TextStyle st14400 = GoogleFonts.poppins(
      textStyle: TextStyle(
    color: Colors.white,
    fontSize: Dimens.fontSize14,
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.none,
  ));

  static final TextStyle st18500 = GoogleFonts.poppins(
      textStyle: TextStyle(
    color: Colors.white,
    letterSpacing: 0.5,
    fontSize: Dimens.fontSize18,
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.none,
  ));

  static final TextStyle st14500 = GoogleFonts.poppins(
      textStyle: TextStyle(
    color: Colors.white,
    fontSize: Dimens.fontSize14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
    decoration: TextDecoration.none,
  ));
  static final TextStyle st18600 = GoogleFonts.poppins(
      textStyle: TextStyle(
    color: Colors.white,
    fontSize: Dimens.fontSize18,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
    decoration: TextDecoration.none,
  ));

  static final TextStyle st17700 = GoogleFonts.poppins(
      textStyle: TextStyle(
    color: Colors.white,
    fontSize: Dimens.fontSize17,
    letterSpacing: 0.5,
    fontWeight: FontWeight.w700,
    decoration: TextDecoration.none,
  ));

  static final TextStyle st14700 = GoogleFonts.poppins(
      textStyle: TextStyle(
    color: Colors.white,
    fontSize: Dimens.fontSize14,
    letterSpacing: 0.5,
    fontWeight: FontWeight.w700,
    decoration: TextDecoration.none,
  ));

  static final TextStyle st20700 = GoogleFonts.poppins(
      textStyle: TextStyle(
    color: Colors.white,
    fontSize: Dimens.fontSize20,
    fontWeight: FontWeight.w700,
    decoration: TextDecoration.none,
  ));

  static final TextStyle placeholder = GoogleFonts.poppins(
      textStyle: TextStyle(
    color: AppColors.kPlaceholderColor,
    fontSize: Dimens.fontSize17,
    fontWeight: FontWeight.w700,
    decoration: TextDecoration.none,
  ));
}
