import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@immutable
class AppRouter extends RoutePage {
  final String? as;
  final bool? isInitialPage;
  final bool? isUnknownPage;

  const AppRouter({
    this.as,
    this.isInitialPage,
    this.isUnknownPage,
  });
}
