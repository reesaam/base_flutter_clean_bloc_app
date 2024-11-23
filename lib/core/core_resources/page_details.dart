import '../../components/di/di_setup.dart';
import '../../shared/shared_mems/core_mems/app_page_detail_mem/app_page_detail.dart';
import '../annotations/dependency_injection_annotation.dart';
import '../app_localization.dart';
import '../routing/app_router.dart';
import 'icons.dart';

@DI.component
class AppPageDetailsList {
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
  //   pageName: Texts.to.adminStartPagePageName,
  //   pageRoute: _getPageRoute(AdminStartPage),
  // );
  //
  // AppPageDetailEntity adminTestPage = AppPageDetailEntity(
  //   pageName: Texts.to.adminTestPageName,
  //   pageRoute: _getPageRoute(AdminTestPage),
  // );
  //
  // AppPageDetailEntity adminAppInfoPage = AppPageDetailEntity(
  //   pageName: Texts.to.adminAppInfoPageName,
  //   pageRoute: _getPageRoute(AdminAppInfoPage),
  // );
  //
  // AppPageDetailEntity adminAppResourcesPage = AppPageDetailEntity(
  //   pageName: Texts.to.adminAppResourcesPageName,
  //   pageRoute: _getPageRoute(AdminAppResourcesPage),
  // );
  //
  // AppPageDetailEntity adminWidgetCheckPage = AppPageDetailEntity(
  //   pageName: Texts.to.adminWidgetCheckPageName,
  //   pageRoute: _getPageRoute(AdminWidgetCheckPage),
  // );
  //
  // AppPageDetailEntity adminDataFormatCheckPage = AppPageDetailEntity(
  //   pageName: Texts.to.adminDataFormatCheckPageName,
  //   pageRoute: _getPageRoute(AdminDataFormatCheckPage),
  // );
  //
  // AppPageDetailEntity adminVerifiersPage = AppPageDetailEntity(
  //   pageName: Texts.to.adminVerifiersPageName,
  //   pageRoute: _getPageRoute(AdminVerifiersPage),
  // );
  //
  // AppPageDetailEntity adminAppCountriesPage = AppPageDetailEntity(
  //   pageName: Texts.to.adminAppCountriesPageName,
  //   pageRoute: _getPageRoute(AdminAppCountriesPage),
  // );
  //
  // AppPageDetailEntity appDocs = AppPageDetailEntity(
  //   pageName: Texts.to.appDocsPageName,
  //   pageRoute: _getPageRoute(AppDocsPage),
  // );

  ///Main Pages
  // AppPageDetailEntity get splashScreen => AppPageDetailEntity(
  //   pageName: Texts.to.splashScreenPageName,
  //   pageRoute: _getPageRoute(SplashScreenPage),
  // );

  AppPageDetailEntity get homepage => AppPageDetailEntity(
    pageName: Texts.to.homePageName,
    pageRoute: HomeRoute.page.name,
    iconCode: AppIcons.home.icon!.codePoint,
    bottomBarItemNumber: 0,
    drawerPresence: true,
  );

  // AppPageDetailEntity get settings => AppPageDetailEntity(
  //   pageName: Texts.to.settingsPageName,
  //   pageRoute: _getPageRoute(SettingsPage),
  //   iconCode: AppIcons.settings.icon!.codePoint,
  //   bottomBarItemNumber: 1,
  //   drawerPresence: true,
  // );

  // AppPageDetailEntity get about => AppPageDetailEntity(
  //   pageName: Texts.to.aboutPageName,
  //   pageRoute: _getPageRoute(AboutPage),
  //   iconCode: AppIcons.about.icon!.codePoint,
  //   drawerPresence: true,
  // );

  // AppPageDetailEntity get update => AppPageDetailEntity(
  //   pageName: Texts.to.updatePageName,
  //   pageRoute: _getPageRoute(UpdatePage),
  //   iconCode: AppIcons.update.icon!.codePoint,
  //   drawerPresence: true,
  // );

  // AppPageDetailEntity get notFound => AppPageDetailEntity(
  //   pageName: Texts.to.notFoundPageName,
  //   pageRoute: _getPageRoute(NotFoundPage),
  // );
}