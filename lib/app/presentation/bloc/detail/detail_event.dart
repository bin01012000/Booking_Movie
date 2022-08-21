part of 'detail_bloc.dart';

abstract class DetailEvent extends Equatable {
  const DetailEvent();

  @override
  List<Object> get props => [];
}

class GetDetailMovie extends DetailEvent {
  @override
  List<Object> get props => [];
  final int id;
  const GetDetailMovie({required this.id});

  @override
  String toString() => 'Getting detail movie';
}
