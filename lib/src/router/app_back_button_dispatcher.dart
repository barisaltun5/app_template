/*
 * ---------------------------
 * File : app_back_button_dispatcher.dart
 * ---------------------------
 * Author : Nesrullah Ekinci (nesmin)
 * Email : dev.nesmin@gmail.com
 * Date : Tue Jan 18 2022 4:38:48 PM
 * Copyright (c) 2022 
 * ---------------------------
 */

import 'package:flutter/material.dart';

import 'app_router_delegate.dart';

class AppBackButtonDispatcher extends RootBackButtonDispatcher {
  final AppRouterDelegate _routerDelegate;

  AppBackButtonDispatcher(this._routerDelegate) : super();

  @override
  Future<bool> didPopRoute() {
    return _routerDelegate.popRoute();
  }
}
