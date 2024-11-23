import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../core/annotations/dependency_injection_annotation.dart';
import '../../core/app_localization.dart';
import '../../core/core_functions.dart';
import '../../core/core_info/core_defaults.dart';
import '../../core/core_resources/core_enums.dart';
import '../../core/core_resources/texts.dart';
import '../../extensions/data_types/date_time_extensions.dart';
import '../../extensions/data_types/duration_extensions.dart';
import '../../extensions/data_types/string_extensions.dart';
import '../../shared/shared_mems/core_mems/app_data_mem/app_data.dart';
import '../di/di_setup.dart';
import '../failures/local_exception.dart';
import '../file_functions/file_functions.dart';
import 'storage_providers/app_local_storage.dart';
import 'storage_providers/app_shared_preferences.dart';

@DI.component
class AppStorage {
  final _storage = switch (CoreDefaults.defaultStorageProvider) {
    AppStorageProvider.getStorage => AppLocalStorage(),
    AppStorageProvider.sharedPreferences => AppSharedPreferences(),
  };

  static AppStorage get to => getIt<AppStorage>();

  ///Keys
  final _keyAppData = AppStorageKeys.keyAppData;

  Future<Either<LocalException, bool>> clearStorage() async => await _storage.clearStorage(_keyAppData.name);

  ///AppData
  Future<Either<LocalException, bool>> saveAppData({required AppDataModel appData}) async =>
      await _storage.saveData(key: _keyAppData.name, data: appData.toJson());

  Future<Either<LocalException, AppDataModel?>> loadAppData() async {
    final response = await _storage.loadData(_keyAppData.name);
    final result = response.map((r) => r == null ? null : AppDataModel.fromJson(r));
    return result;
  }

  Future<Either<LocalException, bool>> clearAppData() async => await _storage.clearStorage(_keyAppData.name);

  ///Manage Data
  Future<void> exportData() async {
    final appData = await loadAppData();
    appData.fold(
      (l) => null,
      (r) async {
        var appDataJson = (appData as AppDataModel).toJson();
        Uint8List data = appDataJson.toString().toUInt8List();
        String? savedPath = await AppFileFunctions.to.saveFile(fileName: AppTexts.settingBackupFilename, data: data);
        appLogPrint('File Path: $savedPath');
        appLogPrint('Backup File Exported');
      },
    );
  }

  Future<void> importData() async {
    var appDataFile = await AppFileFunctions.to.pickFile();

    if (appDataFile != null) {
      clearAppData();
      String stringCharCodes = String.fromCharCodes(appDataFile.readAsBytesSync());
      AppDataModel appData = AppDataModel.fromJson(json.decode(stringCharCodes));

      ///Filling Data Fields
      if (appData.dataVersion == AppDataVersions.values.last) {
        saveAppData(appData: appData);
        appLogPrint('Data Imported');
      } else {
        appLogPrint('Data Version is not Compatible, Converter is not Implemented\nData Import Failed');
      }
    } else {
      appDebugPrint('Imported File was NUll');
    }
  }

  void printData({AppDataModel? appData, bool? detailsIncluded}) {
    String unknown = '';

    if (appData != null) {
      appLogPrint('==> App Data:');
      appLogPrint('App Version: ${appData.appVersionsModel?.versionListModel?.lastOrNull?.version ?? unknown}');
      detailsIncluded == true ? appLogPrint('App Version Type: ${appData.appVersionsModel?.versionListModel?.lastOrNull?.versionType ?? unknown}') : null;
      appLogPrint('App Data Type: ${appData.dataVersion?.number ?? unknown}');
      if (detailsIncluded == true) {
        appLogPrint('==> Details:');
        appLogPrint('Settings / Dark Mode: ${appData.settingsModel?.darkMode}');
        appLogPrint('Settings / Language: ${appData.settingsModel?.language?.languageName}');
      }
    }

    if (appData?.statisticsDataModel != null) {
      appLogPrint('==> Statistics:');
      appLogPrint('Statistics / Launches: ${appData?.statisticsDataModel?.launches}');
      appLogPrint('Statistics / Logins: ${appData?.statisticsDataModel?.logins}');
      appLogPrint('Statistics / Crashes: ${appData?.statisticsDataModel?.crashes}');
      appLogPrint('Statistics / Page Opens: ${appData?.statisticsDataModel?.pageOpens}');
      appLogPrint('Statistics / API Calls: ${appData?.statisticsDataModel?.apiCalls}');
      appLogPrint('Statistics / Install DateTime: ${appData?.statisticsDataModel?.installDateTime?.toDateTimeFormat}');
      appLogPrint('Statistics / Install Duration: ${appData?.statisticsDataModel?.installDuration?.toConditionalFormat}');
    }
  }
}
