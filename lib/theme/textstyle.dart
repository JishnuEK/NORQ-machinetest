// TEXT STYLE*-*-*
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

////
// String fontName = 'Feather';
String fontName = 'Roboto';
// String fontName = 'WorkSans';
// String fontName = 'SFProDisplay';

// *-*-*-TEXTSTYLES-*-*-*-
TextTheme buildTextTheme = TextTheme(
  headlineLarge: headlineLarge,
  headlineMedium: headlineMedium,
  headlineSmall: headlineSmall, //for Buttons
//--
  titleLarge: titleLarge,
  titleSmall: titleSmall,
//--
  bodyLarge: bodyLarge,
  bodyMedium: bodyMedium, //Text Widget Style
  bodySmall: bodySmall, // hint text
);

//-----

TextStyle bodyMedium = GoogleFonts.outfit(
  // fontFamily: fontName,
  fontWeight: FontWeight.w400,
  fontSize: 15,
  letterSpacing: -0.05,
);
TextStyle bodyLarge = GoogleFonts.outfit(
  //  fontFamily: fontName,
  fontWeight: FontWeight.w500,
  fontSize: 25,

  letterSpacing: 0.2,
);
TextStyle bodySmall = GoogleFonts.outfit(
  // fontFamily: fontName,
  fontWeight: FontWeight.w400,
  fontSize: 15,
  letterSpacing: 0.2,
);

TextStyle headlineMedium = GoogleFonts.outfit(
  // fontFamily: fontName
  fontWeight: FontWeight.bold,
  fontSize: 25,
  letterSpacing: 0.4,
  height: 0.9,
);
TextStyle headlineLarge = GoogleFonts.outfit(
  // fontFamily: fontName
  fontWeight: FontWeight.bold,
  fontSize: 35,
  letterSpacing: 0.4,
  height: 0.9,
);
TextStyle headlineSmall = GoogleFonts.outfit(
  // fontFamily: fontName,
  fontWeight: FontWeight.bold,
  fontSize: 19,
  letterSpacing: 0.27,
);

TextStyle titleLarge = GoogleFonts.outfit(
  // fontFamily: fontName,
  fontWeight: FontWeight.bold,
  fontSize: 16,
  letterSpacing: 0.18,
);

TextStyle titleSmall = GoogleFonts.outfit(
  // fontFamily: fontName,
  fontWeight: FontWeight.w400,
  fontSize: 14,
  letterSpacing: -0.04,
);

// *-*-*-*-*
TextStyle snackbarTextStyleMedium = GoogleFonts.outfit(
  // fontFamily: fontName,
  fontWeight: FontWeight.w400,
  fontSize: 14,
  letterSpacing: -0.05,
);
TextStyle snackbarTextStyleBold = GoogleFonts.outfit(
  // fontFamily: fontName,
  fontWeight: FontWeight.w700,
  fontSize: 14,
  letterSpacing: -0.05,
);
