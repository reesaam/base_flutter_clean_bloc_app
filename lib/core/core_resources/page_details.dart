import 'package:flutter/material.dart';

import '../../components/di/di_setup.dart';
import '../../shared/shared_mems/core_mems/app_page_detail_mem/app_page_detail.dart';
import '../annotations/dependency_injection_annotation.dart';
import '../app_localization.dart';
import '../routing/app_router.dart';
import 'icons.dart';

@DI.component
class AppPageDetailsList {
  BuildContext context;
  AppPageDetailsList(this.context);
  static AppPageDetailsList get to => getIt<AppPageDetailsList>();

  List<AppPageDetailEntity> get listPages => [
        // splashScreen,
        homepage,
        // settings,
        // about,
        // update,
        // notFound,
      ];

  // List<AppPageDetailEntity> get listAdminPages => [
  //       adminStartPage,
  //       adminTestPage,
  //       adminAppInfoPage,
  //       adminAppResourcesPage,
  //       adminWidgetCheckPage,
  //       adminDataFormatCheckPage,
  //       adminVerifiersPage,
  //       adminAppCountriesPage,
  //       appDocs,
  //     ];

  ///Admin Pages
  // AppPageDetailEntity adminStartPage = AppPageDetailEntity(
  //   pageName: Texts(context).to.adminStartPagePageName,
  //   pageRoute: _getPageRoute(AdminStartPage),
  // );
  //
  // AppPageDetailEntity adminTestPage = AppPageDetailEntity(
  //   pageName: Texts(context).to.adminTestPageName,
  //   pageRoute: _getPageRoute(AdminTestPage),
  // );
  //
  // AppPageDetailEntity adminAppInfoPage = AppPageDetailEntity(
  //   pageName: Texts(context).to.adminAppInfoPageName,
  //   pageRoute: _getPageRoute(AdminAppInfoPage),
  // );
  //
  // AppPageDetailEntity adminAppResourcesPage = AppPageDetailEntity(
  //   pageName: Texts(context).to.adminAppResourcesPageName,
  //   pageRoute: _getPageRoute(AdminAppResourcesPage),
  // );
  //
  // AppPageDetailEntity adminWidgetCheckPage = AppPageDetailEntity(
  //   pageName: Texts(context).to.adminWidgetCheckPageName,
  //   pageRoute: _getPageRoute(AdminWidgetCheckPage),
  // );
  //
  // AppPageDetailEntity adminDataFormatCheckPage = AppPageDetailEntity(
  //   pageName: Texts(context).to.adminDataFormatCheckPageName,
  //   pageRoute: _getPageRoute(AdminDataFormatCheckPage),
  // );
  //
  // AppPageDetailEntity adminVerifiersPage = AppPageDetailEntity(
  //   pageName: Texts(context).to.adminVerifiersPageName,
  //   pageRoute: _getPageRoute(AdminVerifiersPage),
  // );
  //
  // AppPageDetailEntity adminAppCountriesPage = AppPageDetailEntity(
  //   pageName: Texts(context).to.adminAppCountriesPageName,
  //   pageRoute: _getPageRoute(AdminAppCountriesPage),
  // );
  //
  // AppPageDetailEntity appDocs = AppPageDetailEntity(
  //   pageName: Texts(context).to.appDocsPageName,
  //   pageRoute: _getPageRoute(AppDocsPage),
  // );

  ///Main Pages
  // AppPageDetailEntity get splashScreen => AppPageDetailEntity(
  //   pageName: Texts(context).to.splashScreenPageName,
  //   pageRoute: _getPageRoute(SplashScreenPage),
  // );

  AppPageDetailEntity get homepage => AppPageDetailEntity(
    pageName: Texts(context).to.homePageName,
    pageRoute: HomeRoute.page.name,
    iconCode: AppIcons.home.icon!.codePoint,
    bottomBarItemNumber: 0,
    drawerPresence: true,
  );

  // AppPageDetailEntity get settings => AppPageDetailEntity(
  //   pageName: Texts(context).to.settingsPageName,
  //   pageRoute: _getPageRoute(SettingsPage),
  //   iconCode: AppIcons.settings.icon!.codePoint,
  //   bottomBarItemNumber: 1,
  //   drawerPresence: true,
  // );

  // AppPageDetailEntity get about => AppPageDetailEntity(
  //   pageName: Texts(context).to.aboutPageName,
  //   pageRoute: _getPageRoute(AboutPage),
  //   iconCode: AppIcons.about.icon!.codePoint,
  //   drawerPresence: true,
  // );

  // AppPageDetailEntity get update => AppPageDetailEntity(
  //   pageName: Texts(context).to.updatePageName,
  //   pageRoute: _getPageRoute(UpdatePage),
  //   iconCode: AppIcons.update.icon!.codePoint,
  //   drawerPresence: true,
  // );

  // AppPageDetailEntity get notFound => AppPageDetailEntity(
  //   pageName: Texts(context).to.notFoundPageName,
  //   pageRoute: _getPageRoute(NotFoundPage),
  // );
}