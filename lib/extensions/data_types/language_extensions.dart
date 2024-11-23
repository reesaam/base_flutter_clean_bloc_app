import 'package:flutter/material.dart';

import '../../core/app_localization.dart';
import '../../core/core_resources/core_enums.dart';

extension ExtensionLocaleFunctions on AppLanguages? {
  Locale getLocale() {
    var locale = AppLocalization.to.english;
    switch (this) {
      case AppLanguages.english:
        locale = AppLocalization.to.english;
        break;
      case AppLanguages.deutsch:
        locale = AppLocalization.to.deutsch;
        break;
      case AppLanguages.persian:
        locale = AppLocalization.to.persian;
        break;
      default:
        break;
    }
    return locale;
  }
}
