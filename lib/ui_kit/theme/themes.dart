import 'package:flutter/material.dart';

import '../../components/di/di_setup.dart';
import '../../components/storage/app_storage_module.dart';
import '../../core/annotations/dependency_injection_annotation.dart';
import '../../core/core_resources/defaults.dart';
import '../../shared/helper_mems/theme_data/theme_data_model.dart';
import '../resources/elements.dart';
import 'themes_variables.dart';

@DI.component
class AppThemes {
  ///Main Theme Functions
  static AppThemes get _to => getIt<AppThemes>();
  static ThemeData get to => _to.getTheme();

  static ThemeData get lightTheme => _to.getTheme(isSystemDark: false);
  static ThemeData get darkTheme => _to.getTheme(isSystemDark: true);

  ThemeData importTheme({ThemeData? themeData}) => themeData ?? getTheme();

  static bool isDark = false;

  ///Get Variables and Decide about Theme
  ThemeData getTheme({bool? isSystemDark}) {
    bool? storageResult;
    AppStorage.to.loadAppData().then((value) => value.fold((l) => null, (r) => storageResult = r?.settingsModel?.darkMode));
    isDark = storageResult == true || isSystemDark == true;
    return _theme();
  }

  ///Theme Constructor
  ThemeData _theme() => ThemeData(
        colorScheme: _colorScheme(),
        canvasColor: _canvasColor(),
        primaryColor: _primaryColor(),
        primaryColorLight: AppThemesVariables.appPrimary,
        primaryColorDark: AppThemesVariables.appPrimaryDark,
        hintColor: AppThemesVariables.appWarning,
        primaryTextTheme: _textTheme(),
        fontFamily: AppThemesVariables.appFont,
        appBarTheme: _appBar(),
        bottomAppBarTheme: _bottomAppBar(),
        drawerTheme: _drawer(),
        bottomNavigationBarTheme: _bottomNavigationBar(),
        navigationBarTheme: _navigationBar(),
        navigationDrawerTheme: _navigationDrawer(),
        navigationRailTheme: _navigationRail(),
        snackBarTheme: _snackBar(),
        dialogTheme: _dialog(),
        bottomSheetTheme: _bottomSheet(),
        floatingActionButtonTheme: _floatingActionButton(),
        bannerTheme: _banner(),
        badgeTheme: _badge(),
        chipTheme: _chip(),
        indicatorColor: _progressIndicator().color,
        progressIndicatorTheme: _progressIndicator(),
        iconTheme: _icon(),
        actionIconTheme: _actionIcon(),
        textTheme: _textTheme(),
        buttonTheme: _button(),
        elevatedButtonTheme: _buttonElevated(),
        outlinedButtonTheme: _buttonOutlined(),
        filledButtonTheme: _buttonFilled(),
        textButtonTheme: _buttonText(),
        iconButtonTheme: _buttonIcon(),
        buttonBarTheme: _buttonBar(),
        toggleButtonsTheme: _buttonToggle(),
        menuButtonTheme: _buttonMenu(),
        dropdownMenuTheme: _buttonDropDown(),
        cardTheme: _card(),
        cardColor: _card().color,
        checkboxTheme: _checkBox(),
        switchTheme: _switch(),
        dividerTheme: _divider(),
        // tooltipTheme: ,
        // adaptations:
      );

  ///Colors
  Color _canvasColor() => AppThemeData<Color>(
        lightThemeData: AppThemesVariables.appBackground,
        darkThemeData: AppThemesVariables.appBackgroundDark,
      ).getMode<Color>(isDark);

  Color _primaryColor() => AppThemeData<Color>(
        lightThemeData: AppThemesVariables.appPrimary,
        darkThemeData: AppThemesVariables.appPrimaryDark,
      ).getMode<Color>(isDark);

  ColorScheme _colorScheme() => AppThemeData<ColorScheme>(
        lightThemeData: AppThemesVariables.colorSchemeLight,
        darkThemeData: AppThemesVariables.colorSchemeDark,
      ).getMode<ColorScheme>(isDark);

