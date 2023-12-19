// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

import 'app_squircle.dart';
import 'app_theme_colors.dart';
import 'app_theme_data_defaults.dart';
import 'color.dart';
import 'color.dart';

// Gist: MD3 spec at https://m3.material.io/components/cards/specs
//       Types of Cards:
//           Elevated
//           Filled
//           Outline
//

CardTheme appMaterialLightCardTheme = CardTheme(
  clipBehavior: Clip.antiAlias,
  color: appMaterialLightColorScheme.surfaceVariant,
  shadowColor: Color(0xFFEADFEA),
  elevation: 4,
  margin: const EdgeInsets.all(16.0),
  shape: SquircleBorder(
    radius: BorderRadius.all(
      Radius.circular(widgetRadius),
    ),
  ),
);

CardTheme appMaterialDarkCardTheme = CardTheme(
  clipBehavior: Clip.antiAlias,
  color: appMaterialDarkColorScheme.onSecondary,
  shadowColor: Color(0xFF382C3F),
  elevation: 4,
  margin: const EdgeInsets.only(left: 12, right: 12, top: 6, bottom: 6),
  shape: const SquircleBorder(
    radius: BorderRadius.all(
      Radius.circular(12.0),
    ),
  ),
);
