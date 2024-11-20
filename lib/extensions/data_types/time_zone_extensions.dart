import 'package:flutter/material.dart';
import 'package:timezone/timezone.dart';

import '../../core/app_localization.dart';
import '../../core/core_resources/countries.dart';
import '../../shared/helper_mems/custom_duration/custom_duration.dart';
import 'custom_duration_extensions.dart';
import 'duration_extensions.dart';

extension ExtensionTimeZone on TimeZone {
  String countryName(BuildContext context) {
    String result = Texts(context).to.notAvailableInitials;
    for (var country in AppCountry.values) {
      for (var abbr in country.timeZoneAbbreviation!) {
        if (abbr == abbreviation) {
          result = country.countryName ?? Texts(context).to.notAvailableInitials;
        }
      }
    }
    return result;
  }

  CustomDurationEntity toDurationCustomModel() => Duration(milliseconds: offset).calculateDifference();

  String toFormattedOffset() => toDurationCustomModel().toDuration().toTimeZoneFormat();
}
