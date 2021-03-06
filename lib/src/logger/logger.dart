/*
 * ---------------------------
 * File : logger.dart
 * ---------------------------
 * Author : Nesrullah Ekinci (nesmin)
 * Email : dev.nesmin@gmail.com
 * Date : Thu Jan 20 2022 10:01:08 AM
 * Copyright (c) 2022 
 * ---------------------------
 */

import 'package:logger/logger.dart';

var logger = Logger(
  printer: PrettyPrinter(),
);

var loggerNoStack = Logger(
  printer: PrettyPrinter(methodCount: 0),
);


//  logger.d('Log message with 2 methods');

//   loggerNoStack.i('Info message');

//   loggerNoStack.w('Just a warning!');

//   logger.e('Error! Something bad happened', 'Test Error');

//   loggerNoStack.v({'key': 5, 'value': 'something'});

//   Logger(printer: SimplePrinter(colors: true)).v('boom');
