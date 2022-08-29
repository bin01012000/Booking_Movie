part of 'movie_bloc.dart';

abstract class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object> get props => [];
}

class MovieInitial extends MovieState {}

class MovieLoading extends MovieState {}

class MovieFailure extends MovieState {}

class MovieSuccess extends MovieState {
  final ResponseMovie responseMovie;
  const MovieSuccess(this.responseMovie);
}
