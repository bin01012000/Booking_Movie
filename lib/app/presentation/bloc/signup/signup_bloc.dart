import 'package:bloc/bloc.dart';
import 'package:booking_movie_ticket/app/presentation/repository/signup_repository.dart';
import 'package:equatable/equatable.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpRepository signupRepository;

  SignUpBloc({required this.signupRepository}) : super(SignUpInitial()) {
    on<SignUpButtonPressed>((event, emit) async {
      emit(SignUpLoading());
      try {
        final res = await signupRepository.register(
            email: event.email,
            password: event.password,
            fullName: event.fullName,
            gender: event.gender,
            birthday: event.birthday,
            cityCode: event.cityCode,
            districtCode: event.districtCode,
            wardCode: event.wardCode,
            address: event.address,
            phone: event.phone);
        if (res.errCode == 0 && res.result != null) {
          emit(SignUpSuccess());
        } else {
          emit(const SignUpFailure(error: 'error'));
        }
      } catch (e) {
        emit(SignUpFailure(error: e.toString()));
        rethrow;
      }
    });
  }
}
