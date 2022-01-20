/*
 * ---------------------------
 * File : splash_controller.dart
 * ---------------------------
 * Author : Nesrullah Ekinci (nesmin)
 * Email : dev.nesmin@gmail.com
 * Date : Wed Jan 19 2022 3:02:45 PM
 * Copyright (c) 2022 
 * ---------------------------
 */

import 'package:app_template/src/login/login_view.dart';
import 'package:app_template/src/router/router.dart';
import 'package:app_template/src/shared/base_controller.dart';
import 'package:app_template/src/splash/splash_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final splashControllerProvider =
    ChangeNotifierProvider((ref) => SplashController());

class SplashController extends BaseController {
  SplashController();
  final SplashService _splashService = SplashService();
  late WidgetRef ref;

  @override
  void initialize(WidgetRef ref) async {
    this.ref = ref;
    await Future.delayed(const Duration(milliseconds: 500));
    RouterHelper.addView(ref, const LoginView());
  }
}

