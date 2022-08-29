import 'package:booking_movie_ticket/app/data/api_methods.dart';
import 'package:booking_movie_ticket/app/data/api_urls.dart';
import 'package:booking_movie_ticket/app/presentation/response/response_movie_theater.dart';

class MovieTheaterRepository {
  Future<ResponseMovieTheater> getListMovieTheater() async {
    Map<String, dynamic>? dataResponse = await ApiMethods()
        .get(apiUrl: ApiUrl.getListMovieTheater, hasToken: false);

    if (dataResponse == null) throw _NetworkError();

    return ResponseMovieTheater.fromJson(dataResponse);
  }

  static final MovieTheaterRepository _instance =
      MovieTheaterRepository._internal();

  factory MovieTheaterRepository() {
    return _instance;
  }

  MovieTheaterRepository._internal();
}

class _NetworkError extends Error {}
