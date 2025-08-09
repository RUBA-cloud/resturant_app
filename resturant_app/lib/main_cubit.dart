import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class MainCubit extends Cubit<MainState> {
  bool isDark = false;
  String language = 'en';

  MainCubit() : super(MainInitial());

  Future<void> initializeApp() async {
    emit(MainLoading(language: language));
    final prefs = await SharedPreferences.getInstance();

    isDark = prefs.getBool('isDark') ?? false;
    language = prefs.getString('language') ?? 'en';
    Get.updateLocale(Locale(language));

    final hasEmail = prefs.containsKey('email');
    final email = prefs.getString('email')?.trim() ?? '';

    if (hasEmail && email.isNotEmpty) {
      emit(MainAuthenticated(isDark: isDark, language: language));
    } else {
      emit(MainUnAuthenticated(isDark: isDark, language: language));
    }
  }

  Future<void> toggleTheme() async {
    isDark = !isDark;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDark', isDark);
    emit(state.copyWith(isDark: isDark));
  }

  Future<void> changeLanguage(String langCode, BuildContext context) async {
    language = langCode;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', language);
    Get.updateLocale(Locale(language));
    emit(state.copyWith(language: language));
  }

  void login() {
    emit(MainAuthenticated(isDark: isDark, language: language));
  }

  void logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('email');
    emit(MainUnAuthenticated(isDark: isDark, language: language));
  }
}

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

class MainUnAuthenticated extends MainState {
  const MainUnAuthenticated({super.isDark, required super.language});

  @override
  MainState copyWith({bool? isDark, String? language}) => MainAuthenticated(
    isDark: isDark ?? this.isDark,
    language: language ?? this.language,
  );
}
