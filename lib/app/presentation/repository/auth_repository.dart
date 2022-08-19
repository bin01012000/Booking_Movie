import 'package:booking_movie_ticket/app/data/api_methods.dart';
import 'package:booking_movie_ticket/app/data/api_urls.dart';
import 'package:booking_movie_ticket/app/presentation/response/response_login.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthRepository {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<ResponseLogin> login({String? email, String? password}) async {
    Map<String, dynamic> data = <String, dynamic>{};
    data["email"] = email;
    data["password"] = password;
    Map<String, dynamic>? dataResponse = await ApiMethods()
        .post(data: data, apiUrl: ApiUrl.login, hasToken: false);

    if (dataResponse == null) {
      throw _NetworkError();
    }

    return ResponseLogin.fromJson(dataResponse);
  }

  Future<bool> hasToken() async {
    var value = await _storage.read(key: 'token');
    if (value != null) return true;
    return false;
  }

  Future<void> persistToken(String token) async {
    await _storage.write(key: 'token', value: token);
  }

  Future<void> deleteToken() async {
    _storage.delete(key: 'token');
    _storage.deleteAll();
  }

  static final AuthRepository _instance = AuthRepository._internal();

  factory AuthRepository() {
    return _instance;
  }

  AuthRepository._internal();
}

class _NetworkError extends Error {}
