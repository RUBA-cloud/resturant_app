part of 'settings_cubit.dart';

class SettingsState {
  final bool isDark;
  final Locale locale;

  SettingsState({required this.isDark, required this.locale});

  SettingsState copyWith({bool? isDark, Locale? locale}) {
    return SettingsState(
      isDark: isDark ?? this.isDark,
      locale: locale ?? this.locale,
    );
  }
}
