import 'package:flutter/material.dart';

import '../shared_preferences/shared_preferences_service.dart';

class AppThemeService {
  final SharedPreferencesService sharedPreferencesService;
  final ValueNotifier<ThemeMode> themeMode = ValueNotifier(ThemeMode.light);

  AppThemeService({required this.sharedPreferencesService});

  void loadTheme() {
    // We try to get the saved value. If null, we default to light.
    final isDark = sharedPreferencesService.getBoolData(key: 'is_dark_mode_enabled') ?? false;
    themeMode.value = isDark ? ThemeMode.dark : ThemeMode.light;
  }

  Future<void> toggleTheme(bool isDark) async {
    await sharedPreferencesService.setBoolData(key: 'is_dark_mode_enabled', data: isDark);
    themeMode.value = isDark ? ThemeMode.dark : ThemeMode.light;
  }
}