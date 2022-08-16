import 'package:bloc/bloc.dart';
import 'package:booking_movie_ticket/app/presentation/repository/auth_repository.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  AuthBloc(this._authRepository) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {
      _mapEventToState(event, emit);
    });
  }

  _mapEventToState(AuthEvent event, Emitter<AuthState> emit) async* {
    //Started
    if (event is AppStarted) {
      final bool hasToken = await _authRepository.hasToken();
      if (hasToken) {
        yield AuthAuthenticated();
      } else {
        yield AuthUnauthenticated();
      }
    }

    //Logged In
    if (event is LoggedIn) {
      yield AuthLoading();
      await _authRepository.persistToken(event.token);
      yield AuthAuthenticated();
    }

    //Logged Out
    if (event is LoggedOut) {
      yield AuthLoading();
      await _authRepository.deleteToken();
      yield AuthUnauthenticated();
    }
  }
}
