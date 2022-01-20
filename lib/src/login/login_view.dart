/*
 * ---------------------------
 * File : login_view.dart
 * ---------------------------
 * Author : Nesrullah Ekinci (nesmin)
 * Email : dev.nesmin@gmail.com
 * Date : Wed Jan 19 2022 8:36:43 AM
 * Copyright (c) 2022 
 * ---------------------------
 */

import 'package:app_template/src/constants/router_constants.dart';
import 'package:app_template/src/router/router.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget with RouterObject {
  const LoginView({Key? key}) : super(key: key);
  @override
  String get routeKey => loginKey;

  @override
  String get routePath => loginPath;
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('LoginView'));
  }
}
