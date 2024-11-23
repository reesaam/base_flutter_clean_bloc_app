import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'components/di/di_setup.dart';
import 'components/notifications/local_notifications/local_notifications.dart';
import 'core/app_localization.dart';
import 'core/core_functions.dart';
import 'core/core_info/app_info.dart';
import 'core/routing/app_router.dart';
import 'extensions/prints/print_extensions.dart';
import 'ui_kit/theme/themes.dart';

// import 'generated/l10n.dart';

void main() => initProject();

void initProject() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await GetStorage.init().withStatusPrint(isLog: true, featureName: 'Get Storage Initialization');
  await AppLocalNotifications().init().withStatusPrint(isLog: true, featureName: 'App Local Notifications Initialization');
  appInitializationFunction();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: AppInfo.appName,
      routerConfig: AppRouter().config(),
      color: AppThemes.to.canvasColor,
      theme: AppThemes.to,
      themeMode: ThemeMode.system,
      darkTheme: AppThemes.darkTheme,
      locale: AppLocalization.to.getLocale(),
      localizationsDelegates: AppLocalization.to.localizationDelegates,
      supportedLocales: AppLocalization.to.supportedLocales,
    );
  }
}
