import 'package:http/http.dart' as http;
import 'errors/api_error.dart';

abstract class ApiResponse {
  static getResponse(
      {http.Response? response, bool isCheckTokenExpired = true}) {
    switch (response!.statusCode) {
      case 200:
      case 201:
      case 202:
        return null;
      case 400:
        return serverError("Bad Request");
      case 401:
        return serverError("Unauthorized");
      case 404:
        return serverError("Not found");
      case 408:
        return serverError("Request Timeout");
      case 500:
        return serverError('Internal Server Error');
      case 501:
        return serverError('Not Implemented');
      case 502:
        return serverError('Bad Gateway');
      case 503:
        return serverError('Service Unavailable');
      case 504:
        return serverError('Gateway Timeout');
      case 505:
        return serverError('HTTP Version Not Supported');
      case 506:
        return serverError('Variant Also Negotiates');
      case 507:
        return serverError('Insufficient Storage');
      case 508:
        return serverError('Loop Detected');
      case 509:
        return serverError('Bandwidth Limit Exceeded');
      case 510:
        return serverError('Not Extended');
      case 511:
        return serverError('Network Authentication Required');
      default:
        return serverError('No Code');
    }
  }

  static ApiError serverError(String error) {
    return ApiError(type: ErrorType.response, error: error);
  }
}
