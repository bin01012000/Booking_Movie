import '../../data/api_methods.dart';
import '../../data/api_urls.dart';
import '../response/response_scheduled_movie.dart';

class ScheduleRepository {
  Future<ResponseScheduledMovie> getScheduleMovie(
      int idMovie, int idTheater) async {
    Map<String, dynamic>? dataResponse = await ApiMethods().get(
        apiUrl: ApiUrl.getScheduleMovie
            .replaceAll('[IDMOVIE]', idMovie.toString())
            .replaceAll('[IDTHEATER]', idTheater.toString()),
        hasToken: false);

    if (dataResponse == null) {
      throw _NetworkError();
    }

    return ResponseScheduledMovie.fromJson(dataResponse);
  }

  static final ScheduleRepository _instance = ScheduleRepository._internal();

  factory ScheduleRepository() {
    return _instance;
  }

  ScheduleRepository._internal();
}

class _NetworkError extends Error {}
