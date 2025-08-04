// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleService {
  static const String _key = "selected_locale";

  /// Save selected locale (e.g., 'en', 'ar')
  static Future<void> saveLocale(String languageCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, languageCode);
  }

  /// Get saved locale or return device locale
  static Future<Locale> getSavedLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final langCode = prefs.getString(_key);

    if (langCode != null) {
      return Locale(langCode);
    } else {
      // Default: Use device locale
      final deviceLocale = WidgetsBinding.instance.window.locale;
      return Locale(deviceLocale.languageCode);
    }
  }
}
