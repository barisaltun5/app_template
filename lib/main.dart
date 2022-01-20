
import 'package:app_template/src/settings/settings_controller.dart';
import 'package:app_template/src/settings/settings_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //initialize the local storage
  await Hive.initFlutter();

  //initialize settings
  final SettingsController settingsController =
      SettingsController(SettingsService());
  await settingsController.loadSettings();
  
  runApp(
    ProviderScope(
      child: App(settingsController: settingsController),
    ),
  );
}
