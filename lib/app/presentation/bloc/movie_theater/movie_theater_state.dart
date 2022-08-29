part of 'movie_theater_bloc.dart';

abstract class MovieTheaterState extends Equatable {
  const MovieTheaterState();

  @override
  List<Object> get props => [];
}

class MovieTheaterInitial extends MovieTheaterState {}

class MovieTheaterLoading extends MovieTheaterState {}

class MovieTheaterSuccess extends MovieTheaterState {
  final ResponseMovieTheater responseMovieTheater;
  const MovieTheaterSuccess(this.responseMovieTheater);
}

class MovieTheaterFailure extends MovieTheaterState {}
