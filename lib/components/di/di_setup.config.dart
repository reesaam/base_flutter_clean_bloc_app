// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../core/app_localization.dart' as _i19;
import '../../features/homepage/presentation/manager/homepage_cubit.dart'
    as _i189;
import '../../ui_kit/theme/themes.dart' as _i870;
import '../connectivity/connectivity.dart' as _i273;
import '../failures/general_exception.dart' as _i224;
import '../failures/local_exception.dart' as _i258;
import '../failures/network_exception.dart' as _i89;
import '../file_functions/file_functions.dart' as _i322;
import '../network/dio.dart' as _i74;
import '../notifications/local_notifications/local_notification_controller.dart'
    as _i84;
import '../notifications/local_notifications/local_notifications.dart' as _i682;
import '../permissions/permissions.dart' as _i816;
import '../share/share.dart' as _i854;
import '../statistics/statistics.dart' as _i893;
import '../storage/app_storage_module.dart' as _i627;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i273.AppConnectionChecker>(() => _i273.AppConnectionChecker());
  gh.factory<_i322.AppFileFunctions>(() => _i322.AppFileFunctions());
  gh.factory<_i74.DioCore>(() => _i74.DioCore());
  gh.factory<_i682.AppLocalNotifications>(() => _i682.AppLocalNotifications());
  gh.factory<_i84.AppLocalNotificationController>(
      () => _i84.AppLocalNotificationController());
  gh.factory<_i816.AppPermissions>(() => _i816.AppPermissions());
  gh.factory<_i854.AppShare>(() => _i854.AppShare());
  gh.factory<_i893.AppStatistics>(() => _i893.AppStatistics());
  gh.factory<_i627.AppStorage>(() => _i627.AppStorage());
  gh.factory<_i19.AppLocalization>(() => _i19.AppLocalization());
  gh.factory<_i189.HomepageCubit>(() => _i189.HomepageCubit());
  gh.factory<_i870.AppThemes>(() => _i870.AppThemes());
  gh.factory<_i224.GeneralException>(() => _i224.GeneralException(
        message: gh<String>(),
        statusCode: gh<int>(),
      ));
  gh.factory<_i258.LocalException>(() => _i258.LocalException(
        message: gh<String>(),
        statusCode: gh<int>(),
      ));
  gh.factory<_i89.NetworkException>(() => _i89.NetworkException(
        message: gh<String>(),
        statusCode: gh<int>(),
      ));
  return getIt;
}
