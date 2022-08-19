import 'package:booking_movie_ticket/app/data/api_methods.dart';
import 'package:booking_movie_ticket/app/data/api_urls.dart';
import 'package:booking_movie_ticket/app/presentation/response/response_banner.dart';
import 'package:booking_movie_ticket/app/presentation/response/response_movie.dart';

class HomeRepository {
  Future<ResponseMovie> getAllMovie() async {
    Map<String, dynamic>? dataResponse =
        await ApiMethods().get(apiUrl: ApiUrl.getAllMovie, hasToken: false);

    if (dataResponse == null) throw _NetworkError();

    return ResponseMovie.fromJson(dataResponse);
  }

  Future<ResponseBanner> getBanner() async {
    Map<String, dynamic>? dataResponse =
        await ApiMethods().get(apiUrl: ApiUrl.getBanner, hasToken: false);

    if (dataResponse == null) throw _NetworkError();

    return ResponseBanner.fromJson(dataResponse);
  }

  static final HomeRepository _instance = HomeRepository._internal();

  factory HomeRepository() {
    return _instance;
  }

  HomeRepository._internal();
}

class _NetworkError extends Error {}
