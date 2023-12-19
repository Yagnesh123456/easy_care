// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

import 'app_theme_colors.dart';




// Gist: MD3 spec at https://m3.material.io/components/floating-action-button/specs

// MD3 default elevation settings as opposed to the lowest settings
FloatingActionButtonThemeData appMaterialLightFloatingActionButtonThemeData =
    FloatingActionButtonThemeData(
      backgroundColor:  Color(0XFFF7EFFB),
     // backgroundColor:  Colors.red,
      extendedPadding: const EdgeInsets.all(16),
    );

FloatingActionButtonThemeData appMaterialDarkFloatingActionButtonThemeData =
    FloatingActionButtonThemeData(
        backgroundColor:  Color(0XFF332C37),
       // backgroundColor: Colors.green,
      /*foregroundColor: const Color(0x0D9000E0),
      backgroundColor: const Color(0x0D9000E0),
      elevation: 3,
      focusElevation: 3,
      hoverElevation: 4,
      disabledElevation: 0,
      highlightElevation: 6,
      enableFeedback: true,*/
      extendedPadding: const EdgeInsets.all(16),
);

