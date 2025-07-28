abstract class LoginState {
  const LoginState();
}

class LoginInitial extends LoginState {
  const LoginInitial();
}

class AuthInitial extends LoginState {}

class AuthLoading extends LoginState {}

class AuthSuccess extends LoginState {
  final String uid;
  const AuthSuccess(this.uid);
}

class AuthError extends LoginState {
  final String message;
  const AuthError(this.message);
}

class LoginLoading extends LoginState {
  const LoginLoading();
}

class LoginSuccess extends LoginState {
  final String uid;

  const LoginSuccess(this.uid);
}

class LoginError extends LoginState {
  final String message;

  const LoginError(this.message);
}
