import 'package:flutter/material.dart';

import '../../core/app_localization.dart';
import '../../core/core_resources/core_enums.dart';

extension ExtensionLocaleFunctions on AppLanguages? {
  Locale getLocale() {
    var locale = AppLocalization.english;
    switch (this) {
      case AppLanguages.english:
        locale = AppLocalization.english;
        break;
      case AppLanguages.deutsch:
        locale = AppLocalization.deutsch;
        break;
      case AppLanguages.persian:
        locale = AppLocalization.persian;
        break;
      default:
        break;
    }
    return locale;
  }
}
