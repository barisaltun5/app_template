import 'package:flutter/material.dart';

import 'settings_service.dart';

class SettingsController with ChangeNotifier {
  SettingsController(this._settingsService);
  final SettingsService _settingsService;
  late ThemeMode _themeMode;
  ThemeMode get themeMode => _themeMode;

  late bool _registerCheck;
  bool get registerCheck => _registerCheck;
  

  Future<void> loadSettings() async {
    _themeMode = await _settingsService.themeMode();
    _registerCheck = await _settingsService.registerCheck();

    notifyListeners();
  }

  Future<void> updateThemeMode(ThemeMode? newThemeMode) async {
    if (newThemeMode == null) return;
    if (newThemeMode == _themeMode) return;
    _themeMode = newThemeMode;
    notifyListeners();
    await _settingsService.updateThemeMode(newThemeMode);
  }
  
}
