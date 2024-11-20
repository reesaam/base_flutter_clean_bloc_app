import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../extensions/regex/regex_extensions.dart';
import '../../shared/verifier_mems/regex/regex.dart';
import 'text_field_abstraction.dart';
import 'text_field_widget.dart';

/// These are Factories for AppTextField
/// This function uses [AppTextFieldWidget] for creating widget and the main and complete one is the [AppTextField.general]
/// [AppTextFieldAbstraction] is an Abstraction which explained in it's file

class AppTextField extends AppTextFieldWidget implements AppTextFieldAbstraction {
  const AppTextField._({
    required super.controller,
    super.undoController,
    super.label,
    super.hint,
    super.width,
    super.height,
    super.padding,
    super.margin,
    super.textInputType,
    super.textInputAction,
    super.textDirection,
    super.isPassword,
    super.leadingIcon,
    super.leadingAction,
    super.prefixIcon,
    super.prefixAction,
    super.suffixIcon,
    super.suffixAction,
    super.wholeWidgetAction,
    super.onChangedAction,
    super.regexValidator,
    super.inputFormatters,
    super.editable,
    super.hasCounter,
    super.errorText,
    super.maxLines,
    super.maxLength,
    super.showMaxLength,
    super.expandable,
    super.autoFocus,
    super.focusNode,
  });

  factory AppTextField.general({
    required TextEditingController controller,
    UndoHistoryController? undoController,
    String? label,
    String? hint,
    double? width,
    double? height,
    EdgeInsets? padding,
    EdgeInsets? margin,
    TextInputType? textInputType,
    TextInputAction? textInputAction,
    TextDirection? textDirection,
    bool? isPassword,
    Icon? leadingIcon,
    Function()? leadingAction,
    Icon? prefixIcon,
    Function()? prefixAction,
    Icon? suffixIcon,
    Function()? suffixAction,
    Function()? wholeWidgetAction,
    Function(String)? onChangedAction,
    AppRegexEntity? regexValidator,
    List<TextInputFormatter>? inputFormatters,
    bool? editable,
    bool? hasCounter,
    String? errorText,
    int? maxLines,
    int? maxLength,
    bool? showMaxLength,
    bool? expandable,
    bool? autoFocus,
    FocusNode? focusNode,
  }) =>
      AppTextField._(
        controller: controller,
        undoController: undoController,
        label: label,
        hint: hint,
        width: width,
        height: height,
        padding: padding,
        margin: margin,
        textInputType: textInputType,
        textInputAction: textInputAction,
        textDirection: textDirection,
        isPassword: isPassword,
        leadingIcon: leadingIcon,
        leadingAction: leadingAction,
        prefixIcon: prefixIcon,
        prefixAction: prefixAction,
        suffixIcon: suffixIcon,
        suffixAction: suffixAction,
        wholeWidgetAction: wholeWidgetAction,
        onChangedAction: onChangedAction,
        regexValidator: regexValidator,
        inputFormatters: inputFormatters,
        editable: editable,
        hasCounter: hasCounter,
        errorText: errorText,
        maxLines: maxLines,
        maxLength: maxLength,
        showMaxLength: showMaxLength,
        expandable: expandable,
        autoFocus: autoFocus,
        focusNode: focusNode,
      );

  factory AppTextField.password({
    required TextEditingController controller,
    UndoHistoryController? undoController,
    String? label,
    String? hint,
    double? width,
    double? height,
    EdgeInsets? padding,
    EdgeInsets? margin,
    TextInputType? textInputType,
    TextInputAction? textInputAction,
    TextDirection? textDirection,
    bool? isPassword,
    Icon? leadingIcon,
    Function()? leadingAction,
    Icon? prefixIcon,
    Function()? prefixAction,
    Icon? suffixIcon,
    Function()? suffixAction,
    Function()? wholeWidgetAction,
    Function(String)? onChangedAction,
    List<TextInputFormatter>? inputFormatters,
    bool? editable,
    bool? hasCounter,
    String? errorText,
    int? maxLength,
    bool? showMaxLength,
    bool? expandable,
    bool? autoFocus,
    FocusNode? focusNode,
    bool? isComplex,
  }) =>
      AppTextField._(
        controller: controller,
        undoController: undoController,
        label: label,
        hint: hint,
        width: width,
        height: height,
        padding: padding,
        margin: margin,
        textInputType: textInputType,
        textInputAction: textInputAction,
        textDirection: textDirection,
        isPassword: true,
        leadingIcon: leadingIcon,
        leadingAction: leadingAction,
        prefixIcon: prefixIcon,
        prefixAction: prefixAction,
        suffixIcon: suffixIcon,
        suffixAction: suffixAction,
        wholeWidgetAction: wholeWidgetAction,
        onChangedAction: onChangedAction,
        regexValidator: isComplex == true ? const AppRegexEntity().passwordHard : const AppRegexEntity().passwordEasy,
        inputFormatters: inputFormatters,
        editable: editable,
        hasCounter: hasCounter,
        errorText: errorText,
        maxLength: maxLength,
        showMaxLength: showMaxLength,
        expandable: expandable,
        autoFocus: autoFocus,
        focusNode: focusNode,
      );

