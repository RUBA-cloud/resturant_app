import 'package:resturant_app/constants/exported_package.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  static Future<void> saveThemeMode(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDark', isDark);
  }

  static Future<void> saveLocale(String code) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('locale', code);
  }

  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString("email") != null &&
        prefs.getString("password") != null) {
      prefs.clear();
      Get.offAllNamed('/login');
    }
  }
}
