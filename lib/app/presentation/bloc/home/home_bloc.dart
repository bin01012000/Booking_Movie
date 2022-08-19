import 'package:bloc/bloc.dart';
import 'package:booking_movie_ticket/app/presentation/repository/home_repository.dart';
import 'package:booking_movie_ticket/app/presentation/response/response_movie.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository _homeRepository = HomeRepository();
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      if (event is GetMovie) {
        emit(HomeLoading());
        try {
          final res = await _homeRepository.getAllMovie();
          if (res.errCode == 0 && res.dataMovie != null) {
            emit(HomeSuccess(res));
          } else {
            emit(HomeFailure());
          }
        } catch (e) {
          emit(HomeFailure());
          rethrow;
        }
      }
    });
  }
}
