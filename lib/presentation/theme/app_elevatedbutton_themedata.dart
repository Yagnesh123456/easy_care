// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:go_easy_care/presentation/theme/app_text_theme.dart';


import 'app_theme_colors.dart';
import 'app_theme_data_defaults.dart';


// Gist: MD3 Spec for Buttons is at:
//       https://m3.material.io/components/buttons/specs

ElevatedButtonThemeData appMaterialLightElevatedButtonThemeData =
    ElevatedButtonThemeData(style: appMaterialLightButtonStyle);

ElevatedButtonThemeData appMaterialDarkElevatedButtonThemeData =
    ElevatedButtonThemeData(style: appMaterialDarkButtonStyle);



ButtonStyle appMaterialLightButtonStyle = ButtonStyle(


  // MD3 is left and right padding of 24
  padding: ButtonStyleButton.allOrNull<EdgeInsetsGeometry>(
    const EdgeInsets.all(12),
  ),
  // need to recheck MD3 as under MD2 its:
  //  disabled 0, default 2, hovered and focused 4, and pressed at 8
  elevation: MaterialStateProperty.resolveWith(getMaterialLightElevation),
  overlayColor: MaterialStateProperty.resolveWith(getMaterialLightOverlay),
  shadowColor:
      ButtonStyleButton.allOrNull<Color>(appMaterialLightColorScheme.shadow),

  //
  // fixedSize is always null, MD2

  // do we adjust this using adaptive breakpoints?
  // MD3 height is 40dp
  minimumSize: ButtonStyleButton.allOrNull<Size>(
    const Size(
      double.infinity,
      0,
    ),
  ),
  maximumSize: ButtonStyleButton.allOrNull<Size>(Size.infinite),

  //side null under md2

  
  enableFeedback: true,
  // text label is aligned center under MD3
  alignment: Alignment.center,
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  backgroundColor:
      MaterialStateProperty.resolveWith(getMaterialLightBackground),
  foregroundColor:
      MaterialStateProperty.resolveWith(getMaterialLightForeground),


);

// MD3 wise primary gets supplied as state change and not
// background color fill
Color getMaterialLightBackground(Set<MaterialState> states) {
  if (states.contains(MaterialState.disabled)) {
    return appMaterialLightColorScheme.primary;
  }

  return appMaterialLightColorScheme.primary;
}

// Md3
Color getMaterialDarkBackground(Set<MaterialState> states) {
  if (states.contains(MaterialState.disabled)) {
    return appMaterialDarkColorScheme.primary;
  }

  return appMaterialDarkColorScheme.primary;
}

// MD3
Color getMaterialLightForeground(Set<MaterialState> states) {
  if (states.contains(MaterialState.disabled)) {
    return appMaterialLightColorScheme.primary;
  }

  return appMaterialLightColorScheme.primary;
}

// MD3
Color getMaterialDarkForeground(Set<MaterialState> states) {
  if (states.contains(MaterialState.disabled)) {
    return appMaterialDarkColorScheme.onSurface.withOpacity(0.38);
  }

  return appMaterialDarkColorScheme.primary;
}

// per MD3 hint of primary is in state changes rather
// then fills
Color getMaterialLightOverlay(Set<MaterialState> states) {
  if (states.contains(MaterialState.hovered)) {
    return appMaterialLightColorScheme.primary.withOpacity(hoverStateOpacity);
  }

  if (states.contains(MaterialState.focused) ||
      states.contains(MaterialState.pressed)) {
    return appMaterialLightColorScheme.primary.withOpacity(focusStateOpacity);
  }

  if (states.contains(MaterialState.dragged)) {
    return appMaterialLightColorScheme.primary.withOpacity(draggedStateOpacity);
  }

  return appMaterialLightColorScheme.surface.withOpacity(1);
}

Color getMaterialDarkOverlay(Set<MaterialState> states) {
  if (states.contains(MaterialState.hovered)) {
    return appMaterialDarkColorScheme.primary.withOpacity(hoverStateOpacity);
  }

  if (states.contains(MaterialState.focused) ||
      states.contains(MaterialState.pressed)) {
    return appMaterialDarkColorScheme.primary.withOpacity(focusStateOpacity);
  }

  if (states.contains(MaterialState.dragged)) {
    return appMaterialDarkColorScheme.primary.withOpacity(draggedStateOpacity);
  }

  // set as transparent
  return appMaterialDarkColorScheme.surface.withOpacity(1);
}

// MD3 Elevation values, enabled is 1, disabled is 0,
//     hovered is 2, focused is 1, and pressed is 1
double getMaterialLightElevation(Set<MaterialState> states) {
  if (states.contains(MaterialState.disabled)) {
    return 0;
  }
  if (states.contains(MaterialState.hovered)) {
    return elevationTwo;
  }
  if (states.contains(MaterialState.focused)) {
    return elevationOne;
  }
  if (states.contains(MaterialState.pressed)) {
    return elevationOne;
  }

  return elevationOne;
}

double getMaterialDarkElevation(Set<MaterialState> states) {
  if (states.contains(MaterialState.disabled)) {
    return 0;
  }
  if (states.contains(MaterialState.hovered)) {
    return elevationTwo;
  }
  if (states.contains(MaterialState.focused)) {
    return elevationOne;
  }
  if (states.contains(MaterialState.pressed)) {
    return elevationOne;
  }

  return elevationOne;
}

ButtonStyle appMaterialDarkButtonStyle = ButtonStyle(

  // MD3 is left and right padding of 24
  padding: ButtonStyleButton.allOrNull<EdgeInsetsGeometry>(
    const EdgeInsets.all(12),
  ),
  // need to recheck MD3 as under MD2 its:
  //  disabled 0, default 2, hovered and focused 4, and pressed at 8
  elevation: MaterialStateProperty.resolveWith(getMaterialDarkElevation),
  overlayColor: MaterialStateProperty.resolveWith(getMaterialDarkOverlay),
  shadowColor:
      ButtonStyleButton.allOrNull<Color>(appMaterialDarkColorScheme.shadow),

  // fixedSize is always null, MD2

  // do we adjust this using adaptive breakpoints?
  minimumSize: ButtonStyleButton.allOrNull<Size>(
    const Size(
      double.infinity,
      0,
    ),
  ),
  maximumSize: ButtonStyleButton.allOrNull<Size>(Size.infinite),

  //side null under md2

  // I think we need to repace RoundedRectangleBVorder with Squircle via iOS 13
  // new design features but in any case MD3 it's 8 instead of MD2's 4.
  
  enableFeedback: true,
  alignment: Alignment.center,
  backgroundColor: MaterialStateProperty.resolveWith(getMaterialDarkBackground),
  foregroundColor:
      MaterialStateProperty.resolveWith(getMaterialLightForeground),
);

BorderSide appMaterialLightBorderSide = BorderSide(
  color: appMaterialLightColorScheme.secondary,
  // ignore: avoid_redundant_argument_values
  width: 1.0,
  // ignore: avoid_redundant_argument_values
  style: BorderStyle.solid,

);

BorderSide appMaterialDarkBorderSide = BorderSide(
  color: appMaterialDarkColorScheme.secondary,
  // ignore: avoid_redundant_argument_values
  width: 1.0,
  // ignore: avoid_redundant_argument_values
  style: BorderStyle.solid,
);

