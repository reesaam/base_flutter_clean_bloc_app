import 'package:flutter/material.dart';

extension ExtensionContextSize on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
}

extension ExtensionContextViewInsets on BuildContext {
  double get viewInsetsBottom => MediaQuery.of(this).viewInsets.bottom;
  double get viewInsetsTop => MediaQuery.of(this).viewInsets.top;
  double get viewInsetsLeft => MediaQuery.of(this).viewInsets.left;
  double get viewInsetsRight => MediaQuery.of(this).viewInsets.right;
}