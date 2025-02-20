sealed class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {}

class AuthFailure extends AuthState {
  final String messes;
  AuthFailure(this.messes);
}

class LogOutState extends AuthState {}
