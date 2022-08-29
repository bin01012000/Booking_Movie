part of 'detail_bloc.dart';

abstract class DetailState extends Equatable {
  const DetailState();

  @override
  List<Object> get props => [];
}

class DetailInitial extends DetailState {}

class DetailLoading extends DetailState {}

class DetailFailure extends DetailState {}

class DetailSuccess extends DetailState {
  final ResponseDetailMovie responseMovie;
  const DetailSuccess(this.responseMovie);
}
