import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/app_localization.dart';
import '../../components/di/di_setup.dart';
import '../../core/core_resources/icons.dart';
import '../../core/core_resources/page_details.dart';
import '../../core/routing/app_router.dart';
import '../../extensions/data_types/int_extensions.dart';
import '../../shared/shared_mems/core_mems/app_page_detail_mem/app_page_detail.dart';
import '../theme/themes.dart';

class AppBottomNavigationBar extends StatefulWidget {
  final int? selectedIndex;
  const AppBottomNavigationBar({super.key, this.selectedIndex});

  @override
  State<AppBottomNavigationBar> createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
  RxInt selectedIndex = 0.obs;
  List<AppPageDetailEntity> pagesList = AppPageDetailsList.to.listPages.where((element) => element.bottomBarItemNumber != null).toList();

  @override
  void initState() {
    pagesList.sort((a, b) => a.bottomBarItemNumber!.compareTo(b.bottomBarItemNumber!));
    super.initState();
  }

  void _onItemTap(int index) {
    selectedIndex.value = index;
    AppRouter.to.gotoPage(pagesList[index]);
  }

  @override
  Widget build(BuildContext context) {
    selectedIndex.value = widget.selectedIndex ?? 0;
    return Obx(() => BottomNavigationBar(
          currentIndex: selectedIndex.value,
          onTap: (index) => _onItemTap(index),
          items: List<BottomNavigationBarItem>.generate(
            pagesList.length,
            (index) => _generateBottomNavigationBarItem(pagesList[index]),
          ),
          selectedItemColor: AppThemes.to.canvasColor,
          unselectedItemColor: AppThemes.to.canvasColor.withAlpha(400),
        ));
  }

  BottomNavigationBarItem _generateBottomNavigationBarItem(AppPageDetailEntity route) => BottomNavigationBarItem(
        icon: _createIcon(route),
        label: _createLabel(route),
      );

  Icon _createIcon(AppPageDetailEntity route) => pagesList.singleWhere((element) => element.pageRoute == route.pageRoute).iconCode?.toIcon() ?? AppIcons.none;

  String _createLabel(AppPageDetailEntity route) => pagesList.singleWhere((element) => element.pageRoute == route.pageRoute).pageName ?? Texts.to.empty;
}
