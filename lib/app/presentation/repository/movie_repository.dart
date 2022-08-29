import 'package:booking_movie_ticket/app/data/api_methods.dart';
import 'package:booking_movie_ticket/app/data/api_urls.dart';
import 'package:booking_movie_ticket/app/presentation/response/response_banner.dart';
import 'package:booking_movie_ticket/app/presentation/response/response_movie.dart';

class MovieRepository {
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

  static final MovieRepository _instance = MovieRepository._internal();

  factory MovieRepository() {
    return _instance;
  }

  MovieRepository._internal();
}

class _NetworkError extends Error {}
