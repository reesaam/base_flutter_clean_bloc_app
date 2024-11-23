import 'package:flutter/material.dart';

import '../../../components/failures/local_exception.dart';
import '../../../components/failures/network_exception.dart';
import '../../../core/app_localization.dart';
import '../../../core/core_functions.dart';
import '../../../ui_kit/dialogs/app_alert_dialogs.dart';

class AppExceptionsDialog extends AppAlertDialogs {
  static local(BuildContext context, {required LocalException exception, String? message, int? statusCode, Function()? onTap}) async {
    await AppAlertDialogs.withOk(
      context,
      title: statusCode?.toString() ?? exception.statusCode?.toString(),
      text: message ?? exception.message ?? Texts(context).to.notAvailableInitials,
      onTapOk: () => onTap ?? popPage,
    );
  }

  static remote(BuildContext context, {required NetworkException exception, String? message, int? statusCode, Function()? onTap}) async {
    await AppAlertDialogs.withOk(
      context,
      title: statusCode?.toString() ?? exception.statusCode?.toString(),
      text: message ?? exception.message ?? Texts(context).to.notAvailableInitials,
      onTapOk: () => onTap ?? popPage,
    );
  }
}
