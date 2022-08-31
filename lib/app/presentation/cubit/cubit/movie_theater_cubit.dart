import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../repository/movie_theater_repository.dart';
import '../../response/response_movie_theater.dart';

part 'movie_theater_state.dart';

class MovieTheaterCubit extends Cubit<MovieTheaterState> {
  MovieTheaterCubit() : super(MovieTheaterInitial());
  final MovieTheaterRepository _movieTheaterRepository =
      MovieTheaterRepository();
  void getListMovieTheater() async {
    emit(MovieTheaterLoading());
    try {
      ResponseMovieTheater res =
          await _movieTheaterRepository.getListMovieTheater();
      if (res.errCode == 0) {
        emit(MovieTheaterSuccess(res));
      } else {
        emit(MovieTheaterFailure());
      }
    } catch (e) {
      emit(MovieTheaterFailure());
    }
  }
}