  _colorSchemeSeed() => AppThemeData<Color>(
        lightThemeData: AppThemesVariables.colorSchemeSeedLight,
        darkThemeData: AppThemesVariables.colorSchemeSeedDark,
      ).getMode<Color>(isDark);

  ///Main Components
  TextTheme _textTheme() {
    TextStyle generalStyle = _textStyle();

    TextStyle lightStyle = generalStyle.copyWith(
      color: AppThemesVariables.appSecondary,
    );
    TextStyle darkStyle = generalStyle.copyWith(
      color: AppThemesVariables.appSecondaryDark,
    );

    TextTheme themeLight = TextTheme(
      bodySmall: lightStyle.copyWith(fontSize: AppThemesVariables.textSizeXSmall),
      bodyMedium: lightStyle.copyWith(fontSize: AppThemesVariables.textSizeSmall),
      bodyLarge: lightStyle.copyWith(fontSize: AppThemesVariables.textSizeNormal),
      displaySmall: lightStyle.copyWith(fontSize: AppThemesVariables.textSizeNormal),
      displayMedium: lightStyle.copyWith(fontSize: AppThemesVariables.textSizeLarge),
      displayLarge: lightStyle.copyWith(fontSize: AppThemesVariables.textSizeXLarge),
      titleSmall: lightStyle.copyWith(fontSize: AppThemesVariables.textSizeTitle),
      titleMedium: lightStyle.copyWith(fontSize: AppThemesVariables.textSizeTitleLarge),
      titleLarge: lightStyle.copyWith(fontSize: AppThemesVariables.textSizeTitleHuge),
    );

    TextTheme themeDark = TextTheme(
      bodySmall: darkStyle.copyWith(fontSize: AppThemesVariables.textSizeXSmall),
      bodyMedium: darkStyle.copyWith(fontSize: AppThemesVariables.textSizeSmall),
      bodyLarge: darkStyle.copyWith(fontSize: AppThemesVariables.textSizeNormal),
      displaySmall: darkStyle.copyWith(fontSize: AppThemesVariables.textSizeNormal),
      displayMedium: darkStyle.copyWith(fontSize: AppThemesVariables.textSizeLarge),
      displayLarge: darkStyle.copyWith(fontSize: AppThemesVariables.textSizeXLarge),
      titleSmall: darkStyle.copyWith(fontSize: AppThemesVariables.textSizeTitle),
      titleMedium: darkStyle.copyWith(fontSize: AppThemesVariables.textSizeTitleLarge),
      titleLarge: darkStyle.copyWith(fontSize: AppThemesVariables.textSizeTitleHuge),
    );

    return AppThemeData<TextTheme>(
      lightThemeData: themeLight,
      darkThemeData: themeDark,
    ).getMode<TextTheme>(isDark);
  }

  AppBarTheme _appBar() {
    AppBarTheme generalTheme = const AppBarTheme(
      centerTitle: true,
    );
    return AppThemeData<AppBarTheme>(
        lightThemeData: generalTheme.copyWith(
          backgroundColor: AppThemesVariables.appBackground,
          foregroundColor: AppThemesVariables.appPrimary,
        ),
        darkThemeData: generalTheme.copyWith(
          backgroundColor: AppThemesVariables.appBackgroundDark,
          foregroundColor: AppThemesVariables.appPrimaryDark,
        )).getMode<AppBarTheme>(isDark);
  }

  BottomAppBarTheme _bottomAppBar() {
    BottomAppBarTheme generalTheme = const BottomAppBarTheme(
      elevation: 5,
    );
    return AppThemeData<BottomAppBarTheme>(
      lightThemeData: generalTheme.copyWith(color: AppThemesVariables.appPrimary),
      darkThemeData: generalTheme.copyWith(color: AppThemesVariables.appPrimaryDark),
    ).getMode<BottomAppBarTheme>(isDark);
  }

  DrawerThemeData _drawer() {
    DrawerThemeData generalTheme = const DrawerThemeData(
      elevation: 5,
    );
    return AppThemeData<DrawerThemeData>(
      lightThemeData: generalTheme.copyWith(backgroundColor: AppThemesVariables.appBackground),
      darkThemeData: generalTheme.copyWith(backgroundColor: AppThemesVariables.appBackgroundDark),
    ).getMode<DrawerThemeData>(isDark);
  }

