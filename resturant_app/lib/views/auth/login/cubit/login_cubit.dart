import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginInitial());

  final FirebaseAuth _auth = FirebaseAuth.instance;
  // Register
  Future<void> register(String email, String password) async {
    emit(AuthLoading());
    try {
      final result = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      emit(AuthSuccess(result.user!.uid));
    } on FirebaseAuthException catch (e) {
      emit(AuthError(e.message ?? 'Registration failed'));
    }
  }

  Future<void> login(String email, String password) async {
    emit(const LoginLoading());

    try {
      final result = await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      emit(LoginSuccess(result.user!.uid));
    } on FirebaseAuthException catch (e) {
      emit(LoginError(e.message ?? 'Login failed'));
    }
  }
}
