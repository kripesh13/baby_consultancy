import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomNavigator {
  static void push(BuildContext context, String name, {Object? extra}) {
    if (!context.mounted) return;
    context.push(name, extra: extra);
  }

  static void pop(BuildContext context) {
    if (!context.mounted) return;
    context.pop();
  }

  static void pushReplace(BuildContext context, String name, {Object? extra}) {
    if (!context.mounted) return;
    context.pushReplacement(name, extra: extra);
  }

  static void replaceAll(BuildContext context, String name, {Object? extra}) {
    if (!context.mounted) return;
    context.go(name, extra: extra);
  }
}