  BottomNavigationBarThemeData _bottomNavigationBar() {
    IconThemeData defaultIconThemeData = const IconThemeData();

    BottomNavigationBarThemeData themeData = BottomNavigationBarThemeData(
      backgroundColor: AppThemesVariables.appError,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      enableFeedback: true,
      selectedIconTheme: defaultIconThemeData,
      unselectedIconTheme: defaultIconThemeData,
    );
    return AppThemeData<BottomNavigationBarThemeData>(
        lightThemeData: themeData.copyWith(
          backgroundColor: AppThemesVariables.appPrimary,
          selectedItemColor: AppThemesVariables.appBackground,
          unselectedItemColor: AppThemesVariables.appTertiary,
        ),
        darkThemeData: themeData.copyWith(
          backgroundColor: AppThemesVariables.appBackgroundDark,
          selectedItemColor: AppThemesVariables.appTertiaryDark,
          unselectedItemColor: AppThemesVariables.appTertiaryDark,
        )).getMode<BottomNavigationBarThemeData>(isDark);
  }

  NavigationBarThemeData _navigationBar() {
    NavigationBarThemeData generalTheme = const NavigationBarThemeData();
    return AppThemeData<NavigationBarThemeData>(
      lightThemeData: generalTheme,
      darkThemeData: generalTheme,
    ).getMode<NavigationBarThemeData>(isDark);
  }

  NavigationDrawerThemeData _navigationDrawer() {
    NavigationDrawerThemeData generalTheme = const NavigationDrawerThemeData();
    return AppThemeData<NavigationDrawerThemeData>(
      lightThemeData: generalTheme,
      darkThemeData: generalTheme,
    ).getMode<NavigationDrawerThemeData>(isDark);
  }

  NavigationRailThemeData _navigationRail() {
    NavigationRailThemeData generalTheme = const NavigationRailThemeData();
    return AppThemeData<NavigationRailThemeData>(
      lightThemeData: generalTheme,
      darkThemeData: generalTheme,
    ).getMode<NavigationRailThemeData>(isDark);
  }

  SnackBarThemeData _snackBar() {
    SnackBarThemeData generalTheme = const SnackBarThemeData(
      elevation: 10,
      behavior: SnackBarBehavior.floating,
    );

    return AppThemeData<SnackBarThemeData>(
      lightThemeData: generalTheme.copyWith(
        backgroundColor: AppThemesVariables.appTertiary,
      ),
      darkThemeData: generalTheme.copyWith(
        backgroundColor: AppThemesVariables.appTertiaryDark,
      ),
    ).getMode<SnackBarThemeData>(isDark);
  }

  DialogTheme _dialog() {
    DialogTheme generalTheme = const DialogTheme();

    return AppThemeData<DialogTheme>(
      lightThemeData: generalTheme,
      darkThemeData: generalTheme,
    ).getMode<DialogTheme>(isDark);
  }

  BottomSheetThemeData _bottomSheet() {
    BottomSheetThemeData generalTheme = const BottomSheetThemeData();

    return AppThemeData<BottomSheetThemeData>(
      lightThemeData: generalTheme,
      darkThemeData: generalTheme,
    ).getMode<BottomSheetThemeData>(isDark);
  }

  FloatingActionButtonThemeData _floatingActionButton() {
    FloatingActionButtonThemeData generalTheme = const FloatingActionButtonThemeData();

    return AppThemeData<FloatingActionButtonThemeData>(
      lightThemeData: generalTheme,
      darkThemeData: generalTheme,
    ).getMode<FloatingActionButtonThemeData>(isDark);
  }

  MaterialBannerThemeData _banner() => AppThemeData<MaterialBannerThemeData>(
        lightThemeData: const MaterialBannerThemeData(),
        darkThemeData: const MaterialBannerThemeData(),
      ).getMode<MaterialBannerThemeData>(isDark);

