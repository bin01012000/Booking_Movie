import 'package:bloc/bloc.dart';
import 'package:booking_movie_ticket/app/presentation/repository/movie_repository.dart';
import 'package:booking_movie_ticket/app/presentation/response/response_banner.dart';
import 'package:equatable/equatable.dart';

part 'banner_event.dart';
part 'banner_state.dart';

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  final MovieRepository _movieRepository = MovieRepository();
  BannerBloc() : super(BannerInitial()) {
    on<BannerEvent>((event, emit) async {
      if (event is GetBanner) {
        emit(BannerLoading());
        try {
          ResponseBanner res = await _movieRepository.getBanner();
          if (res.errCode == 0 && res.data != null) {
            emit(BannerSuccess(res));
          } else {
            emit(BannerFailure());
          }
        } catch (e) {
          emit(BannerFailure());
          rethrow;
        }
      }
    });
  }
}
