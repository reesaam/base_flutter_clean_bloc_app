import 'package:dart_mem_annotation/annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/core_resources/core_enums.dart';
import '../app_setting_data/app_setting_data.dart';
import '../app_statistics_data/app_statistics_data.dart';
import '../app_version/app_version.dart';

part 'app_data.mem.dart';
part 'app_data.freezed.dart';
part 'app_data.g.dart';

@Mem.all(withFreezed: true)
class AppData {
  AppDataVersions? dataVersion;
  AppVersionList? appVersions;
  AppSettingData? settings;
  AppStatisticsData? statisticsData;
}