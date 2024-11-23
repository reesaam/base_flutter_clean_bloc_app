import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/app_localization.dart';
import '../../../core/core_functions.dart';
import '../../components/di/di_setup.dart';
import '../../core/core_info/app_info.dart';
import '../../core/core_resources/icons.dart';
import '../../core/core_resources/logos.dart';
import '../../core/core_resources/page_details.dart';
import '../../core/routing/app_router.dart';
import '../../extensions/data_types/int_extensions.dart';
import '../../shared/shared_mems/core_mems/app_page_detail_mem/app_page_detail.dart';
import '../resources/paddings.dart';
import '../resources/sizes.dart';
import '../resources/spaces.dart';
import '../general_widgets/dividers.dart';

class AppDrawer extends Drawer {
  AppDrawer({super.key});

  final AppRouter _appRouter = getIt<AppRouter>();

  @override
  double? get width => Get.width / 1.6;

  @override
  Widget? get child => SafeArea(
          child: Column(children: [
        header(),
        AppDividers.general(),
        Expanded(child: body()),
        AppDividers.general(),
        // footer(),
      ]));

  Widget header() => Container(
      padding: AppPaddings.drawerHeader,
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Image.asset(AppLogos.appLogo, width: AppSizes.drawerHeaderIconWidth),
        AppSpaces.w50,
        Text(AppInfo.appNameInitials, overflow: TextOverflow.ellipsis),
      ]));

  Widget body() {
    List<AppPageDetailEntity> drawerList = AppPageDetails.listPages.where((element) => element.drawerPresence == true).toList();
    return Column(children: List.generate(drawerList.length, (index) => _bodyItem(drawerList[index])));
  }

  Widget _bodyItem(AppPageDetailEntity page) => ListTile(
        title: Text(page.pageName ?? Texts.to.empty),
        leading: page.iconCode?.toIcon(),
        onTap: () => {popPage(), _appRouter.gotoPage(page)},
      );

  // Widget footer() => Container(
  //     padding: AppPaddings.drawerFooter,
  //     child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
  //       AppIcons.version,
  //       AppSpaces.w20,
  //       InkWell(onTap: () => goToUpdatePage(), child: Text('${Texts.to.version}: ${AppInfo.currentVersion.version}')),
  //     ]));
}
