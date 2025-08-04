abstract class RegisterState {
  const RegisterState();
}

class RegisterInitial extends RegisterState {
  const RegisterInitial();
}

class RegisterLoading extends RegisterState {
  const RegisterLoading();
}

class RegisterLoaded extends RegisterState {
  final String uid;

  const RegisterLoaded(this.uid);
}

class RegisterError extends RegisterState {
  final String message;

  const RegisterError(this.message);
}
