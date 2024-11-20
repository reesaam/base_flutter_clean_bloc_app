import 'package:dart_mem_annotation/annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/core_resources/core_enums.dart';

part 'app_version.mem.dart';
part 'app_version.freezed.dart';
part 'app_version.g.dart';

@Mem.all(withFreezed: true)
class AppVersion {
  String? version;
  List<String>? changes;
  AppVersionTypes? versionType;
  bool? isForceUpdate;
}

@Mem.all(withFreezed: true)
class AppVersionList {
  List<AppVersion>? versionList;
}