import '../../data/api_methods.dart';
import '../../data/api_urls.dart';
import '../response/response_schedule.dart';
import '../response/response_detail_movie.dart';

class ScheduleRepository {
  Future<ScheduleMovie> getScheduleMovie(int id) async {
    Map<String, dynamic>? dataResponse = await ApiMethods().get(
        apiUrl: ApiUrl.getScheduleMovie.replaceAll('[IDMOVIE]', id.toString()),
        hasToken: false);

    if (dataResponse == null) {
      throw _NetworkError();
    }

    return ScheduleMovie.fromJson(dataResponse);
  }

  static final ScheduleRepository _instance = ScheduleRepository._internal();

  factory ScheduleRepository() {
    return _instance;
  }

  ScheduleRepository._internal();
}

class _NetworkError extends Error {}
