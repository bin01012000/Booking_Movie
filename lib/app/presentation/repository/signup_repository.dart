import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../data/api_methods.dart';
import '../../data/api_urls.dart';
import '../response/response_register.dart';

class SignUpRepository {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<SignUpResponse> register(
      {String? email,
      String? password,
      String? fullName,
      bool? gender,
      DateTime? birthday,
      int? cityCode,
      int? districtCode,
      int? wardCode,
      String? address,
      String? phone}) async {
    Map<String, dynamic> data = <String, dynamic>{};
    data["email"] = email;
    data["password"] = password;
    data["fullName"] = fullName;
    data["gender"] = gender;
    data["birthday"] = birthday.toString();
    data["cityCode"] = cityCode;
    data["districtCode"] = districtCode;
    data["wardCode"] = wardCode;
    data["address"] = address;
    data["phone"] = phone;
    Map<String, dynamic>? dataResponse = await ApiMethods()
        .post(data: data, apiUrl: ApiUrl.register, hasToken: false);
    if (dataResponse == null) {
      throw _NetworkError();
    }

    return SignUpResponse.fromJson(dataResponse);
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

  static final SignUpRepository _instance = SignUpRepository._internal();

  factory SignUpRepository() {
    return _instance;
  }

  SignUpRepository._internal();
}

class _NetworkError extends Error {}
