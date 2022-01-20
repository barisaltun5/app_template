/*
 * ---------------------------
 * File : app_route_information_parser.dart
 * ---------------------------
 * Author : Nesrullah Ekinci (nesmin)
 * Email : dev.nesmin@gmail.com
 * Date : Tue Jan 18 2022 11:05:13 AM
 * Copyright (c) 2022 
 * ---------------------------
 */

import 'package:app_template/src/router/router.dart';
import 'package:app_template/src/splash/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppRouteInformationParser extends RouteInformationParser<RouterAction> {
  final WidgetRef ref;

  AppRouteInformationParser(this.ref);

  @override
  Future<RouterAction> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location ?? "");
    if (uri.pathSegments.isEmpty) {
      return RouterAction(type: ActionType.add, object: const SplashView());
    }

    final path = '/' + uri.pathSegments[0];
    switch (path) {

      default:
         return RouterAction(type: ActionType.add, object: const SplashView());
    }
  }
}
