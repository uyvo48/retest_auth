import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retest_auth/bloc/auth_event.dart';
import 'package:retest_auth/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLogin>((event, emit) async {
      emit(AuthLoading());
      await Future.delayed(Duration(seconds: 2));
      if (event.email == "123" && event.password == "12345") {
        emit(AuthSuccess());
      } else if (state is AuthFailure) {
        emit(AuthFailure("dang nhap khong thanh cong"));
      }
    });
    on<AuthLogOut>((event, emit) {
      emit(LogOutState());
    });
  }
}
