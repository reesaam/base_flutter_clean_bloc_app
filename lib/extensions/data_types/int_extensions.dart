import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../core/app_localization.dart';
import '../../core/core_resources/icons.dart';


extension ExtensionIconFunction on int? {
  Icon toIcon() => this == null ? AppIcons.none : Icon(IconData(this!, fontFamily: 'MaterialIcons'));
}

extension ExtensionCurrencyFormat on int {
  String toCurrency({String? sign, int? decimalDigits}) => NumberFormat.currency(symbol: sign ?? '', decimalDigits: decimalDigits ?? 0).format(this);
}

extension ExtensionCurrencyFormatNull on int? {
  String toCurrency(BuildContext context, {String? sign}) => this == null ? Texts.to.notAvailableInitials : this!.toCurrency();
}
