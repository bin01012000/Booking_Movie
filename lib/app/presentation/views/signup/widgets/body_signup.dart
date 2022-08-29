import 'package:booking_movie_ticket/app/presentation/views/signup/widgets/chosses_birthday.dart';
import 'package:booking_movie_ticket/app/presentation/views/signup/widgets/chosses_gender.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';

import '../../../../common/utils/value/styles/app_text_style.dart';
import '../../../../widgets/raise_button.dart';
import '../../../bloc/signup/signup_bloc.dart';
import '../../../repository/signup_repository.dart';

class BodySignUp extends StatelessWidget {
  const BodySignUp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final TextEditingController _fullNameController = TextEditingController();
    bool _gender = true;
    final TextEditingController _addressController = TextEditingController();
    final TextEditingController _phoneController = TextEditingController();
    int _cityCode = 294;
    int _districtCode = 491;
    int _wardCode = 10510;
    final TextEditingController _birthdayController = TextEditingController();
    DateTime day = DateTime.now();
    _onSubmitSignUp() {
      BlocProvider.of<SignUpBloc>(context, listen: false)
          .add(SignUpButtonPressed(
        email: _emailController.text,
        password: _passwordController.text,
        fullName: _fullNameController.text,
        gender: _gender,
        birthday: day,
        cityCode: _cityCode,
        districtCode: _districtCode,
        wardCode: _wardCode,
        address: _addressController.text,
        phone: _phoneController.text,
      ));
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

    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) {
        if (state is SignUpSuccess) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/login', (route) => false);
          });
        }
        return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(
                    top: 50.sp, left: 50.sp, right: 50.sp, bottom: 50.sp),
                child: Wrap(
                  runSpacing: 30.sp,
                  children: [
                    Center(
                      child: Text(
                        'Sign Up Page',
                        style: AppTextStyle.st18600,
                      ),
                    ),
                    TextFormField(
                      controller: _emailController,
                      style: const TextStyle(color: Colors.white, fontSize: 15),
                      decoration: const InputDecoration(
                        icon: Icon(
                          Icons.email,
                          color: Colors.white,
                        ),
                        border: UnderlineInputBorder(),
                        labelText: 'Email',
                        labelStyle:
                            TextStyle(color: Colors.white, fontSize: 15),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => _validateEmail(value),
                    ),
                    TextFormField(
                      controller: _passwordController,
                      style: const TextStyle(color: Colors.white, fontSize: 15),
                      obscureText: true,
                      decoration: const InputDecoration(
                        icon: Icon(
                          Icons.key,
                          color: Colors.white,
                        ),
                        focusColor: Colors.white,
                        border: UnderlineInputBorder(),
                        labelText: 'Password',
                        labelStyle:
                            TextStyle(color: Colors.white, fontSize: 15),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => _validatePassword(value),
                    ),
                    TextFormField(
                      controller: _fullNameController,
                      style: const TextStyle(color: Colors.white, fontSize: 15),
                      decoration: const InputDecoration(
                        icon: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        border: UnderlineInputBorder(),
                        labelText: 'Full Name',
                        labelStyle:
                            TextStyle(color: Colors.white, fontSize: 15),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    ChossesGender(
                      gender: _gender,
                    ),
                    ChossesBirthday(
                      birthdayController: _birthdayController,
                    ),
                    TextFormField(
                      controller: _addressController,
                      style: const TextStyle(color: Colors.white, fontSize: 15),
                      decoration: const InputDecoration(
                        icon: Icon(
                          Icons.home,
                          color: Colors.white,
                        ),
                        border: UnderlineInputBorder(),
                        labelText: 'Address',
                        labelStyle:
                            TextStyle(color: Colors.white, fontSize: 15),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    TextFormField(
                      controller: _phoneController,
                      style: const TextStyle(color: Colors.white, fontSize: 15),
                      decoration: const InputDecoration(
                        icon: Icon(
                          Icons.phone,
                          color: Colors.white,
                        ),
                        border: UnderlineInputBorder(),
                        labelText: 'Phone',
                        labelStyle:
                            TextStyle(color: Colors.white, fontSize: 15),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    RaisedGradientButton(
                      child: state is SignUpLoading
                          ? SpinKitThreeBounce(
                              size: 30.sp,
                              color: Colors.white,
                            )
                          : Text('Sign Up', style: AppTextStyle.st20700),
                      gradient: const LinearGradient(
                        colors: <Color>[
                          Color.fromRGBO(182, 17, 107, 1),
                          Color.fromRGBO(59, 21, 120, 1),
                        ],
                      ),
                      onPressed: () {
                        _onSubmitSignUp();
                      },
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
