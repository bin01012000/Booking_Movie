part of 'movie_bloc.dart';

abstract class MovieEvent extends Equatable {
  const MovieEvent();

  @override
  List<Object> get props => [];
}

class GetMovie extends MovieEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'Getting movie';
}
