import 'package:flutter/material.dart';
import 'package:go_easy_care/presentation/theme/app_appbar_theme.dart';
import 'package:go_easy_care/presentation/theme/app_text_selection_themedata.dart';
import 'package:go_easy_care/presentation/theme/color.dart';

import 'app_card_theme.dart';
import 'app_drawer_themedata.dart';
import 'app_elevatedbutton_themedata.dart';
import 'app_floating_action_button_themedata.dart';
import 'app_navigationbar_themedata.dart';
import 'app_text_theme.dart';
import 'app_theme_colors.dart';
import 'app_typography.dart';

ThemeData appMaterialLightThemeData = ThemeData(
  applyElevationOverlayColor: false,
  visualDensity: VisualDensity.standard,
  useMaterial3: true,
  colorScheme: appMaterialLightColorScheme,
  typography: appMaterialTypography,
  textTheme: appMateriaLightTextTheme,
  elevatedButtonTheme: appMaterialLightElevatedButtonThemeData,
  cardTheme: appMaterialLightCardTheme,
  appBarTheme:   appMaterialLightAppBarTheme,
  navigationBarTheme: appMaterialLightNavigationBarThemeData,
  drawerTheme: appMaterialLightDrawerThemeData,
  floatingActionButtonTheme: appMaterialLightFloatingActionButtonThemeData,
    textSelectionTheme: appMaterialLightTextSelectionThemeData,


);

ThemeData appMaterialDarkThemeData = ThemeData(
    applyElevationOverlayColor: false,
    visualDensity: VisualDensity.standard,
    useMaterial3: true,
    colorScheme: appMaterialDarkColorScheme,
    typography: appMaterialTypography,
    textTheme: appMateriaDarkTextTheme,
    elevatedButtonTheme: appMaterialDarkElevatedButtonThemeData,
    cardTheme: appMaterialDarkCardTheme,
    appBarTheme:   appMaterialDarkAppBarTheme,
    navigationBarTheme: appMaterialDarkNavigationBarThemeData,
    floatingActionButtonTheme: appMaterialDarkFloatingActionButtonThemeData,
    textSelectionTheme: appMaterialDarkTextSelectionThemeData,
  //floatingActionButtonTheme:
  //drawerTheme: appMaterialDarkDrawerThemeData,
);


