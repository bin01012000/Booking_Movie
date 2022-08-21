import 'package:booking_movie_ticket/app/common/utils/extensions.dart';
import 'package:booking_movie_ticket/app/common/utils/value/styles/app_text_style.dart';
import 'package:booking_movie_ticket/app/presentation/bloc/auth/auth_bloc.dart';
import 'package:booking_movie_ticket/app/presentation/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class BodyUser extends StatefulWidget {
  const BodyUser({Key? key}) : super(key: key);

  @override
  State<BodyUser> createState() => _BodyUserState();
}

class _BodyUserState extends State<BodyUser> {
  @override
  void initState() {
    super.initState();
    printToken();
  }

  printToken() async {
    FlutterSecureStorage _storage = const FlutterSecureStorage();
    final token = await _storage.read(key: 'token');
    print(token.toString());
  }

  @override
  Widget build(BuildContext context) {
    AuthBloc _authBloc = AuthBloc(AuthRepository());
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthAuthenticated) {
          return GestureDetector(
            onTap: () {
              _authBloc.add(LoggedOut());
              Navigator.pushNamedAndRemoveUntil(
                  context, '/login', (route) => false);
            },
            child: Text(
              "Sign out",
              style: AppTextStyle.st20700,
            ).center,
          );
        } else if (state is AuthUnauthenticated) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/login', (route) => false);
            },
            child: Text(
              "Please sign in",
              style: AppTextStyle.st20700,
            ).center,
          );
        }
        return Container();
      },
    );
  }
}
