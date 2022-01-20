/*
 * ---------------------------
 * File : app_router_delegate.dart
 * ---------------------------
 * Author : Nesrullah Ekinci (nesmin)
 * Email : dev.nesmin@gmail.com
 * Date : Tue Jan 18 2022 10:59:45 AM
 * Copyright (c) 2022 
 * ---------------------------
 */

import 'package:app_template/src/router/router.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appNavigatorKey = GlobalKey<NavigatorState>();

class AppRouterDelegate extends RouterDelegate<RouterAction>
    with PopNavigatorRouterDelegateMixin<RouterAction>, ChangeNotifier {
  final WidgetRef ref;
  final List<MaterialPage> _pages = [];
  bool showingExit = false;

  @override
  GlobalKey<NavigatorState> navigatorKey = appNavigatorKey;

  AppRouterDelegate(this.ref) {
    ref.listen(routerManagerStateProvider, (previous, next) {
      notifyListeners();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: _onPopPage,
      observers: const [],
      pages: buildPages(),
    );
  }

  @override
  Future<bool> popRoute() {
    bool result = _remove(null);
    if (!result) {
      _confirmAppExit();
    }

    return Future.value(true);
  }

  void _confirmAppExit() {
    if (!showingExit) {
      showingExit = true;
      // Functions.showAlert(
      //   navigatorKey!.currentContext!,
      //   dismissible: false,
      //   text: UIText.closeAppMessage,
      //   onConfirmBtnTap: () => SystemNavigator.pop(),
      //   onCancelBtnTap: ()  {
      //     showingExit = false;
      //     Navigator.pop(navigatorKey!.currentContext!);
      //   },
      // );
    }
  }

  @override
  Future<void> setNewRoutePath(RouterAction configuration) {
    _pages.clear();
    _add(configuration);

    return SynchronousFuture(null);
  }

  bool _onPopPage(Route<dynamic> route, result) {
    final didPop = route.didPop(result);
    if (!didPop) {
      return false;
    }
    return _remove(result);
  }

  List<Page> buildPages() {
    final RouterAction routerAction = ref.read(routerManagerStateProvider);
    switch (routerAction.type) {
      case ActionType.none:
        break;
      case ActionType.add:
        _add(routerAction);
        break;
      case ActionType.remove:
        _remove(routerAction.arguments);
        break;
      case ActionType.replace:
        _replace(routerAction);
        break;
      case ActionType.replaceAll:
        _replaceAll(routerAction);
        break;
    }
    //  resetCurrentAction();
    return List.of(_pages);
  }

  void _add(RouterAction routerAction) {
    final shoulAddPage = _pages.isEmpty ||
        (_pages.last.arguments as RouterAction).object.routeKey !=
            routerAction.object.routeKey;
    if (shoulAddPage) {
      _pages.add(
        _createPage(routerAction),
      );
    }
  }

  bool _remove(arguments) {
    if (_pages.isNotEmpty && _pages.length > 1) {
      _pages.removeLast();
      return true;
    } else {
      return false;
    }
  }

  void _replace(RouterAction routerAction) {
    if (_pages.isNotEmpty) {
      _pages.removeLast();
    }
    _add(routerAction);
  }

  void _replaceAll(RouterAction routerAction) {
    setNewRoutePath(routerAction);
  }

  MaterialPage _createPage(RouterAction routerAction) {
    return MaterialPage(
      child: routerAction.object as Widget,
      key: Key(routerAction.object.routeKey) as LocalKey,
      name: routerAction.object.routePath,
      arguments: routerAction,
    );
  }
}
