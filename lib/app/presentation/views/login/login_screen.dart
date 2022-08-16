import 'package:booking_movie_ticket/app/common/utils/value/styles/app_text_style.dart';
import 'package:booking_movie_ticket/app/presentation/repository/auth_repository.dart';
import 'package:booking_movie_ticket/app/presentation/views/login/widgets/body_login.dart';
import 'package:flutter/material.dart';
import 'package:gradient_like_css/gradient_like_css.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthRepository authRepository = AuthRepository();
    return Container(
      decoration: BoxDecoration(
        gradient: linearGradient(170, ['#2e1371 2.71%', '#130b2b 97.75%']),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: BodyLogin(authRepository: authRepository),
      ),
    );
  }
}
