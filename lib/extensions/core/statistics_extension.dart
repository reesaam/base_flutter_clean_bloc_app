import 'package:flutter/material.dart';

import '../../core/core_functions.dart';
import '../../shared/shared_mems/core_mems/app_statistics_data/app_statistics_data.dart';

extension ExtensionAppStatisticsClear on AppStatisticsDataEntity {
  AppStatisticsDataEntity clearData() => const AppStatisticsDataEntity();
}

extension ExtensionAppStatisticsIncreases on AppStatisticsDataEntity {
  //Data
  AppStatisticsDataEntity increaseLaunch() {
    final result = copyWith(launches: launches == null ? 0 : launches! + 1);
    _saveDataOnStorage(result);
    return result;
  }

  AppStatisticsDataEntity increaseLogin() {
    final result = copyWith(logins: logins == null ? 0 : logins! + 1);
    _saveDataOnStorage(result);
    return result;
  }

  AppStatisticsDataEntity increaseCrashes() {
    final result = copyWith(crashes: crashes == null ? 0 : crashes! + 1);
    _saveDataOnStorage(result);
    return result;
  }

  AppStatisticsDataEntity increasePageOpens() {
    final result = copyWith(pageOpens: pageOpens == null ? 0 : pageOpens! + 1);
    _saveDataOnStorage(result);
    return result;
  }

  AppStatisticsDataEntity increaseApiCalls() {
    final result = copyWith(apiCalls: apiCalls == null ? 0 : apiCalls! + 1);
    _saveDataOnStorage(result);
    return result;
  }
}

extension ExtensionAppStatisticsCalculations on AppStatisticsDataEntity {
  AppStatisticsDataEntity calculateInstallDuration() =>
      installDateTime == null ? this : copyWith(installDuration: DateTime.now().difference(installDateTime!));
}

_saveDataOnStorage(AppStatisticsDataEntity data) => saveAppData(appStatisticsData: data);