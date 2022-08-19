import 'package:bloc/bloc.dart';
import 'package:booking_movie_ticket/app/presentation/repository/auth_repository.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  AuthBloc(this._authRepository) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is AppStarted) {
        final bool hasToken = await _authRepository.hasToken();
        if (hasToken) {
          emit(AuthAuthenticated());
        } else {
          emit(AuthUnauthenticated());
        }
      }

      //Logged In
      if (event is LoggedIn) {
        emit(AuthLoading());
        await _authRepository.persistToken(event.token);
        emit(AuthAuthenticated());
      }

      //Logged Out
      if (event is LoggedOut) {
        emit(AuthLoading());
        await _authRepository.deleteToken();
        emit(AuthUnauthenticated());
      }
    });
  }
}
