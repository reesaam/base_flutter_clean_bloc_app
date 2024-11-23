import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:timezone/timezone.dart';

import '../components/di/di_setup.dart';
import '../extensions/data_types/language_extensions.dart';
import '../extensions/data_types/list_extensions.dart';
import '../extensions/data_types/time_zone_extensions.dart';
import '../shared/shared_mems/core_mems/app_setting_data_mem/app_setting_data.dart';
import 'annotations/dependency_injection_annotation.dart';
import 'context_holder.dart';
import 'core_functions.dart';
import 'core_info/core_defaults.dart';
import 'core_resources/countries.dart';
import 'core_resources/core_enums.dart';
import '../generated/l10n.dart';

class Texts {
  Texts();
  static S get to => S.of(getContext);
}

@DI.component
class AppLocalization {
  static AppLocalization get to => getIt<AppLocalization>();

  get supportedLocales => S.delegate.supportedLocales;

  static List<Locale> get languagesList => [english, deutsch, persian];
  static Locale get english => Locale(AppLanguages.english.locale.languageCode, AppCountry.us.code);
  static Locale get deutsch => Locale(AppLanguages.deutsch.locale.languageCode, AppCountry.germany.code);
  static Locale get persian => Locale(AppLanguages.persian.locale.languageCode, AppCountry.iran.code);

  get localizationDelegates => [_delegate, _material, _widgets, _cupertino];
  AppLocalizationDelegate get _delegate => S.delegate;
  LocalizationsDelegate get _material => GlobalMaterialLocalizations.delegate;
  LocalizationsDelegate get _widgets => GlobalWidgetsLocalizations.delegate;
  LocalizationsDelegate get _cupertino => GlobalCupertinoLocalizations.delegate;

  ///Default Variables
  Locale language = CoreDefaults.defaultLanguage;
  String timeZoneAbbreviation = CoreDefaults.defaultCountry.timeZoneAbbreviation?.getMiddleElement() ?? '';
  bool isDst = CoreDefaults.defaultCountry.hasDst;

  Locale getLocale() => _loadData().language?.getLocale() ?? AppLanguages.english.getLocale();

  TextDirection getTextDirection() => _loadData().language.getLocale() == persian ? TextDirection.rtl : TextDirection.ltr;

  TimeZone getTimeZone() {
    DateTime currentTime = DateTime.now();
    TimeZone timeZone = TimeZone(
      currentTime.timeZoneOffset.inMilliseconds,
      abbreviation: currentTime.timeZoneName,
      isDst: currentTime.timeZoneName.contains('DT'),
    );
    return timeZone;
  }

  AppCountry getCountry() {
    var timeZone = getTimeZone().toDurationCustomModel();
    for (var c in AppCountry.values) {
      for (var tz in c.timeZoneOffset!) {
        if (tz == timeZone) return c;
      }
    }
    return AppCountry.us;
  }
}

AppSettingDataEntity _loadData() => loadAppData()?.settingsEntity ?? const AppSettingDataEntity();