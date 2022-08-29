import 'package:bloc/bloc.dart';
import 'package:booking_movie_ticket/app/presentation/repository/movie_theater_repository.dart';
import 'package:booking_movie_ticket/app/presentation/response/response_movie_theater.dart';
import 'package:equatable/equatable.dart';

part 'movie_theater_event.dart';
part 'movie_theater_state.dart';

class MovieTheaterBloc extends Bloc<MovieTheaterEvent, MovieTheaterState> {
  final MovieTheaterRepository _movieTheaterRepository =
      MovieTheaterRepository();
  MovieTheaterBloc() : super(MovieTheaterInitial()) {
    on<GetListMovieTheater>((event, emit) async {
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
    });
  }
}
