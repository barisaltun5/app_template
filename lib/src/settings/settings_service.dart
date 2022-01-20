import 'package:app_template/src/constants/hive_constants.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class SettingsService {
  Future<ThemeMode> themeMode() async => ThemeMode.system;
  Future<void> updateThemeMode(ThemeMode theme) async {}

  Future<bool> registerCheck() async => (await Hive.openBox(defaultBoxName))
      .get(keyRegisterCheck, defaultValue: false);
}
