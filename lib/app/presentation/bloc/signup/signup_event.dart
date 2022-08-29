part of 'signup_bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class SignUpButtonPressed extends SignUpEvent {
  final String email;
  final String password;
  final String fullName;
  final bool gender;
  final DateTime birthday;
  final int cityCode;
  final int districtCode;
  final int wardCode;
  final String address;
  final String phone;

  const SignUpButtonPressed(
      {required this.email,
      required this.password,
      required this.fullName,
      required this.gender,
      required this.birthday,
      required this.cityCode,
      required this.districtCode,
      required this.wardCode,
      required this.address,
      required this.phone});

  @override
  List<Object> get props => [
        email,
        password,
        fullName,
        gender,
        birthday,
        cityCode,
        districtCode,
        wardCode,
        address,
        phone
      ];

  @override
  String toString() => 'SignUpButtonPressed email: $email, password: $password';
}
