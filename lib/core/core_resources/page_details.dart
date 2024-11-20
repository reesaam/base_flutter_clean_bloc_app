import 'package:flutter/material.dart';

import '../../extensions/core/routing_extensions.dart';
import '../../features/homepage/presentation/pages/homepage_view.dart';
import '../../shared/shared_mems/core_mems/app_page_detail/app_page_detail.dart';
import '../app_localization.dart';
import 'icons.dart';

class AppPageDetails {

  static List<AppPageDetailEntity> get listPages => [
        // splashScreen,
        homepage,
        // settings,
        // about,
        // update,
        // notFound,
      ];

  // static List<AppPageDetailEntity> get listAdminPages => [
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
  // static AppPageDetailEntity adminStartPage = AppPageDetailEntity(
  //   pageName: Texts.to.adminStartPagePageName,
  //   pageRoute: _getPageRoute(AdminStartPage),
  // );
  //
  // static AppPageDetailEntity adminTestPage = AppPageDetailEntity(
  //   pageName: Texts.to.adminTestPageName,
  //   pageRoute: _getPageRoute(AdminTestPage),
  // );
  //
  // static AppPageDetailEntity adminAppInfoPage = AppPageDetailEntity(
  //   pageName: Texts.to.adminAppInfoPageName,
  //   pageRoute: _getPageRoute(AdminAppInfoPage),
  // );
  //
  // static AppPageDetailEntity adminAppResourcesPage = AppPageDetailEntity(
  //   pageName: Texts.to.adminAppResourcesPageName,
  //   pageRoute: _getPageRoute(AdminAppResourcesPage),
  // );
  //
  // static AppPageDetailEntity adminWidgetCheckPage = AppPageDetailEntity(
  //   pageName: Texts.to.adminWidgetCheckPageName,
  //   pageRoute: _getPageRoute(AdminWidgetCheckPage),
  // );
  //
  // static AppPageDetailEntity adminDataFormatCheckPage = AppPageDetailEntity(
  //   pageName: Texts.to.adminDataFormatCheckPageName,
  //   pageRoute: _getPageRoute(AdminDataFormatCheckPage),
  // );
  //
  // static AppPageDetailEntity adminVerifiersPage = AppPageDetailEntity(
  //   pageName: Texts.to.adminVerifiersPageName,
  //   pageRoute: _getPageRoute(AdminVerifiersPage),
  // );
  //
  // static AppPageDetailEntity adminAppCountriesPage = AppPageDetailEntity(
  //   pageName: Texts.to.adminAppCountriesPageName,
  //   pageRoute: _getPageRoute(AdminAppCountriesPage),
  // );
  //
  // static AppPageDetailEntity appDocs = AppPageDetailEntity(
  //   pageName: Texts.to.appDocsPageName,
  //   pageRoute: _getPageRoute(AppDocsPage),
  // );

  ///Main Pages
  // static AppPageDetailEntity get splashScreen => AppPageDetailEntity(
  //   pageName: Texts.to.splashScreenPageName,
  //   pageRoute: _getPageRoute(SplashScreenPage),
  // );

  static AppPageDetailEntity get homepage => AppPageDetailEntity(
    pageName: Texts.to.homePageName,
    pageRoute: _getPageRoute(HomePage),
    iconCode: AppIcons.home.icon!.codePoint,
    bottomBarItemNumber: 0,
    drawerPresence: true,
  );

  // static AppPageDetailEntity get settings => AppPageDetailEntity(
  //   pageName: Texts.to.settingsPageName,
  //   pageRoute: _getPageRoute(SettingsPage),
  //   iconCode: AppIcons.settings.icon!.codePoint,
  //   bottomBarItemNumber: 1,
  //   drawerPresence: true,
  // );

  // static AppPageDetailEntity get about => AppPageDetailEntity(
  //   pageName: Texts.to.aboutPageName,
  //   pageRoute: _getPageRoute(AboutPage),
  //   iconCode: AppIcons.about.icon!.codePoint,
  //   drawerPresence: true,
  // );

  // static AppPageDetailEntity get update => AppPageDetailEntity(
  //   pageName: Texts.to.updatePageName,
  //   pageRoute: _getPageRoute(UpdatePage),
  //   iconCode: AppIcons.update.icon!.codePoint,
  //   drawerPresence: true,
  // );

  // static AppPageDetailEntity get notFound => AppPageDetailEntity(
  //   pageName: Texts.to.notFoundPageName,
  //   pageRoute: _getPageRoute(NotFoundPage),
  // );
}

String _getPageRoute(Type page) => page.route;