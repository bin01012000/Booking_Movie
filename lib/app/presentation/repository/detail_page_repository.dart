import '../../data/api_methods.dart';
import '../../data/api_urls.dart';
import '../response/response_detail_movie.dart';

class DetailPageRepository {
  Future<ResponseDetailMovie> getDetailMovie(int id) async {
    Map<String, dynamic>? dataResponse = await ApiMethods().get(
        apiUrl: ApiUrl.getDetailMovie.replaceAll('[IDMOVIE]', id.toString()),
        hasToken: false);

    if (dataResponse == null) {
      throw _NetworkError();
    }

    return ResponseDetailMovie.fromJson(dataResponse);
  }

  static final DetailPageRepository _instance =
      DetailPageRepository._internal();

  factory DetailPageRepository() {
    return _instance;
  }

  DetailPageRepository._internal();
}

class _NetworkError extends Error {}