  BadgeThemeData _badge() => AppThemeData<BadgeThemeData>(
        lightThemeData: const BadgeThemeData(),
        darkThemeData: const BadgeThemeData(),
      ).getMode<BadgeThemeData>(isDark);

  ChipThemeData _chip() => AppThemeData<ChipThemeData>(
        lightThemeData: const ChipThemeData(),
        darkThemeData: const ChipThemeData(),
      ).getMode<ChipThemeData>(isDark);

  ProgressIndicatorThemeData _progressIndicator() => AppThemeData<ProgressIndicatorThemeData>(
        lightThemeData: const ProgressIndicatorThemeData(),
        darkThemeData: const ProgressIndicatorThemeData(),
      ).getMode<ProgressIndicatorThemeData>(isDark);

  IconThemeData _icon() => AppThemeData<IconThemeData>(
        lightThemeData: const IconThemeData(),
        darkThemeData: const IconThemeData(),
      ).getMode<IconThemeData>(isDark);

  ActionIconThemeData _actionIcon() => AppThemeData<ActionIconThemeData>(
        lightThemeData: const ActionIconThemeData(),
        darkThemeData: const ActionIconThemeData(),
      ).getMode<ActionIconThemeData>(isDark);

  ///Text
  TextStyle _textStyle() => TextStyle(
        fontSize: appDefaultFontSize,
        overflow: TextOverflow.ellipsis,
      );

  ///Buttons
  ButtonThemeData _button() {
    ButtonThemeData generalTheme = const ButtonThemeData();
    return AppThemeData<ButtonThemeData>(
        lightThemeData: generalTheme.copyWith(
          buttonColor: AppThemesVariables.appPrimary,
          disabledColor: AppThemesVariables.appDisabled,
        ),
        darkThemeData: generalTheme.copyWith(
          buttonColor: AppThemesVariables.appPrimaryDark,
          disabledColor: AppThemesVariables.appDisabledDark,
        )).getMode<ButtonThemeData>(isDark);
  }

  TextStyle _buttonTextStyle() => TextStyle(
        fontSize: appDefaultFontSize,
        overflow: TextOverflow.ellipsis,
      );

  ButtonStyle _buttonStyle() => ButtonStyle(
        shape: MaterialStateProperty.all(AppElements.borderShapeDefault),
        textStyle: MaterialStateProperty.all(_buttonTextStyle()),
      );

  ElevatedButtonThemeData _buttonElevated() {
    ButtonStyle buttonStyleLight = _buttonStyle().copyWith(
      backgroundColor: MaterialStateProperty.all(AppThemesVariables.appPrimary),
      foregroundColor: MaterialStateProperty.all(AppThemesVariables.appBackground),
    );

    ButtonStyle buttonStyleDark = _buttonStyle().copyWith(
      backgroundColor: MaterialStateProperty.all(AppThemesVariables.appPrimaryDark),
      foregroundColor: MaterialStateProperty.all(AppThemesVariables.appBackgroundDark),
    );

    return AppThemeData<ElevatedButtonThemeData>(
      lightThemeData: ElevatedButtonThemeData(style: buttonStyleLight),
      darkThemeData: ElevatedButtonThemeData(style: buttonStyleDark),
    ).getMode<ElevatedButtonThemeData>(isDark);
  }

  OutlinedButtonThemeData _buttonOutlined() => AppThemeData<OutlinedButtonThemeData>(
        lightThemeData: OutlinedButtonThemeData(style: _buttonStyle()),
        darkThemeData: OutlinedButtonThemeData(style: _buttonStyle()),
      ).getMode<OutlinedButtonThemeData>(isDark);

  FilledButtonThemeData _buttonFilled() => AppThemeData<FilledButtonThemeData>(
        lightThemeData: FilledButtonThemeData(style: _buttonStyle()),
        darkThemeData: FilledButtonThemeData(style: _buttonStyle()),
      ).getMode<FilledButtonThemeData>(isDark);

