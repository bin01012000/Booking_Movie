import 'package:booking_movie_ticket/app/presentation/views/signup/widgets/body_signup.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class AlertSuccess extends StatelessWidget {
  const AlertSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return showAlertDialog(context);
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: const Text("Back to Login"),
      onPressed: () {
        Navigator.pushNamed(context, '/login');
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Sign up Success !"),
      content: const Text("Check your mail to active"),
      actions: [
        okButton,
      ],
    );
    Future.delayed(Duration.zero, () {
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    });
    return const Text("");
    // show the dialog
  }
}
