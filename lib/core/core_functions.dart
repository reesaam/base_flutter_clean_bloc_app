import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../components/storage/app_storage_module.dart';
import '../shared/shared_mems/core_mems/app_data/app_data.dart';
import '../shared/shared_mems/core_mems/app_data/app_data.dart';
import '../shared/shared_mems/core_mems/app_data/app_data.dart';
import '../shared/shared_mems/core_mems/app_page_detail/app_page_detail.dart';
import '../shared/shared_mems/core_mems/app_setting_data/app_setting_data.dart';
import '../shared/shared_mems/core_mems/app_statistics_data/app_statistics_data.dart';
import '../shared/shared_mems/core_mems/app_version/app_version.dart';
import '../shared/shared_models/core_models/app_data/app_data.dart';
import '../shared/shared_models/core_models/app_page_detail/app_page_detail.dart';
import '../shared/shared_models/core_models/app_settings_data/app_setting_data.dart';
import '../shared/shared_models/core_models/app_statistics_data/app_statistics_data.dart';
import '../shared/shared_models/core_models/app_version/app_version.dart';
import '../ui_kit/dialogs/app_alert_dialogs.dart';
import '../ui_kit/dialogs/app_alert_widget_dialogs.dart';
import '../ui_kit/dialogs/specific_dialogs/exceptions_dialog.dart';
import '../ui_kit/main_widgets/progress_indicator.dart';
import '../ui_kit/main_widgets/snackbar.dart';
import 'app_localization.dart';
import 'app_routing/app_routing.dart';
import 'core_resources/core_enums.dart';
import 'core_resources/core_flags.dart';
import '../features/versions/data/versions_local_data_source.dart';
import '../features/versions/data/versions_remote_data_source.dart';

appInitializationFunction() {
  kIsWeb ? null : SystemChannels.textInput.invokeMethod('TextInput.hide');
}

void appDebugPrint(message) => CoreFlags.isRelease ? null : debugPrint('[Debug] $message');
void appLogPrint(message) => debugPrint('[LOG] $message');

void popPage() {
  Get.back();
}

nullFunction() => null;

bool? clearAppData() {
  bool result = false;
  AppStorage.to.clearStorage().then((value) => value.fold((l) => AppExceptionsDialog.local(exception: l), (r) => result = r));
  return result;
}

bool? saveAppData({
  AppVersionListEntity? appVersionData,
  AppDataVersions? appDataVersionData,
  AppSettingDataEntity? appSettingData,
  AppStatisticsDataEntity? appStatisticsData,
}) {
  bool result = false;
  AppDataEntity? loadedData = loadAppData();
  AppDataEntity appData = AppDataEntity(
    appVersionsEntity: appVersionData ?? loadedData?.appVersions,
    dataVersion: appDataVersionData ?? loadedData?.dataVersion,
    settingsEntity: appSettingData ?? loadedData?.settings,
    statisticsDataEntity: appStatisticsData ?? loadedData?.statisticsData,
  );
  AppStorage.to.saveAppData(appData: appData).then((value) => value.fold((l) => AppExceptionsDialog.local(exception: l), (r) => result = r));
  return result;
}

AppDataEntity? loadAppData() {
  AppDataEntity? appData;
  AppStorage.to.loadAppData().then((value) => value.fold((l) => AppExceptionsDialog.local(exception: l), (r) => appData = r));
  return appData;
}

void printAllData({bool? detailsIncluded}) async {
  AppDataEntity? appData = loadAppData();
  AppStorage.to.printData(appData: appData, detailsIncluded: detailsIncluded);
}

Future<AppVersionListEntity?> getVersions() async {
  var remoteResponse = await VersionsRemoteDataSource().getVersions();
  var localResponse = await VersionsLocalDataSource().getVersions();
  var response = remoteResponse.isRight() ? remoteResponse : localResponse;
  return response.fold((l) => null, (r) => r);
}

Future<AppVersionEntity?> checkAvailableVersion() async {
  AppVersionListEntity? response = await getVersions();
  return response?.versionsList.isEmpty ?? false ? null : response.versionListEntity?.last;
}

Future<void> checkForceUpdate() async {
  AppVersionEntity? version = await checkAvailableVersion();
  if (version != null) {
    if (version.isForceUpdate == true) {
      goToUpdatePage(popAll: true);
    }
  }
}

noInternetConnectionSnackBar(BuildContext context) => AppSnackBar.show(message: Texts(context).to.connectionInternetNotAvailableText);

showLoadingDialog(BuildContext context, {bool? isDismissible}) => AppAlertWidgetDialogs().withoutButton(widget: AppProgressIndicator.linear(), dismissible: isDismissible);

appExitDialog(BuildContext context) => AppAlertDialogs.withOkCancel(title: Texts(context).to.appExit, text: Texts(context).to.areYouSure, onTapOk: appExit, dismissible: true);

appRestart(BuildContext context, {AppPageDetailEntity? bootPage}) async {
  showLoadingDialog(context);
  appLogPrint('App Reset Triggered');
  Get.reloadAll();
}

appReset() {}

appExit() {
  appLogPrint('App Exit Triggered');
  exit(0);
}
