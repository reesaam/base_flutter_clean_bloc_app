import 'package:flutter/material.dart';

@immutable
class DI {
  final String? as;
  const DI({this.as});

  const DI.controller({this.as});
  const DI.component({this.as});
  const DI.repository({this.as});
}
