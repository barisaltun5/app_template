/*
 * ---------------------------
 * File : splash_view.dart
 * ---------------------------
 * Author : Nesrullah Ekinci (nesmin)
 * Email : dev.nesmin@gmail.com
 * Date : Tue Jan 18 2022 11:07:08 AM
 * Copyright (c) 2022 
 * ---------------------------
 */

import 'package:app_template/src/constants/router_constants.dart';
import 'package:app_template/src/router/router.dart';
import 'package:app_template/src/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class SplashView extends ConsumerWidget with RouterObject {
  const SplashView({Key? key}) : super(key: key);

  @override
  String get routeKey => splashKey;

  @override
  String get routePath => splashPath;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    ref.read(splashControllerProvider).initialize(ref);
   // final controller = ref.watch(splashControllerProvider);

    return const Center(child: Text('SplashView'));
  }
}
