part of 'schedule_bloc.dart';

abstract class ScheduleEvent extends Equatable {
  const ScheduleEvent();

  @override
  List<Object> get props => [];
}

class GetScheduleMovie extends ScheduleEvent {
  @override
  List<Object> get props => [];
  final int id;
  const GetScheduleMovie({required this.id});

  @override
  String toString() => 'Getting Schedule movie';
}
