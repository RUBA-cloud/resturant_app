// settings_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resturant_app/SharedPref.dart';
import 'package:resturant_app/constants/exported_package.dart';
import 'package:resturant_app/main_cubit.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit()
    : super(
        SettingsState(isDark: false, locale: Get.locale ?? const Locale('en')),
      );

  void toggleTheme(BuildContext cntx) {
    emit(state.copyWith(isDark: !state.isDark));
    cntx.read<MainCubit>().toggleTheme();
  }

  void changeLanguage(Locale currentLocale, BuildContext cntx) {
    final newLocale = currentLocale.languageCode == 'en'
        ? const Locale('ar')
        : const Locale('en');
    Get.updateLocale(newLocale);
    emit(state.copyWith(locale: newLocale));
  }

  void logout() {
    // Implement logout logic
    SharedPrefHelper.logout();
  }
}
