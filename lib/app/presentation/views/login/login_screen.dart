import 'package:booking_movie_ticket/app/widgets/background_color_position.dart';
import 'package:booking_movie_ticket/app/widgets/raise_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_like_css/gradient_like_css.dart';

import '../../../common/utils/value/styles/app_text_style.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: linearGradient(170, ['#2e1371 2.71%', '#130b2b 97.75%']),
        ),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          extendBodyBehindAppBar: true,
          extendBody: true,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            centerTitle: true,
            backgroundColor: Colors.transparent,
            title: Text(
              "Choose Movie ",
              style: AppTextStyle.st20700,
            ),
          ),
          backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
          body: Stack(fit: StackFit.expand, children: [
            Positioned(
              right: 250.sp,
              top: -250.sp,
              bottom: 0,
              left: -250.sp,
              child: const BackgroundColorPosition(bgColor: Color(0xff60ffca)),
            ),
            Positioned(
              right: -320.sp,
              top: 0,
              bottom: -320.sp,
              left: 320.sp,
              child: const BackgroundColorPosition(bgColor: Color(0xffff53c0)),
            ),
            Container(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(left: 30.sp, right: 30.sp),
                  child: Wrap(
                    runSpacing: 30.sp,
                    children: [
                      TextFormField(
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Email',
                          labelStyle:
                              TextStyle(color: Colors.white, fontSize: 20),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                        ),
                      ),
                      TextFormField(
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                        obscureText: true,
                        decoration: const InputDecoration(
                          focusColor: Colors.white,
                          border: UnderlineInputBorder(),
                          labelText: 'Password',
                          labelStyle:
                              TextStyle(color: Colors.white, fontSize: 20),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                        ),
                      ),
                      RaisedGradientButton(
                        child: Text('Login', style: AppTextStyle.st20700),
                        gradient: const LinearGradient(
                          colors: <Color>[
                            Color.fromRGBO(182, 17, 107, 1),
                            Color.fromRGBO(59, 21, 120, 1),
                          ],
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                )),
          ]),
        ));
  }
}
