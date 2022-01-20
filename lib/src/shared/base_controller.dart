/*
 * ---------------------------
 * File : base_controller.dart
 * ---------------------------
 * Author : Nesrullah Ekinci (nesmin)
 * Email : dev.nesmin@gmail.com
 * Date : Wed Jan 19 2022 3:10:04 PM
 * Copyright (c) 2022 
 * ---------------------------
 */

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class BaseController with ChangeNotifier {
  bool _loadingPage = false;
  bool get loadingPage => _loadingPage;
  set loadingPage(val) {
    _loadingPage = val;
    notifyListeners();
  }


  void initialize(WidgetRef ref);
}
