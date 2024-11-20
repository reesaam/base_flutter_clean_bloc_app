import 'package:dart_mem_annotation/annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/core_resources/core_enums.dart';
import '../../../../core/core_resources/countries.dart';

part 'app_setting_data.mem.dart';
part 'app_setting_data.freezed.dart';
part 'app_setting_data.g.dart';

@Mem.all(withFreezed: true)
class AppSettingData {
  bool? darkMode;
  AppLanguages? language;
  AppCountry? country;
}
