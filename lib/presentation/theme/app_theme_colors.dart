// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// ignore_for_file: cast_nullable_to_non_nullable

import 'package:flutter/material.dart';

import 'color.dart';


// Gist: We have to prevent circular refs before ThemeData is fully iniitialized so
//       we created a default colorScheme instance via functions
//       And I still set ColorScheme in themedata

ColorScheme appMaterialLightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: kColorsPrimary40,
  onPrimary: kColorsPrimary100,
  primaryContainer: kColorsPrimary90,
  onPrimaryContainer: kColorsPrimary10,
  secondary: kColorsSecondary40,
  onSecondary: kColorsSecondary100,
  secondaryContainer: kColorsSecondary90,
  onSecondaryContainer: kColorsSecondary10,
  tertiary: kColorsTertiary40,
  onTertiary: kColorsTertiary100,
  tertiaryContainer: kColorsTertiary90,
  onTertiaryContainer: kColorsTertiary10,
  error: kColorsError40,
  onError: kColorsError100,
  errorContainer: kColorsError90,
  onErrorContainer: kColorsError10,
  background: kColorsNeutral99,
  onBackground: kColorsNeutral10,
  surface: kColorsNeutral99,
  onSurface: kColorsNeutral10,
  surfaceVariant: kColorsNeutralVariant90,
  onSurfaceVariant: kColorsNeutralVariant30,
  outline: kColorsNeutralVariant50,
);

ColorScheme appMaterialDarkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: kColorsPrimary80,
  onPrimary: kColorsPrimary20,
  primaryContainer: kColorsPrimary30,
  onPrimaryContainer: kColorsPrimary90,
  secondary: kColorsSecondary80,
  onSecondary: kColorsSecondary20,
  secondaryContainer: kColorsSecondary30,
  onSecondaryContainer: kColorsSecondary90,
  tertiary: kColorsTertiary80,
  onTertiary: kColorsTertiary20,
  tertiaryContainer: kColorsTertiary30,
  onTertiaryContainer: kColorsTertiary90,
  error: kColorsError80,
  onError: kColorsError20,
  errorContainer: kColorsError30,
  onErrorContainer: kColorsError90,
  background: kColorsNeutral10,
  onBackground: kColorsNeutral90,
  surface: kColorsNeutral10,
  onSurface: kColorsNeutral80,
  surfaceVariant: kColorsNeutralVariant30,
  onSurfaceVariant: kColorsNeutralVariant80,
  outline: kColorsNeutralVariant60,

);
