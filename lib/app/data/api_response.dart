import 'package:http/http.dart' as http;
import 'errors/api_error.dart';

abstract class ApiResponse {
  static getResponse(
      {http.Response? response, bool isCheckTokenExpired = true}) {
    final status = response!.statusCode;
    if (status == 200 || status == 201 || status == 202) {
      return null;
    } else if (status == 400 && isCheckTokenExpired == false) {
      throw ApiError(
        type: ErrorType.unauthorize,
        error: 'Wrong password or email.',
      );
    } else if (status == 401) {
    } else if (response.statusCode == 408) {
      throw ApiError(
          type: ErrorType.connectTimeout, error: 'Connect time out.');
    } else if (response.statusCode <= 599 && response.statusCode >= 500) {
      // throw ApiError(type: ErrorType.response, error: 'Server Error.');
    }
  }
}
