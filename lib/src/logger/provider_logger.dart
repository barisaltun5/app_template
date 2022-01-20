/*
 * ---------------------------
 * File : provider_logger.dart
 * ---------------------------
 * Author : Nesrullah Ekinci (nesmin)
 * Email : dev.nesmin@gmail.com
 * Date : Thu Jan 20 2022 9:57:09 AM
 * Copyright (c) 2022 
 * ---------------------------
 */


import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProviderLogger extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    log('[${provider.name ?? provider.runtimeType}] value: $newValue');
  }
}