import 'package:shared_preferences/shared_preferences.dart';

abstract class LoginState {
  const LoginState();
}

class LoginInitial extends LoginState {
  const LoginInitial();
}

class LoginLoading extends LoginState {
  const LoginLoading();
}

class LoginSuccess extends LoginState {
  final String uid;
  final String email;

  LoginSuccess(this.uid, this.email) {
    LoginPreferences.saveLoginDetails(uid, email);
  }
}

class LoginError extends LoginState {
  final String message;

  const LoginError(this.message);
}

class LoginPreferences {
  static Future<void> saveLoginDetails(String uid, String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('uid', uid);
    await prefs.setString('email', email);
  }
}
