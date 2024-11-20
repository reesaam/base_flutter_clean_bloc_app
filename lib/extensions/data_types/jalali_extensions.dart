import 'package:flutter/material.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

import '../../core/app_localization.dart';


extension ExtensionJalaliStringProvidersNull on Jalali? {
  String toDateTimeFormat(BuildContext context) => this == null ? Texts(context).to.empty : this!.toDateTimeFormat();
  String toDateFormat(BuildContext context) => this == null ? Texts(context).to.empty : this!.toDateFormat();
  String toTimeFormat(BuildContext context) => this == null ? Texts(context).to.empty : this!.toTimeFormat();
  String toTimeFormatWithSeconds(BuildContext context) => this == null ? Texts(context).to.empty : this!.toTimeFormatWithSeconds();
}

extension ExtensionJalaliStringProvider on Jalali {
  String toDateTimeFormat() =>
      '${year.toString().padLeft(4, '0')}/${month.toString().padLeft(2, '0')}/${day.toString().padLeft(2, '0')} - ${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
  String toDateFormat() => '${year.toString().padLeft(4, '0')}/${month.toString().padLeft(2, '0')}/${day.toString().padLeft(2, '0')}';
  String toTimeFormat() => '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
  String toTimeFormatWithSeconds() => '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}:${second.toString().padLeft(2, '0')}';
}
