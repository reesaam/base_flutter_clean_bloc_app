import '../../core/annotations/dependency_injection_annotation.dart';
import '../../extensions/core/statistics_extension.dart';
import '../../shared/shared_mems/core_mems/app_statistics_data_mem/app_statistics_data.dart';
import '../di/di_setup.dart';

@DI.component
class AppStatistics {
  static AppStatistics get to => getIt<AppStatistics>();

  AppStatisticsDataEntity data = const AppStatisticsDataEntity();

  increaseLaunch() {
    data = data.increaseLaunch();
  }

  increaseLogin() {
    data = data.increaseLogin();
  }

  increaseCrashes() {
    data = data.increaseCrashes();
  }

  increasePageOpens() {
    data = data.increasePageOpens();
  }

  increaseApiCalls() {
    data = data.increaseApiCalls();
  }
}
