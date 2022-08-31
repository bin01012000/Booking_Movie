import 'package:booking_movie_ticket/app/presentation/views/signup/widgets/body_signup.dart';
import 'package:flutter/material.dart';
import 'package:gradient_like_css/gradient_like_css.dart';

import '../../repository/signup_repository.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignUpRepository signUpRepository = SignUpRepository();
    return Container(
      decoration: BoxDecoration(
        gradient: linearGradient(170, ['#2e1371 2.71%', '#130b2b 97.75%']),
      ),
      child: Scaffold(
        appBar: AppBar(
          bottomOpacity: 0.0,
          elevation: 0.0,
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: linearGradient(170, ['#2e1371 2.71%']),
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(false),
          ),
          title: const Text('Sign Up Page'),
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: const BodySignUp(),
      ),
    );
  }
}
