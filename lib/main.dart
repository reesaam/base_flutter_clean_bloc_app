import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'components/dependency_injection/di_setup.dart';
import 'components/notifications/local_notifications/local_notifications.dart';
import 'core/app_localization.dart';
import 'core/core_functions.dart';
import 'core/core_info/app_info.dart';
import 'core/core_resources/page_details.dart';
import 'core/extensions/extensions_for_prints/extension_for_prints.dart';
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppInfo.appName,
      initialRoute: AppPageDetails.splashScreen.pageRoute,
      color: AppThemes.to.primaryColor,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.system,
      supportedLocales: AppLocalization.to.supportedLocales,
      localizationsDelegates: AppLocalization.to.localizationDelegates,
      locale: AppLocalization.to.getLocale(),
    );
  }
}
