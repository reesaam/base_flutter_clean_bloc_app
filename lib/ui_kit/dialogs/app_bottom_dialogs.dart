import 'package:flutter/material.dart';

import '../../core/app_localization.dart';
import '../../core/core_functions.dart';
import '../../extensions/data_types/list_extensions.dart';
import '../buttons/app_general_button.dart';
import '../core_widgets.dart';
import '../general_widgets/dividers.dart';
import '../resources/elements.dart';
import '../resources/paddings.dart';
import '../resources/spaces.dart';

class AppBottomDialogs {
  _onTapCancel(BuildContext context) => popPage(context);

  withoutButton(BuildContext context, {String? title, required Widget form, bool? dismissible}) async {
    List<Widget> buttons = [];
    await _appBottomDialogGeneral(context, title: title, form: form, buttons: buttons, dismissible: dismissible);
  }

  withOk(
    BuildContext context, {
    String? title,
    required Widget form,
    required Function() onTapOk,
    bool? dismissible,
  }) async {
    List<Widget> buttons = [
      AppGeneralButton(
        text: Texts(context).to.ok,
        onTap: onTapOk,
        primaryColor: true,
      )
    ];
    await _appBottomDialogGeneral(context, title: title, form: form, buttons: buttons, dismissible: dismissible);
  }

  withCancel(BuildContext context, {String? title, required Widget form, bool? dismissible}) async {
    List<Widget> buttons = [AppGeneralButton(onSecondaryColor: true, text: Texts(context).to.cancel, onTap: _onTapCancel)];
    await _appBottomDialogGeneral(context, title: title, form: form, buttons: buttons, dismissible: dismissible);
  }

  withOkCancel(
    BuildContext context, {
    String? title,
    required Widget form,
    required Function() onTapOk,
    bool? dismissible,
  }) async {
    List<Widget> buttons = [
      AppGeneralButton(onSecondaryColor: true, text: Texts(context).to.cancel, onTap: () => _onTapCancel(context)),
      AppGeneralButton(
        text: Texts(context).to.ok,
        onTap: () => onTapOk(),
        primaryColor: true,
      ),
    ];
    await _appBottomDialogGeneral(context, title: title, form: form, buttons: buttons, dismissible: dismissible);
  }

  tappableItem(BuildContext context, {required String text, required Function() onTap}) => LayoutBuilder(
      builder: (context, constraints) => InkWell(
          onTap: onTap,
          child: SizedBox(
            width: constraints.maxWidth,
            height: 50,
            child: Text(text),
          )));

  _appBottomDialogGeneral(
    BuildContext context, {
    String? title,
    required Widget form,
    required List<Widget> buttons,
    bool? dismissible,
  }) async =>
      await showModalBottomSheet(
          context: context,
          useSafeArea: true,
          useRootNavigator: true,
          showDragHandle: true,
          isScrollControlled: true,
          isDismissible: dismissible ?? false,
          shape: AppElements.borderShapeModal,
          builder: (context) => SingleChildScrollView(
                  child: Column(mainAxisSize: MainAxisSize.max, children: [
                Padding(
                    padding: AppPaddings.generalBottomModal(context),
                    child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.center, children: [
                      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        title == null
                            ? shrinkSizedBox
                            : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                Text(title),
                                AppDividers.generalWithPrimaryColor,
                                AppSpaces.h10,
                              ]),
                        form,
                      ]),
                      AppSpaces.h40,
                      _renderButtonsBottomDialog(buttons),
                    ])),
                AppSpaces.h20,
              ])));

  Widget _renderButtonsBottomDialog(List<Widget> buttons) {
    List<Widget> list = List.empty(growable: true);
    int length = buttons.length;
    for (int i = 0; i < length; i++) {
      list.addIf(i == 0, shrinkOneExpanded);
      list.add(Expanded(flex: length > 1 ? (30 ~/ length) : 4, child: buttons[i]));
      list.add(i == length - 1 ? shrinkOneExpanded : shrinkExpanded(5));
    }
    return Padding(
      padding: AppPaddings.buttonXLarge,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: list),
    );
  }
}
