part of 'movie_theater_bloc.dart';

abstract class MovieTheaterEvent extends Equatable {
  const MovieTheaterEvent();

  @override
  List<Object> get props => [];
}

class GetListMovieTheater extends MovieTheaterEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'Getting list movie theater';
}
