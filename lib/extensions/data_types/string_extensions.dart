import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_regex/flutter_regex.dart';

import 'int_extensions.dart';

extension ExtensionCaptalization on String {
  String get capitalizeFirst => replaceRange(0, 1, this[0].toUpperCase());
}

extension ExtensionUInt8List on String {
  Uint8List toUInt8List() => Uint8List.fromList(codeUnits);
}

extension ExtensionStringModifiers on String {
  String get withDoubleDots => '$this: ';
}

extension ExtensionStringModifiersCurrency on String {
  String toCurrency(BuildContext context, {String? sign}) => int.tryParse(this).toCurrency(context, sign: sign);
}

extension ExtensionStringRegexVerfier on String {
  bool regexVerify(String regex) => RegexVal.hasMatch(this, regex);
}