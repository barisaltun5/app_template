/*
 * ---------------------------
 * File : router.dart
 * ---------------------------
 * Author : Nesrullah Ekinci (nesmin)
 * Email : dev.nesmin@gmail.com
 * Date : Mon Jan 17 2022 4:52:56 PM
 * Copyright (c) 2022 
 * ---------------------------
 */

import 'package:app_template/src/splash/splash_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class RouterObject {
  String get routeKey;
  String get routePath;
  bool get guard => false;
}

enum ActionType { none, add, remove, replace, replaceAll }

class RouterAction {
  ActionType type;
  RouterObject object;
  Map<String, dynamic>? arguments;
  RouterAction({
    this.type = ActionType.none,
    required this.object,
    this.arguments,
  });
}

class RouterManager extends StateNotifier<RouterAction> {
  //inital route is splashview
  RouterManager()
      : super(RouterAction(
            type: ActionType.replaceAll, object: const SplashView()));

  update(RouterAction routerAction) => state = routerAction;
}

final routerManagerStateProvider =
    StateNotifierProvider<RouterManager, RouterAction>((ref) {
  return RouterManager();
});

class RouterHelper {
 static update(ActionType type, WidgetRef ref,  RouterObject object, {arguments}) {
    ref
        .read(routerManagerStateProvider.notifier)
        .update(RouterAction(type: type, object: object, arguments: arguments));
  }

  static addView(WidgetRef ref, RouterObject object, {arguments})=>update(ActionType.add,ref,object,arguments: arguments);
  static removeView(WidgetRef ref, RouterObject object, {arguments})=>update(ActionType.remove,ref,object,arguments: arguments);
  static replaceView(WidgetRef ref, RouterObject object, {arguments})=>update(ActionType.replace,ref,object,arguments: arguments);
  static replaceAllView(WidgetRef ref, RouterObject object, {arguments})=>update(ActionType.replaceAll,ref,object,arguments: arguments);
}
