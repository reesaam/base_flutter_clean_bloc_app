import 'package:flutter/material.dart';

import '../../core/app_localization.dart';

extension ExtensionDateTimeStringProvidersNull on DateTime? {
  String toDateTimeFormat(BuildContext context, {String? separator}) => this == null ? Texts(context).to.empty : this!.toDateTimeFormat();
  String toDateFormat(BuildContext context, {String? separator}) => this == null ? Texts(context).to.empty : this!.toDateFormat();
  String toTimeFormat(BuildContext context, {bool? withSeconds}) => this == null ? Texts(context).to.empty : this!.toTimeFormat();
}

extension ExtensionDateTimeStringProviders on DateTime {
  String toDateTimeFormat({String? separator}) {
    String sp = separator ?? '/';
    return '${year.toString().padLeft(4, '0')}$sp${month.toString().padLeft(2, '0')}$sp${day.toString().padLeft(2, '0')} - ${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
  }

  String toDateFormat({String? separator}) {
    String sp = separator ?? '/';
    return '${year.toString().padLeft(4, '0')}$sp${month.toString().padLeft(2, '0')}$sp${day.toString().padLeft(2, '0')}';
  }

  String toTimeFormat({bool? withSeconds}) =>
      '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}${withSeconds == true ? ':${second.toString().padLeft(2, '0')}' : ''}';
}

extension ExtensionDateTimeCompareNull on DateTime? {
  bool equalTo(DateTime? dateTime) => this == null && dateTime == null
      ? true
      : this == null || dateTime == null
          ? false
          : this!.equalTo(dateTime);
}

extension ExtensionDateTimeCompare on DateTime {
  bool equalTo(DateTime? dateTime) => dateTime == null ? false : toDateTimeFormat == dateTime.toDateTimeFormat;
}
