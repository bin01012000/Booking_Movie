import 'package:booking_movie_ticket/app/presentation/repository/detail_page_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../response/response_detail_movie.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final DetailPageRepository _detailPageRepository = DetailPageRepository();
  DetailBloc() : super(DetailInitial()) {
    on<DetailEvent>((event, emit) async {
      if (event is GetDetailMovie) {
        emit(DetailLoading());
        try {
          final res = await _detailPageRepository.getDetailMovie(event.id);
          if (res.errCode == 0 && res.data != null) {
            emit(DetailSuccess(res));
          } else {
            emit(DetailFailure());
          }
        } catch (e) {
          emit(DetailFailure());
          rethrow;
        }
      }
    });
  }
}
