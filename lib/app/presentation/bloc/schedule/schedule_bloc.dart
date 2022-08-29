import 'package:booking_movie_ticket/app/presentation/response/response_schedule.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../repository/schedule_repository.dart';

part 'schedule_event.dart';
part 'schedule_state.dart';

class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState> {
  final ScheduleRepository _scheduleRepository = ScheduleRepository();
  ScheduleBloc() : super(ScheduleInitial()) {
    on<ScheduleEvent>((event, emit) async {
      if (event is GetScheduleMovie) {
        emit(ScheduleLoading());
        try {
          final res = await _scheduleRepository.getScheduleMovie(event.id);
          if (res.errCode == 0 && res.data != null) {
            emit(ScheduleSuccess(res));
          } else {
            emit(ScheduleFailure());
          }
        } catch (e) {
          emit(ScheduleFailure());
          rethrow;
        }
      }
    });
  }
}