  TextButtonThemeData _buttonText() => AppThemeData<TextButtonThemeData>(
        lightThemeData: TextButtonThemeData(style: _buttonStyle()),
        darkThemeData: TextButtonThemeData(style: _buttonStyle()),
      ).getMode<TextButtonThemeData>(isDark);

  IconButtonThemeData _buttonIcon() => AppThemeData<IconButtonThemeData>(
        lightThemeData: IconButtonThemeData(style: _buttonStyle()),
        darkThemeData: IconButtonThemeData(style: _buttonStyle()),
      ).getMode<IconButtonThemeData>(isDark);

  ButtonBarThemeData _buttonBar() => AppThemeData<ButtonBarThemeData>(
        lightThemeData: const ButtonBarThemeData(),
        darkThemeData: const ButtonBarThemeData(),
      ).getMode<ButtonBarThemeData>(isDark);

  ToggleButtonsThemeData _buttonToggle() => AppThemeData<ToggleButtonsThemeData>(
        lightThemeData: const ToggleButtonsThemeData(),
        darkThemeData: const ToggleButtonsThemeData(),
      ).getMode<ToggleButtonsThemeData>(isDark);

  MenuButtonThemeData _buttonMenu() => AppThemeData<MenuButtonThemeData>(
        lightThemeData: MenuButtonThemeData(style: _buttonStyle()),
        darkThemeData: MenuButtonThemeData(style: _buttonStyle()),
      ).getMode<MenuButtonThemeData>(isDark);

  ///Menus
  DropdownMenuThemeData _buttonDropDown() => AppThemeData<DropdownMenuThemeData>(
        lightThemeData: const DropdownMenuThemeData(),
        darkThemeData: const DropdownMenuThemeData(),
      ).getMode<DropdownMenuThemeData>(isDark);

  ///Others
  CardTheme _card() {
    CardTheme theme = CardTheme(shape: AppElements.borderShapeDefault);
    return AppThemeData<CardTheme>(
        lightThemeData: theme.copyWith(
          color: AppThemesVariables.appBackground,
        ),
        darkThemeData: CardTheme(
          color: AppThemesVariables.appBackgroundDark,
        )).getMode<CardTheme>(isDark);
  }

  CheckboxThemeData _checkBox() {
    CheckboxThemeData themeData = const CheckboxThemeData();
    return AppThemeData<CheckboxThemeData>(
        lightThemeData: themeData.copyWith(
          checkColor: MaterialStateProperty.all(AppThemesVariables.appBackground),
          fillColor: MaterialStateProperty.all(AppThemesVariables.appPrimary),
          // side: AppElements.borderSide,
        ),
        darkThemeData: themeData.copyWith(
          checkColor: MaterialStateProperty.all(AppThemesVariables.appBackgroundDark),
          fillColor: MaterialStateProperty.all(AppThemesVariables.appPrimaryDark),
        )).getMode<CheckboxThemeData>(isDark);
  }

  SwitchThemeData _switch() {
    SwitchThemeData themeData = const SwitchThemeData();
    return AppThemeData<SwitchThemeData>(
        lightThemeData: themeData.copyWith(
          overlayColor: MaterialStateProperty.all(AppThemesVariables.appBackground),
          trackOutlineColor: MaterialStateProperty.all(AppThemesVariables.appPrimary),
          thumbColor: MaterialStateProperty.all(AppThemesVariables.appBackground),
        ),
        darkThemeData: themeData.copyWith(
          overlayColor: MaterialStateProperty.all(AppThemesVariables.appBackgroundDark),
          trackOutlineColor: MaterialStateProperty.all(AppThemesVariables.appPrimaryDark),
          thumbColor: MaterialStateProperty.all(AppThemesVariables.appBackgroundDark),
        )).getMode<SwitchThemeData>(isDark);
  }

  DividerThemeData _divider() {
    DividerThemeData themeData = const DividerThemeData();
    return AppThemeData<DividerThemeData>(
        lightThemeData: themeData.copyWith(
          color: AppThemesVariables.appSecondary,
        ),
        darkThemeData: themeData.copyWith(
          color: AppThemesVariables.appSecondaryDark,
        )).getMode<DividerThemeData>(isDark);
  }
}