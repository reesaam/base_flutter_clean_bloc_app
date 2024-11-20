import 'package:flutter/material.dart';

class AppPaddings extends EdgeInsets {
  const AppPaddings.all(double? value) : super.all(value ?? 0);
  const AppPaddings.only({double? left, double? top, double? right, double? bottom})
      : super.only(left: left ?? 0, top: top ?? 0, right: right ?? 0, bottom: bottom ?? 0);
  const AppPaddings.fromLTRB(double? left, double? top, double? right, double? bottom) : super.fromLTRB(left ?? 0, top ?? 0, right ?? 0, bottom ?? 0);
  const AppPaddings.symmetric({double? horizontal, double? vertical}) : super.symmetric(horizontal: horizontal ?? 0, vertical: vertical ?? 0);

  ///General
  static EdgeInsets get pages => const EdgeInsets.all(10);
}
