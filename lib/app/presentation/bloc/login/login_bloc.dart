import 'package:bloc/bloc.dart';
import 'package:booking_movie_ticket/app/presentation/bloc/auth/auth_bloc.dart';
import 'package:booking_movie_ticket/app/presentation/repository/auth_repository.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;
  final AuthBloc authBloc;

  LoginBloc({required this.authRepository, required this.authBloc})
      : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is LoginButtonPressed) {
        emit(LoginLoading());
        try {
          final res = await authRepository.login(
              email: event.email, password: event.password);
          if (res.errorCode == 0 && res.data != null) {
            authBloc.add(LoggedIn(token: res.data!.accessToken.toString()));
            emit(LoginSuccess());
          } else {
            emit(LoginFailure(error: 'error'));
          }
        } catch (e) {
          emit(LoginFailure(error: e.toString()));
          rethrow;
        }
      }
    });
  }

  Stream<LoginState> _mapEventToState(
      LoginEvent event, Emitter<LoginState> emit) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();
      try {
        final res = await authRepository.login(
            email: event.email, password: event.password);
        if (res.errorCode == 0 && res.data != null) {
          authBloc.add(LoggedIn(token: res.data!.accessToken.toString()));
        }
        yield LoginSuccess();
      } catch (e) {
        yield LoginFailure(error: e.toString());
        rethrow;
      }
    }
  }
}
