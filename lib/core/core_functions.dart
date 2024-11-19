import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../components/storage/app_storage_module.dart';
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
  goBack();
}

nullFunction() => null;

bool? clearAppData(BuildContext context) {
  bool result = false;
  AppStorage.to.clearStorage().then((value) => value.fold((l) => AppExceptionsDialog.local(context, exception: l), (r) => result = r));
  return result;
}

bool? saveAppData(
  BuildContext context, {
  AppVersionsList? appVersionData,
  AppDataVersions? appDataVersionData,
  AppSettingData? appSettingData,
  AppStatisticsData? appStatisticsData,
}) {
  bool result = false;
  AppData? loadedData = loadAppData(context);
  AppData appData = AppData(
    appVersions: appVersionData ?? loadedData?.appVersions,
    dataVersion: appDataVersionData ?? loadedData?.dataVersion,
    settings: appSettingData ?? loadedData?.settings,
    statisticsData: appStatisticsData ?? loadedData?.statisticsData,
  );
  AppStorage.to.saveAppData(appData: appData).then((value) => value.fold((l) => AppExceptionsDialog.local(context, exception: l), (r) => result = r));
  return result;
}

AppData? loadAppData(BuildContext context) {
  AppData? appData;
  AppStorage.to.loadAppData().then((value) => value.fold((l) => AppExceptionsDialog.local(context, exception: l), (r) => appData = r));
  return appData;
}

void printAllData(BuildContext context, {bool? detailsIncluded}) async {
  AppData? appData = loadAppData(context);
  AppStorage.to.printData(appData: appData, detailsIncluded: detailsIncluded);
}

Future<AppVersionsList?> getVersions() async {
  var remoteResponse = await VersionsRemoteDataSource().getVersions();
  var localResponse = await VersionsLocalDataSource().getVersions();
  var response = remoteResponse.isRight() ? remoteResponse : localResponse;
  return response.fold((l) => null, (r) => r);
}

Future<AppVersion?> checkAvailableVersion() async {
  AppVersionsList? response = await getVersions();
  return response?.versionsList.isEmpty ?? false ? null : response?.versionsList.last;
}

Future<void> checkForceUpdate() async {
  AppVersion? version = await checkAvailableVersion();
  if (version != null) {
    if (version.isForceUpdate == true) {
      goToUpdatePage(popAll: true);
    }
  }
}

noInternetConnectionSnackBar(BuildContext context) => AppSnackBar.show(message: Texts(context).to.connectionInternetNotAvailableText);

showLoadingDialog(BuildContext context, {bool? isDismissible}) =>
    AppAlertWidgetDialogs().withoutButton(context, widget: AppProgressIndicator.linear(), dismissible: isDismissible);

appExitDialog(BuildContext context) => AppAlertDialogs.withOkCancel(
      context,
      title: Texts(context).to.appExit,
      text: Texts(context).to.areYouSure,
      onTapOk: appExit,
      dismissible: true,
    );

appRestart(BuildContext context, {AppPageDetail? bootPage}) async {
  showLoadingDialog(context);
  appLogPrint('App Reset Triggered');
  ///TODO: App Restart Implementation
  // Get.reloadAll();
}

appReset() {}

appExit() {
  appLogPrint('App Exit Triggered');
  exit(0);
}
