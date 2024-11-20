import 'package:flutter/material.dart';

import '../../extensions/context/context_extensions.dart';
import '../../ui_kit/core_widgets.dart';
import '../../ui_kit/resources/paddings.dart';

abstract class CoreView extends StatelessWidget {
  const CoreView({super.key});

  ///Main Widgets
  PreferredSizeWidget? get appBar => null;
  Widget? get drawer => null;
  Widget get body;
  Widget? get header => null;
  Widget? get footer => null;
  Widget? get bottomNavigationBar => null;
  Widget? get floatingActionButton => null;
  FloatingActionButtonLocation? get floatingActionButtonLocation => null;
  Widget? get bottomSheet => null;
  bool get scrollable => true;

  ///Variables
  EdgeInsets? get pagePadding => null;

  @override
  Widget build(BuildContext context) => PopScope(
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          drawerEnableOpenDragGesture: true,
          drawerEdgeDragWidth: context.width / 4,
          appBar: appBar,
          bottomNavigationBar: bottomNavigationBar,
          bottomSheet: bottomSheet,
          floatingActionButton: floatingActionButton,
          floatingActionButtonLocation: floatingActionButtonLocation ?? FloatingActionButtonLocation.endFloat,
          body: SafeArea(
              child: Column(children: [
            header ?? shrinkSizedBox,
            Expanded(
                child: Padding(
                    padding: pagePadding ?? AppPaddings.pages,
                    child: scrollable
                        ? SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            child: body,
                          )
                        : body)),
            footer ?? shrinkSizedBox,
          ]))));
}
