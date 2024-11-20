import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@immutable
class DI extends Injectable {
  static const controller = Injectable();
  static const component = Injectable();
  static const repository = Injectable();
}
