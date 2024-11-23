import 'package:flutter/material.dart';

import '../../shared/shared_mems/core_mems/app_version_mem/app_version.dart';
import '../core_functions.dart';

class AppInfo {
  static String get appName => 'Base Flutter Clean BloC (Cubit) App';
  static String get appNameInitials => 'BFCBCA';
  static String get website => '';

  //Versioning
  static AppVersionEntity get currentVersion => const AppVersionEntity(version: '0.0.1');
  static AppVersionListEntity versions(BuildContext context) => loadAppData()?.appVersionsEntity ?? const AppVersionListEntity();
  static int versionsCounter(BuildContext context) => versions(context).versionListEntity?.length ?? 0;

  //Domains
  static String get baseUrl => 'resam.site';
  static String get subDomain => 'basefluttercleanbloc';

  //FileNames
  static String get fileNameAPK => '${AppInfo.appNameInitials}_android.apk';
  static String get fileNameIPA => '${AppInfo.appNameInitials}_ios.ipa';
  static String get fileNameBackup => '${AppInfo.appNameInitials}_Backup.json';
}
