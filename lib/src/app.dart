import 'package:app_template/src/router/app_back_button_dispatcher.dart';
import 'package:app_template/src/router/app_route_information_parser.dart';
import 'package:app_template/src/router/app_router_delegate.dart';
import 'package:app_template/src/settings/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends ConsumerWidget {
  const App({
    Key? key,
    required this.settingsController,
  }) : super(key: key);

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _routerDelegate = AppRouterDelegate(ref);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      restorationScopeId: 'app',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English,
      ],
      title: "App Template",
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: "SanFransisco",
      ),
      backButtonDispatcher: AppBackButtonDispatcher(_routerDelegate),
      routerDelegate: _routerDelegate,
      routeInformationParser: AppRouteInformationParser(ref),
    );
  }
}
