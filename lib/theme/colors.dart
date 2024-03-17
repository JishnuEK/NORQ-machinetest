import 'package:flutter/material.dart';

// COLOR SCHEME DARK
final ColorScheme darkColorScheme = ColorScheme(
  primary: DarkPrimary, //accent color
  secondary: DarkSecondary, //for button ,icons...
  surface: DarksurfaceColor, //for card, tileview backgound
  background: DarkBackgroundColor, //for scaffold background
  error: DarkErrorColor, //for error bg
  onPrimary: DarkOnPrimary, //text primary
  onSecondary: DarkOnSecondary, //text secondary
  onSurface: DarkOnsurfaceColor, //text surface
  onBackground: DarkOnBackgroundColor, //text  background
  onError: DarkOnErrorColor, // text on error
  brightness: Brightness.dark,
  onSurfaceVariant: Colors.black45, //Loading screen dark color 1
  surfaceVariant: Colors.black26, //Loading screen dark color 2
);
// *-*-**-*-

// COLOR SCHEME LIGHT

final ColorScheme lightColorScheme = ColorScheme(
  brightness: Brightness.light,

  primary: LightPrimary,
  onPrimary: LightOnPrimary,
//--
  secondary: LightSecondary,
  onSecondary: LightOnSecondary,
//--
  surface: LightsurfaceColor,
  onSurface: LightOnsurfaceColor,
//--
  background: LightBackgroundColor,
  onBackground: LightOnBackgroundColor,
//--
  error: LightErrorColor,
  onError: LightOnErrorColor,

  surfaceVariant: Colors.grey.shade200, //Loading screen light color 1
  onSurfaceVariant: Colors.grey.shade400, //Loading screen light color 2
);
// *-*-*-*
// LIGHT COLORS*-*-*-
const Color LightPrimary = const Color(0xffd24d4d);
const Color LightSecondary = const Color(0xFFFFFFFF);
const Color LightBackgroundColor =
    Color.fromARGB(255, 255, 255, 255); //Color(0xfff8f8f8);
const Color LightsurfaceColor = Color(0xfffbeaec);
Color LightErrorColor = Colors.red.shade200;
const Color LightOnPrimary = Color.fromARGB(255, 255, 255, 255);
const Color LightOnSecondary = const Color(0xFF000000);
const Color LightOnBackgroundColor = const Color(0xFF000000);
const Color LightOnsurfaceColor = const Color(0xFF000000);
const Color LightOnErrorColor = Colors.black;
const Color LightTextColor = LightOnsurfaceColor;
const Color LightIconColor = LightOnBackgroundColor;

// DARK COLORS*-*-*-
const Color DarkPrimary = const Color(0xffd24d4d);
const Color DarkSecondary = Color.fromARGB(255, 94, 94, 94);
const Color DarkBackgroundColor = Color(0xff1f1f1f);
const Color DarksurfaceColor = Color.fromARGB(255, 58, 58, 58);
Color DarkErrorColor = Colors.red.shade900;
const Color DarkOnPrimary = const Color(0xFF000000);
const Color DarkOnSecondary = const Color(0xFFFDFDFD);
const Color DarkOnBackgroundColor = const Color(0xFFFDFDFD);
const Color DarkOnsurfaceColor = const Color.fromARGB(255, 235, 235, 235);
const Color DarkOnErrorColor = const Color.fromARGB(255, 255, 255, 255);
const Color DarkTextColor = DarkOnsurfaceColor;
const Color DarkIconColor = DarkSecondary;