  factory AppTextField.phone({
    required TextEditingController controller,
    UndoHistoryController? undoController,
    String? label,
    String? hint,
    double? width,
    double? height,
    EdgeInsets? padding,
    EdgeInsets? margin,
    TextInputAction? textInputAction,
    TextDirection? textDirection,
    Icon? leadingIcon,
    Function()? leadingAction,
    Icon? prefixIcon,
    Function()? prefixAction,
    Icon? suffixIcon,
    Function()? suffixAction,
    Function()? wholeWidgetAction,
    Function(String)? onChangedAction,
    List<TextInputFormatter>? inputFormatters,
    bool? editable,
    bool? hasCounter,
    String? errorText,
    int? maxLength,
    bool? showMaxLength,
    bool? autoFocus,
    FocusNode? focusNode,
  }) =>
      AppTextField._(
        controller: controller,
        undoController: undoController,
        label: label,
        hint: hint,
        width: width,
        height: height,
        padding: padding,
        margin: margin,
        textInputType: TextInputType.phone,
        textInputAction: textInputAction,
        textDirection: textDirection,
        isPassword: false,
        leadingIcon: leadingIcon,
        leadingAction: leadingAction,
        prefixIcon: prefixIcon,
        prefixAction: prefixAction,
        suffixIcon: suffixIcon,
        suffixAction: suffixAction,
        wholeWidgetAction: wholeWidgetAction,
        onChangedAction: onChangedAction,
        regexValidator: const AppRegexEntity().phoneNumber,
        inputFormatters: inputFormatters,
        editable: editable,
        hasCounter: hasCounter,
        errorText: errorText,
        maxLength: maxLength ?? 11,
        showMaxLength: showMaxLength,
        expandable: false,
        autoFocus: autoFocus,
        focusNode: focusNode,
      );

  factory AppTextField.email({
    required TextEditingController controller,
    UndoHistoryController? undoController,
    String? label,
    String? hint,
    double? width,
    double? height,
    EdgeInsets? padding,
    EdgeInsets? margin,
    TextInputAction? textInputAction,
    TextDirection? textDirection,
    Icon? leadingIcon,
    Function()? leadingAction,
    Icon? prefixIcon,
    Function()? prefixAction,
    Icon? suffixIcon,
    Function()? suffixAction,
    Function()? wholeWidgetAction,
    Function(String)? onChangedAction,
    List<TextInputFormatter>? inputFormatters,
    bool? editable,
    bool? hasCounter,
    String? errorText,
    int? maxLength,
    bool? showMaxLength,
    bool? expandable,
    bool? autoFocus,
    FocusNode? focusNode,
  }) =>
      AppTextField._(
        controller: controller,
        undoController: undoController,
        label: label,
        hint: hint,
        width: width,
        height: height,
        padding: padding,
        margin: margin,
        textInputType: TextInputType.emailAddress,
        textInputAction: textInputAction,
        textDirection: textDirection,
        leadingIcon: leadingIcon,
        leadingAction: leadingAction,
        prefixIcon: prefixIcon,
        prefixAction: prefixAction,
        suffixIcon: suffixIcon,
        suffixAction: suffixAction,
        wholeWidgetAction: wholeWidgetAction,
        onChangedAction: onChangedAction,
        regexValidator: const AppRegexEntity().email,
        inputFormatters: inputFormatters,
        editable: editable,
        hasCounter: hasCounter,
        errorText: errorText,
        maxLength: maxLength,
        showMaxLength: showMaxLength,
        expandable: expandable,
        autoFocus: autoFocus,
        focusNode: focusNode,
      );

  factory AppTextField.numeric({
    required TextEditingController controller,
    UndoHistoryController? undoController,
    String? label,
    String? hint,
    double? width,
    double? height,
    EdgeInsets? padding,
    EdgeInsets? margin,
    TextInputAction? textInputAction,
    TextDirection? textDirection,
    Icon? leadingIcon,
    Function()? leadingAction,
    Icon? prefixIcon,
    Function()? prefixAction,
    Icon? suffixIcon,
    Function()? suffixAction,
    Function()? wholeWidgetAction,
    Function(String)? onChangedAction,
    List<TextInputFormatter>? inputFormatters,
    bool? editable,
    bool? hasCounter,
    String? errorText,
    int? maxLines,
    int? maxLength,
    bool? showMaxLength,
    bool? expandable,
    bool? autoFocus,
    FocusNode? focusNode,
  }) =>
      AppTextField._(
        controller: controller,
        undoController: undoController,
        label: label,
        hint: hint,
        width: width,
        height: height,
        padding: padding,
        margin: margin,
        textInputType: TextInputType.number,
        textInputAction: textInputAction,
        textDirection: textDirection,
        leadingIcon: leadingIcon,
        leadingAction: leadingAction,
        prefixIcon: prefixIcon,
        prefixAction: prefixAction,
        suffixIcon: suffixIcon,
        suffixAction: suffixAction,
        wholeWidgetAction: wholeWidgetAction,
        onChangedAction: onChangedAction,
        regexValidator: const AppRegexEntity().numeric,
        inputFormatters: inputFormatters,
        editable: editable,
        hasCounter: hasCounter,
        errorText: errorText,
        maxLines: maxLines,
        maxLength: maxLength,
        showMaxLength: showMaxLength,
        expandable: expandable,
        autoFocus: autoFocus,
        focusNode: focusNode,
      );
}
