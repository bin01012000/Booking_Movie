import 'package:booking_movie_ticket/app/common/utils/value/styles/app_text_style.dart';
import 'package:booking_movie_ticket/app/presentation/bloc/login/login_bloc.dart';
import 'package:booking_movie_ticket/app/presentation/repository/auth_repository.dart';
import 'package:booking_movie_ticket/app/widgets/raise_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class BodyLogin extends StatelessWidget {
  const BodyLogin({Key? key, required this.authRepository}) : super(key: key);
  final AuthRepository authRepository;
  @override
  Widget build(BuildContext context) {
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();
    final formGlobalKey = GlobalKey<FormState>();

    _onSubmitLogin() {
      context.read<LoginBloc>().add(LoginButtonPressed(
          email: _emailController.text, password: _passwordController.text));
    }

    String? _validateEmail(String? value) {
      String pattern =
          r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
          r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
          r"{0,253}[a-zA-Z0-9])?)*$";
      RegExp regex = RegExp(pattern);
      if (value == null || value.isEmpty || !regex.hasMatch(value)) {
        return 'Enter a valid email address';
      } else {
        return null;
      }
    }

    String? _validatePassword(String? value) {
      if (value == null || value.isEmpty) {
        return 'Password can\'t empty';
      } else if (value.length < 8) {
        return 'Password must not be less than 8 characters';
      } else {
        return null;
      }
    }

    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        if (state is LoginSuccess) {
          WidgetsBinding.instance?.addPostFrameCallback((_) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/homeview', (route) => false);
          });
        }
        return Container(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.only(left: 30.sp, right: 30.sp),
            child: Form(
              key: formGlobalKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
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
                    validator: (value) => _validateEmail(value),
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
                    validator: (value) => _validatePassword(value),
                  ),
                  RaisedGradientButton(
                    child: state is LoginLoading
                        ? SpinKitThreeBounce(
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
                      if (formGlobalKey.currentState!.validate()) {
                        formGlobalKey.currentState!.save();
                        _onSubmitLogin();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
