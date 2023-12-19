// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_easy_care/presentation/theme/app_squircle.dart';
import 'package:go_easy_care/presentation/theme/app_theme_colors.dart';







AppBarTheme appMaterialLightAppBarTheme = AppBarTheme(
  backgroundColor: appMaterialLightColorScheme.surface,
  scrolledUnderElevation: 0.0,
  elevation: 0.0,
  shadowColor: appMaterialLightColorScheme.surface,
  systemOverlayStyle: SystemUiOverlayStyle(
    statusBarColor: appMaterialLightColorScheme.surface,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
  ),
  centerTitle: true,
);

AppBarTheme appMaterialDarkAppBarTheme = AppBarTheme(
  backgroundColor: appMaterialDarkColorScheme.surface,
  scrolledUnderElevation: 0.0,
  elevation: 0.0,
  shadowColor: appMaterialDarkColorScheme.surface,
  systemOverlayStyle: SystemUiOverlayStyle(
    statusBarColor: appMaterialDarkColorScheme.surface,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
  ),
  centerTitle: true,
);

