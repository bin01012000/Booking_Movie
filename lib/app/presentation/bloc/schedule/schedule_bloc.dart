import 'package:booking_movie_ticket/app/presentation/response/response_scheduled_movie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../repository/scheduled_movie_repository.dart';

part 'schedule_event.dart';
part 'schedule_state.dart';

class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState> {
  final ScheduleRepository _scheduleRepository = ScheduleRepository();
  ScheduleBloc() : super(ScheduleInitial()) {
    on<GetScheduleMovie>((event, emit) async {
      emit(ScheduleLoading());
      try {
        final res = await _scheduleRepository.getScheduleMovie(
            event.idMovie, event.idTheater);
        if (res.errCode == 0 && res.data != null) {
          emit(ScheduleSuccess(res));
        } else {
          emit(ScheduleFailure());
        }
      } catch (e) {
        emit(ScheduleFailure());
        rethrow;
      }
    });
  }
}
