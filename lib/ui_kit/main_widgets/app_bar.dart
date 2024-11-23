import 'package:flutter/material.dart';

import '../../../core/app_localization.dart';
import '../../extensions/material_widgets/extension_on_text.dart';
import '../../shared/shared_mems/core_mems/app_page_detail_mem/app_page_detail.dart';
import '../resources/paddings.dart';
import '../theme/themes.dart';

class AppAppBar extends AppBar {
  AppAppBar(this.context, {
    super.key,
    required this.pageDetail,
    this.withOutTitle,
    this.barTitle,
    this.barLeading,
    this.barAction,
  }) : super();

  final BuildContext context;
  final AppPageDetailEntity pageDetail;
  final bool? withOutTitle;
  final Widget? barTitle;
  final Widget? barLeading;
  final Widget? barAction;

  @override
  Widget? get title => withOutTitle == true ? null : barTitle ?? _normalTextTitle;

  @override
  Widget? get leading => barLeading;

  @override
  List<Widget>? get actions => [
        Padding(
          padding: AppPaddings.appBarActions,
          child: barAction,
        )
      ];

  @override
  bool? get centerTitle => true;

  Widget get _normalTextTitle => Text(pageDetail.pageName ?? Texts(context).to.empty, style: AppThemes.to.textTheme.titleSmall)
      .withColor(AppThemes.to.appBarTheme.foregroundColor ?? AppThemes.to.primaryColor);
}
