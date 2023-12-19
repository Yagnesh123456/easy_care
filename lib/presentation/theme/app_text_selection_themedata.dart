// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

import 'app_theme_colors.dart';

// Gist: MD3 spec at https://m3.material.io/components/floating-action-button/specs

// MD3 default elevation settings as opposed to the lowest settings
TextSelectionThemeData appMaterialLightTextSelectionThemeData =
    TextSelectionThemeData(cursorColor: appMaterialLightColorScheme.onSurfaceVariant);

TextSelectionThemeData appMaterialDarkTextSelectionThemeData =
    TextSelectionThemeData(cursorColor: appMaterialLightColorScheme.onSurfaceVariant);
