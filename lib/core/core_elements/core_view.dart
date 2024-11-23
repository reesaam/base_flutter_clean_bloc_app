import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/di/di_setup.dart';
import '../../extensions/context/context_extensions.dart';
import '../../ui_kit/core_widgets.dart';
import '../../ui_kit/resources/paddings.dart';
import '../../ui_kit/theme/themes.dart';
import 'core_cubit.dart';

abstract class CoreView<Controller extends CoreCubit> extends StatelessWidget {
  const CoreView({super.key});

  Controller get controller => getIt<Controller>();

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
  Widget build(BuildContext context) => MultiBlocProvider(
      providers: controller.cubits,
      child: Builder(
          builder: (context) => PopScope(
              child: Scaffold(
                  resizeToAvoidBottomInset: true,
                  backgroundColor: AppThemes.to.canvasColor,
                  appBar: appBar,
                  drawer: drawer,
                  drawerEnableOpenDragGesture: true,
                  drawerEdgeDragWidth: context.width / 4,
                  drawerDragStartBehavior: DragStartBehavior.start,
                  endDrawerEnableOpenDragGesture: true,
                  floatingActionButton: floatingActionButton,
                  floatingActionButtonLocation: floatingActionButtonLocation ?? FloatingActionButtonLocation.endFloat,
                  bottomSheet: bottomSheet,
                  bottomNavigationBar: bottomNavigationBar,
                  body: SafeArea(
                      child: Column(children: [
                    header ?? shrinkSizedBox,
                    Expanded(
                        child: Padding(
                            padding: pagePadding ?? AppPaddings.pages,
                            child: scrollable
                                ? SingleChildScrollView(physics: const BouncingScrollPhysics(), scrollDirection: Axis.vertical, child: body)
                                : body)),
                    footer ?? shrinkSizedBox,
                  ]))))));
}
