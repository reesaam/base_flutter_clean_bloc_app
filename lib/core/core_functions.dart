import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import '../components/storage/app_storage_module.dart';
import '../shared/shared_mems/core_mems/app_data_mem/app_data.dart';
import '../shared/shared_mems/core_mems/app_page_detail_mem/app_page_detail.dart';
import '../shared/shared_mems/core_mems/app_setting_data_mem/app_setting_data.dart';
import '../shared/shared_mems/core_mems/app_statistics_data_mem/app_statistics_data.dart';
import '../shared/shared_mems/core_mems/app_version_mem/app_version.dart';
import '../ui_kit/dialogs/app_alert_dialogs.dart';
import '../ui_kit/dialogs/app_alert_widget_dialogs.dart';
import '../ui_kit/dialogs/specific_dialogs/exceptions_dialog.dart';
import '../ui_kit/main_widgets/progress_indicator.dart';
import '../ui_kit/main_widgets/snackbar.dart';
import 'app_localization.dart';
import 'core_resources/core_enums.dart';
import 'core_resources/core_flags.dart';
import 'routing/app_router.dart';

appInitializationFunction() {
  kIsWeb ? null : SystemChannels.textInput.invokeMethod('TextInput.hide');
}

void appDebugPrint(message) => CoreFlags.isRelease ? null : debugPrint('[Debug] $message');
void appLogPrint(message) => debugPrint('[LOG] $message');

void popPage() {
  AppRouter().goBack();
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
    appVersionsEntity: appVersionData ?? loadedData?.appVersionsEntity,
    dataVersion: appDataVersionData ?? loadedData?.dataVersion,
    settingsEntity: appSettingData ?? loadedData?.settingsEntity,
    statisticsDataEntity: appStatisticsData ?? loadedData?.statisticsDataEntity,
  );
  AppStorage.to
      .saveAppData(appData: appData.mapper)
      .then((value) => value.fold((l) => AppExceptionsDialog.local(exception: l), (r) => result = r));
  return result;
}

AppDataEntity? loadAppData() {
  AppDataEntity? appData;
  AppStorage.to.loadAppData().then((value) => value.fold((l) => AppExceptionsDialog.local(exception: l), (r) => appData = r?.mapper));
  return appData;
}

void printAllData({bool? detailsIncluded}) async {
  AppDataEntity? appData = loadAppData();
  AppStorage.to.printData(appData: appData?.mapper, detailsIncluded: detailsIncluded);
}

Future<AppVersionListEntity?> getVersions() async {
  // var remoteResponse = await VersionsRemoteDataSource().getVersions();
  // var localResponse = await VersionsLocalDataSource().getVersions();
  // var response = remoteResponse.isRight() ? remoteResponse : localResponse;
  // return response.fold((l) => null, (r) => r);
}

Future<AppVersionEntity?> checkAvailableVersion() async {
  AppVersionListEntity? response = await getVersions();
  return response?.versionListEntity?.isEmpty ?? false ? null : response?.versionListEntity?.last;
}

Future<void> checkForceUpdate() async {
  AppVersionEntity? version = await checkAvailableVersion();
  if (version != null) {
    if (version.isForceUpdate == true) {
      // goToUpdatePage(popAll: true);
    }
  }
}

noInternetConnectionSnackBar() => AppSnackBar.show(message: Texts.to.connectionInternetNotAvailableText);

showLoadingDialog({bool? isDismissible}) =>
    AppAlertWidgetDialogs().withoutButton(widget: AppProgressIndicator.linear(), dismissible: isDismissible);

appExitDialog() =>
    AppAlertDialogs.withOkCancel(title: Texts.to.appExit, text: Texts.to.areYouSure, onTapOk: appExit, dismissible: true);

appRestart({AppPageDetailEntity? bootPage}) async {
  showLoadingDialog();
  appLogPrint('App Reset Triggered');
  // Get.reloadAll();
}

appReset() {}

appExit() {
  appLogPrint('App Exit Triggered');
  exit(0);
}
