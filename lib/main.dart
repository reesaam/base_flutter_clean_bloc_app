import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'components/di/di_setup.dart';
import 'core/routing/app_router.dart';

// import 'generated/l10n.dart';

void main() => initProject();

void initProject() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  // await GetStorage.init().withStatusPrint(isLog: true, featureName: 'Get Storage Initialization');
  // await AppLocalNotifications().init().withStatusPrint(isLog: true, featureName: 'App Local Notifications Initialization');
  // appInitializationFunction();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter().config(),
      color: Colors.white,
      // title: AppInfo.appName,
      // initialRoute: AppPageDetails.splashScreen.pageRoute,
      // color: AppThemes.to.primaryColor,
      // theme: AppThemes.lightTheme,
      // darkTheme: AppThemes.darkTheme,
      // themeMode: ThemeMode.system,
      // supportedLocales: AppLocalization.to.supportedLocales,
      // localizationsDelegates: AppLocalization.to.localizationDelegates,
      // locale: AppLocalization.to.getLocale(),
    );
  }
}
