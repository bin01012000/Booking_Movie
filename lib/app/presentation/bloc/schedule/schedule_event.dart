part of 'schedule_bloc.dart';

abstract class ScheduleEvent extends Equatable {
  const ScheduleEvent();

  @override
  List<Object> get props => [];
}

class GetScheduleMovie extends ScheduleEvent {
  @override
  List<Object> get props => [];
  final int idMovie;
  final int idTheater;
  const GetScheduleMovie({required this.idMovie, required this.idTheater});

  @override
  String toString() => 'Getting Schedule movie';
}
