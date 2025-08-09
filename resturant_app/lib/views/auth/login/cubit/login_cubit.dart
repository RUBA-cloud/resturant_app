import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginInitial());

  final FirebaseAuth _auth = FirebaseAuth.instance;
  // Login
  Future<void> login(String email, String password) async {
    if (isClosed) return;
    emit(const LoginLoading());

    try {
      final result = await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      if (result.user == null) {
        emit(const LoginError('User not found'));
        return;
      }
      emit(LoginSuccess(result.user!.uid, email));

      if (!isClosed) emit(LoginSuccess(result.user!.uid, email));
    } on FirebaseAuthException catch (e) {
      if (!isClosed) emit(LoginError(e.message ?? 'Login failed'));
    }
  }
}
