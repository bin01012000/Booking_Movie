import 'package:booking_movie_ticket/app/common/utils/value/styles/app_text_style.dart';
import 'package:booking_movie_ticket/app/presentation/bloc/auth/auth_bloc.dart';
import 'package:booking_movie_ticket/app/presentation/bloc/login/login_bloc.dart';
import 'package:booking_movie_ticket/app/presentation/repository/auth_repository.dart';
import 'package:booking_movie_ticket/app/widgets/raise_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class BodyLogin extends StatefulWidget {
  const BodyLogin({Key? key, required this.authRepository}) : super(key: key);
  final AuthRepository authRepository;

  @override
  State<BodyLogin> createState() => _BodyLoginState();
}

class _BodyLoginState extends State<BodyLogin> {
  @override
  Widget build(BuildContext context) {
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();
    _onSubmitLogin() {
      BlocProvider.of<LoginBloc>(context, listen: false).add(LoginButtonPressed(
          email: _emailController.text, password: _passwordController.text));
    }

    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Container(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.only(left: 30.sp, right: 30.sp),
            child: Wrap(
              runSpacing: 30.sp,
              children: [
                TextFormField(
                  controller: _emailController,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.white, fontSize: 20),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                  ),
                ),
                TextFormField(
                  controller: _passwordController,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                  obscureText: true,
                  decoration: const InputDecoration(
                    focusColor: Colors.white,
                    border: UnderlineInputBorder(),
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.white, fontSize: 20),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                  ),
                ),
                RaisedGradientButton(
                  child: state is LoginLoading
                      ? SpinKitChasingDots(
                          size: 30.sp,
                          color: Colors.white,
                        )
                      : Text('Login', style: AppTextStyle.st20700),
                  gradient: const LinearGradient(
                    colors: <Color>[
                      Color.fromRGBO(182, 17, 107, 1),
                      Color.fromRGBO(59, 21, 120, 1),
                    ],
                  ),
                  onPressed: () {
                    _onSubmitLogin();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
