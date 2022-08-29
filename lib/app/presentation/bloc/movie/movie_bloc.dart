import 'package:bloc/bloc.dart';
import 'package:booking_movie_ticket/app/presentation/repository/movie_repository.dart';
import 'package:booking_movie_ticket/app/presentation/response/response_movie.dart';
import 'package:equatable/equatable.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieRepository _homeRepository = MovieRepository();
  MovieBloc() : super(MovieInitial()) {
    on<GetMovie>((event, emit) async {
      emit(MovieLoading());
      try {
        ResponseMovie res = await _homeRepository.getAllMovie();
        if (res.errCode == 0 && res.dataMovie != null) {
          emit(MovieSuccess(res));
        } else {
          emit(MovieFailure());
        }
      } catch (e) {
        emit(MovieFailure());
        rethrow;
      }
    });
  }
}
