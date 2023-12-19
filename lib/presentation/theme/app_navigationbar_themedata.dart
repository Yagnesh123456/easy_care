// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:flutter/material.dart';

import 'app_theme_colors.dart';

NavigationBarThemeData appMaterialLightNavigationBarThemeData =
    NavigationBarThemeData(
  backgroundColor: appMaterialLightColorScheme.surface,
  indicatorColor: appMaterialLightColorScheme.surfaceVariant,
  labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,

  iconTheme: MaterialStateProperty.resolveWith((states) {
    if (states.contains(MaterialState.pressed)) {
      return appMaterialLightNavbarIconPressed;
    }
    if (states.contains(MaterialState.focused)) {
      return appMaterialLightNavbarIconFocused;
    }
    if (states.contains(MaterialState.hovered)) {
      return appMaterialLightNavbarIconHovered;
    }
  }),
);

NavigationBarThemeData appMaterialDarkNavigationBarThemeData =
    NavigationBarThemeData(
  backgroundColor: appMaterialDarkColorScheme.surface,
  indicatorColor: appMaterialDarkColorScheme.onSecondary,
  labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,

  iconTheme: MaterialStateProperty.resolveWith((states) {
    if (states.contains(MaterialState.pressed)) {
      return appMaterialDarkNavbarIconPressed;
    }
    if (states.contains(MaterialState.focused)) {
      return appMaterialDarkNavbarIconFocused;
    }
    if (states.contains(MaterialState.hovered)) {
      return appMaterialDarkNavbarIconHovered;
    }
  }),
);



IconThemeData appMaterialLightNavbarIconPressed = IconThemeData(
  color: appMaterialLightColorScheme.onSecondaryContainer,
);

IconThemeData appMaterialLightNavbarIconFocused = IconThemeData(
  color: appMaterialLightColorScheme.onSurface,
);

IconThemeData appMaterialLightNavbarIconHovered = IconThemeData(
  color: appMaterialLightColorScheme.onSurface,
);

IconThemeData appMaterialDarkNavbarIconPressed = IconThemeData(
  color: appMaterialDarkColorScheme.onSecondaryContainer,
);

IconThemeData appMaterialDarkNavbarIconFocused = IconThemeData(
  color: appMaterialDarkColorScheme.onSurface,
);

IconThemeData appMaterialDarkNavbarIconHovered = IconThemeData(
  color: appMaterialDarkColorScheme.onSurface,
);
