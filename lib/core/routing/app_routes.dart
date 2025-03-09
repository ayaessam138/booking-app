import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static const String splashScreen = '/';
  static const String onBoradingScreen = '/onBoradingScreen';
  static const String loginScreen = '/loginScreen';
  static const String registerScreen = '/registerScreen';
  static const String homeScreen = '/homeScreen';
  static const String eventsScreen = '/eventsScreen';
  static const String eventsDeatilsScreen = '/eventsDeatilsScreen';
  static const String organizerScreen = '/organizerScreen';
  static const String otpScrren = '/otpScrren';
  static const String bottomNavBarScreen = '/bottomNavBarScreen';
}

class AppNavigator {
  AppNavigator._();

  static void go(BuildContext context, String path) {
    context.go(path);
  }

  static void goNamed(
    BuildContext context,
    String name, {
    Map<String, String>? params,
  }) {
    context.goNamed(name, pathParameters: params ?? {});
  }

  static void push(BuildContext context, String path,) {
    context.push(path,  );
  }

  static void pushNamed(
    BuildContext context,
    String name, {
    Map<String, String>? params,
  }) {
    context.pushNamed(name, pathParameters: params ?? {});
  }

  static void goBack(BuildContext context) {
    if (context.canPop()) {
      context.pop();
    }
  }
}
