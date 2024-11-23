import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:timezone/timezone.dart';

import '../components/di/di_setup.dart';
import '../extensions/data_types/language_extensions.dart';
import '../extensions/data_types/time_zone_extensions.dart';
import '../shared/shared_mems/core_mems/app_setting_data_mem/app_setting_data.dart';
import 'annotations/dependency_injection_annotation.dart';
import 'context_holder.dart';
import 'core_functions.dart';
import 'core_resources/countries.dart';
import 'core_resources/core_enums.dart';
import '../generated/l10n.dart';

class Texts {
  static S get to => S.of(getContext);
}

@DI.component
class AppLocalization {
  static AppLocalization get to => getIt<AppLocalization>();

  List<Locale> get supportedLocales => S.delegate.supportedLocales;

  List<Locale> get languagesList => [english, deutsch, persian];
  Locale get english => Locale(AppLanguages.english.locale.languageCode, AppCountry.us.code);
  Locale get deutsch => Locale(AppLanguages.deutsch.locale.languageCode, AppCountry.germany.code);
  Locale get persian => Locale(AppLanguages.persian.locale.languageCode, AppCountry.iran.code);

  get localizationDelegates => [_delegate, _material, _widgets, _cupertino];
  AppLocalizationDelegate get _delegate => S.delegate;
  LocalizationsDelegate get _material => GlobalMaterialLocalizations.delegate;
  LocalizationsDelegate get _widgets => GlobalWidgetsLocalizations.delegate;
  LocalizationsDelegate get _cupertino => GlobalCupertinoLocalizations.delegate;

  Locale get getLocale => _loadData().language?.getLocale() ?? AppLanguages.english.getLocale();

  TextDirection get getTextDirection => _loadData().language?.getLocale() == persian ? TextDirection.rtl : TextDirection.ltr;

  TimeZone get getTimeZone {
    DateTime currentTime = DateTime.now();
    TimeZone timeZone = TimeZone(
      currentTime.timeZoneOffset.inMilliseconds,
      abbreviation: currentTime.timeZoneName,
      isDst: currentTime.timeZoneName.contains('DT'),
    );
    return timeZone;
  }

  AppCountry get getCountry {
    var timeZone = getTimeZone.toDurationCustomModel();
    for (var c in AppCountry.values) {
      for (var tz in c.timeZoneOffset!) {
        if (tz == timeZone) return c;
      }
    }
    return AppCountry.us;
  }
}

AppSettingDataEntity _loadData() => loadAppData()?.settingsEntity ?? const AppSettingDataEntity();