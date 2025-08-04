// main_cubit.dart

import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainCubit extends Cubit<MainState> {
  bool? isDark;
  String language = 'en';

  MainCubit() : super(MainInitial());

  Future<void> initializeApp() async {
    await Firebase.initializeApp(); // 🔥 Initialize Firebase
    final prefs = await SharedPreferences.getInstance();
    isDark = prefs.getBool('isDark') ?? false;
    language = prefs.getString('language') ?? 'en';

    emit(MainUnauthenticated(language: language));
  }

  void toggleTheme() async {
    isDark = !(isDark ?? false);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDark', isDark!);
    emit(state.copyWith(isDark: isDark));
  }

  void changeLanguage(String langCode) async {
    language = langCode;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', language);
    Get.updateLocale(Locale(language));
    emit(state.copyWith(language: language));
  }

  void login() {
    emit(MainAuthenticated(language: language));
  }

  void logout() {
    emit(MainUnauthenticated(language: language));
  }
}
// main_state.dart

abstract class MainState {
  final bool? isDark;
  final String language;

  const MainState({this.isDark, required this.language});

  MainState copyWith({bool? isDark, String? language});
}

class MainInitial extends MainState {
  const MainInitial() : super(language: 'en');

  @override
  MainState copyWith({bool? isDark, String? language}) => MainInitial();
}

class MainLoading extends MainState {
  const MainLoading({required super.language});

  @override
  MainState copyWith({bool? isDark, String? language}) =>
      MainLoading(language: language ?? this.language);
}

class MainAuthenticated extends MainState {
  const MainAuthenticated({super.isDark, required super.language});

  @override
  MainState copyWith({bool? isDark, String? language}) => MainAuthenticated(
    isDark: isDark ?? this.isDark,
    language: language ?? this.language,
  );
}

class MainUnauthenticated extends MainState {
  const MainUnauthenticated({super.isDark, required super.language});

  @override
  MainState copyWith({bool? isDark, String? language}) => MainUnauthenticated(
    isDark: isDark ?? this.isDark,
    language: language ?? this.language,
  );
}
