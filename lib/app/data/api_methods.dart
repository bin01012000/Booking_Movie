// ignore_for_file: avoid_print, unused_local_variable

import 'dart:convert';

// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class ApiMethods {
  final Map<String, String> _headers = <String, String>{
    "content-type": "application/json",
  };
  final storage = const FlutterSecureStorage();

  get({
    required String apiUrl,
    String data = '',
    bool hasToken = true,
  }) async {
    apiUrl += data != '' ? '?$data' : '';

    if (hasToken) {
      String? token = await storage.read(key: "token");

      _headers.addAll({'Authorization': 'Bearer $token'});
    }

    try {
      http.Response response =
          await http.get(Uri.parse(apiUrl), headers: _headers);

      return jsonDecode(utf8.decode(response.bodyBytes));
    } catch (e) {
      print("Server Error: $e");
      return null;
    }
  }

  delete({
    required String apiUrl,
  }) async {
    String? token = await storage.read(key: "token");

    _headers.addAll({'Authorization': 'Bearer $token'});

    try {
      http.Response response;
      response = await http.delete(Uri.parse(apiUrl), headers: _headers);
      print(_headers);
      var dataResult = jsonDecode(response.body);

      return dataResult;
    } catch (e) {
      print("Lỗi Server $apiUrl: $e");
      return null;
    }
  }

  post({
    required Map<String, dynamic>? data,
    required String apiUrl,
    bool hasToken = true,
    type = 'post',
  }) async {
    if (hasToken) {
      String? token = await storage.read(key: "token");
      _headers.addAll({'Authorization': 'Bearer $token'});
    }

    try {
      http.Response response;
      print(_headers);

      if (type == 'post') {
        response = await http.post(Uri.parse(apiUrl),
            body: json.encode(data), headers: _headers);
      } else {
        data = data;
        response = await http.put(Uri.parse(apiUrl),
            body: json.encode(data), headers: _headers);
      }
      var dataResult = jsonDecode(response.body);
      return dataResult;
    } catch (e) {
      print("Server Error $apiUrl: $e");
      return null;
    }
  }

  patch({
    required Map<String, dynamic>? data,
    required String apiUrl,
    bool hasToken = true,
  }) async {
    if (hasToken) {
      String? token = await storage.read(key: "token");

      _headers.addAll({'Authorization': 'Bearer $token'});
    }

    try {
      http.Response response;
      print(_headers);

      response = await http.patch(Uri.parse(apiUrl),
          body: json.encode(data), headers: _headers);

      var dataResult = jsonDecode(response.body);
      return dataResult;
    } catch (e) {
      print("Server Error $apiUrl: $e");
      return null;
    }
  }

  upload({
    required List<int>? data,
    required String apiUrl,
    bool hasToken = true,
    isCheckTokenExpired = true,
    type = 'post',
  }) async {
    if (hasToken) {
      String? token = await storage.read(key: "token");

      _headers.addAll({'Authorization': 'Bearer $token'});
    }

    http.Response response;

    if (type == 'post') {
      response = await http.post(Uri.parse(apiUrl),
          body: json.encode(data), headers: _headers);
    } else {
      data = data;
      _headers.addAll({'Content-Type': 'image/jpeg'});
      response =
          await http.put(Uri.parse(apiUrl), body: data, headers: _headers);
    }

    return false;
  }
}

jsonToFormData(http.MultipartRequest request, Map<String, dynamic> data) {
  for (var key in data.keys) {
    request.fields[key] = data[key].toString();
  }
  return request;
}
