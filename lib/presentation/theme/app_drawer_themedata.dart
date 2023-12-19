// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:flutter/material.dart';
import 'package:go_easy_care/presentation/theme/app_squircle.dart';
import 'package:go_easy_care/presentation/theme/app_theme_colors.dart';




// Note: bottom rounder corners show not the top

DrawerThemeData appMaterialLightDrawerThemeData = DrawerThemeData(
  backgroundColor: appMaterialLightColorScheme.surface,
  scrimColor: Color(0xBF1F1F1F),
 // scrimColor: Color(0X1F1F1F1F),


  elevation: 0,
  shape: SquircleBorder(
    radius: BorderRadius.all(
      Radius.circular(16.0),
    ),
  ),
);

DrawerThemeData appMaterialDarkDrawerThemeData = DrawerThemeData(
  backgroundColor: appMaterialDarkColorScheme.surfaceVariant,
  scrimColor: Color(0xBF1F1F1F),
  elevation: 0,
  shape: SquircleBorder(
    radius: BorderRadius.all(
      Radius.circular(16.0),
    ),
  ),
);
