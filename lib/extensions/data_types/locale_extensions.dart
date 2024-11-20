import 'package:flutter/material.dart';

import '../../core/app_localization.dart';
import '../../core/core_resources/core_enums.dart';
import '../../core/core_resources/texts.dart';
import 'string_extensions.dart';

extension ExtensionLanguageName on Locale {
  String get getLanguageName => this == AppLocalization.persian ? AppTexts.languageNamePersian : getLanguage.name.capitalizeFirst;
}

extension ExtensionLanguageModel on Locale {
  AppLanguages get getLanguage {
    AppLanguages language = AppLanguages.english;
    for (var lang in AppLanguages.values) {
      if (languageCode == lang.locale.languageCode) {
        language = lang;
      }
    }
    return language;
  }
}