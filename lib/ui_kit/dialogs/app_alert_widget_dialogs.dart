import 'package:flutter/material.dart';

import '../../core/app_localization.dart';
import '../../core/core_functions.dart';
import '../../extensions/data_types/list_extensions.dart';
import '../buttons/app_general_button.dart';
import '../core_widgets.dart';
import '../general_widgets/dividers.dart';
import '../resources/elements.dart';
import '../resources/paddings.dart';

class AppAlertWidgetDialogs {
  _onTapCancel(BuildContext context) => popPage(context);

  withOkCancel(
    BuildContext context, {
    String? title,
    required Widget widget,
    required Function() onTapOk,
    bool? dismissible,
  }) async {
    List<Widget> buttons = [
      AppGeneralButton(text: Texts(context).to.cancel, onTap: _onTapCancel),
      AppGeneralButton(text: Texts(context).to.ok, primaryColor: true, onTap: onTapOk),
    ];
    await _appAlertWidgetDialog(
      context,
      title: title,
      widget: widget,
      buttons: buttons,
      dismissible: dismissible,
    );
  }

  withOk(
    BuildContext context, {
    String? title,
    required Widget widget,
    required Function() onTapOk,
    bool? dismissible,
  }) async {
    List<Widget> buttons = [
      AppGeneralButton(primaryColor: true, text: Texts(context).to.ok, onTap: onTapOk),
    ];
    await _appAlertWidgetDialog(
      context,
      title: title,
      widget: widget,
      buttons: buttons,
      dismissible: dismissible,
    );
  }

  withoutButton(
    BuildContext context, {
    String? title,
    required Widget widget,
    bool? dismissible,
  }) async {
    List<Widget> buttons = [];
    await _appAlertWidgetDialog(
      context,
      title: title,
      widget: widget,
      buttons: buttons,
      dismissible: dismissible,
    );
  }

  _appAlertWidgetDialog(
    BuildContext context, {
    String? title,
    required Widget widget,
    required List<Widget> buttons,
    bool? dismissible,
  }) async =>
      await showDialog(
          context: context,
          useSafeArea: true,
          useRootNavigator: true,
          barrierDismissible: dismissible ?? false,
          builder: (context) => Container(
                padding: AppPaddings.generalAlertDialog,
                child: AlertDialog.adaptive(
                  scrollable: true,
                  shape: AppElements.borderShapeAlertDialog,
                  title: title == null
                      ? shrinkSizedBox
                      : Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Text(title),
                          AppDividers.generalWithPrimaryColor,
                        ]),
                  content: widget,
                  actions: _renderButtonsAlertWidgetDialog(buttons),
                  actionsOverflowAlignment: OverflowBarAlignment.center,
                  actionsOverflowDirection: VerticalDirection.down,
                  actionsAlignment: MainAxisAlignment.center,
                ),
              ));

  List<Widget> _renderButtonsAlertWidgetDialog(List<Widget> buttons) {
    List<Widget> list = List.empty(growable: true);
    int length = buttons.length;
    for (int i = 0; i < length; i++) {
      list.addIf(i == 0, shrinkOneExpanded);
      list.add(Expanded(flex: length > 1 ? (30 ~/ length) : 2, child: buttons[i]));
      list.add(i == length - 1 ? shrinkOneExpanded : shrinkExpanded(2));
    }
    return [Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: list)];
  }
}
