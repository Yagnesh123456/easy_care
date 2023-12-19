// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:flutter/material.dart';


Typography appMaterialTypography = Typography(
  black: appMaterialBlackTheme,
  white: appMaterialWhiteTheme,
);



// Idea here is to mirror Black text theme in the MD3 context with
// custom fonts
TextTheme appMaterialBlackTheme = TextTheme(

  bodySmall: TextStyle(
    fontFamily: 'Roboto-Regular',
    decoration: TextDecoration.none,),
  bodyLarge: TextStyle(
    fontFamily: 'Roboto-Regular',
    decoration: TextDecoration.none,),
  displayLarge: TextStyle(
    fontFamily: 'Roboto-Regular',
    decoration: TextDecoration.none,
  ),
  displayMedium: TextStyle(
    fontFamily: 'Roboto-Regular',
    decoration: TextDecoration.none,
  ),
  displaySmall: TextStyle(
    fontFamily: 'Roboto-Regular',
    decoration: TextDecoration.none,
  ),
  headlineLarge: TextStyle(
    fontFamily: 'Roboto-Regular',
    decoration: TextDecoration.none,
  ),
  headlineMedium: TextStyle(
    fontFamily: 'Roboto-Regular',
    decoration: TextDecoration.none,
  ),
  headlineSmall: TextStyle(
    fontFamily: 'Roboto-Regular',
    decoration: TextDecoration.none,
  ),
  titleLarge: TextStyle(
    fontFamily: 'Roboto-Regular',
    decoration: TextDecoration.none,
  ),
  titleMedium: TextStyle(
    fontFamily: 'Roboto-Regular',
    decoration: TextDecoration.none,
  ),
  titleSmall: TextStyle(
    fontFamily: 'Roboto-Regular',
    decoration: TextDecoration.none,
  ),
  bodyMedium: TextStyle(
    fontFamily: 'Roboto-Regular',
    decoration: TextDecoration.none,
  ),
  labelLarge: TextStyle(
    fontFamily: 'Roboto-Regular',
    decoration: TextDecoration.none,
  ),
  labelMedium: TextStyle(
    fontFamily: 'Roboto-Regular',
    decoration: TextDecoration.none,
  ),
  labelSmall: TextStyle(
    fontFamily: 'Roboto-Regular',
    decoration: TextDecoration.none,
  ),

  /*button: TextStyle(debugLabel: 'Black NotoSerif button',
    fontFamily: GoogleFonts.inter().fontFamily, 
    color: const Color.fromARGB(1, 50, 47, 51),
    decoration: TextDecoration.none,
  ),*/
  //overline: TextStyle(debugLabel: 'Black NotoSerif labelSmall', fontFamily: GoogleFonts.notoSerif().fontFamily, color: Colors.black, decoration: TextDecoration.none,),
);

TextTheme appMaterialWhiteTheme = TextTheme(

  bodySmall: TextStyle(
    fontFamily: 'Roboto-Regular',
    decoration: TextDecoration.none,),

  bodyLarge: TextStyle(
    fontFamily: 'Roboto-Regular',
    decoration: TextDecoration.none,),

  displayLarge: TextStyle(
    fontFamily: 'Roboto-Regular',
    decoration: TextDecoration.none,
  ),
  displayMedium: TextStyle(
    fontFamily: 'Roboto-Regular',
    decoration: TextDecoration.none,
  ),
  displaySmall: TextStyle(
    fontFamily: 'Roboto-Regular',
    decoration: TextDecoration.none,
  ),
  headlineLarge: TextStyle(
    fontFamily: 'Roboto-Regular',
    decoration: TextDecoration.none,
  ),
  headlineMedium: TextStyle(
    fontFamily: 'Roboto-Regular',
    decoration: TextDecoration.none,
  ),
  headlineSmall: TextStyle(
    fontFamily: 'Roboto-Regular',
    decoration: TextDecoration.none,
  ),
  titleLarge: TextStyle(
    fontFamily: 'Roboto-Regular',
    decoration: TextDecoration.none,
  ),
  titleMedium: TextStyle(
    fontFamily: 'Roboto-Regular',
    decoration: TextDecoration.none,
  ),
  titleSmall: TextStyle(
    fontFamily: 'Roboto-Regular',
    decoration: TextDecoration.none,
  ),
  bodyMedium: TextStyle(
    fontFamily: 'Roboto-Regular',
    decoration: TextDecoration.none,
  ),
  labelLarge: TextStyle(
    fontFamily: 'Roboto-Regular',
    decoration: TextDecoration.none,
  ),
  labelMedium: TextStyle(
    fontFamily: 'Roboto-Regular',
    decoration: TextDecoration.none,
  ),
  labelSmall: TextStyle(
    fontFamily: 'Roboto-Regular',
    decoration: TextDecoration.none,
  ),
  /*button: TextStyle(debugLabel: 'Black NotoSerif button',
    fontFamily: GoogleFonts.inter().fontFamily,
    color: const Color.fromARGB(1, 233, 241, 247),
    decoration: TextDecoration.none,
  ),*/
  //overline: TextStyle(debugLabel: 'Black NotoSerif labelSmall', fontFamily: GoogleFonts.notoSerif().fontFamily, color: Colors.black, decoration: TextDecoration.none,),
);
