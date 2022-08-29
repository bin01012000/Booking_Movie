part of 'schedule_bloc.dart';

abstract class ScheduleState extends Equatable {
  const ScheduleState();

  @override
  List<Object> get props => [];
}

class ScheduleInitial extends ScheduleState {}

class ScheduleLoading extends ScheduleState {}

class ScheduleFailure extends ScheduleState {}

class ScheduleSuccess extends ScheduleState {
  final ScheduleMovie responseSchedule;
  const ScheduleSuccess(this.responseSchedule);
}
