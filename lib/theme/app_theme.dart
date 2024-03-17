import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:test16032024/theme/colors.dart';
import 'package:test16032024/theme/textstyle.dart';

class AppTheme {
  ThemeData themeData({bool isDark = false}) {
    return ThemeData(
      // useMaterial3: true,
      brightness: isDark ? Brightness.dark : Brightness.light,
      iconTheme: IconThemeData(color: isDark ? DarkIconColor : LightIconColor),
      hintColor: Colors.grey,
      primaryColor: isDark ? DarkPrimary : LightPrimary,
      scaffoldBackgroundColor:
          isDark ? DarkBackgroundColor : LightBackgroundColor,
      colorScheme: isDark ? darkColorScheme : lightColorScheme,
      cardColor: isDark ? DarkOnsurfaceColor : LightsurfaceColor,
      textTheme: buildTextTheme,
      appBarTheme: AppBarTheme(
        backgroundColor: isDark ? DarkBackgroundColor : LightBackgroundColor,
        elevation: 0,
        toolbarTextStyle: TextStyle(
          color: isDark ? DarkOnBackgroundColor : LightOnBackgroundColor,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
        titleTextStyle: headlineSmall.copyWith(
          color: isDark ? DarkOnBackgroundColor : LightOnBackgroundColor,
        ),
        iconTheme:
            IconThemeData(color: isDark ? DarkIconColor : LightIconColor),
      ),
      pageTransitionsTheme: const PageTransitionsTheme(builders: {
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
      }),
      tabBarTheme: const TabBarTheme(
        labelColor: Colors.black,
        unselectedLabelColor: Colors.black,
        labelPadding: EdgeInsets.zero,
        labelStyle: TextStyle(fontSize: 13),
        unselectedLabelStyle: TextStyle(fontSize: 13),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            EdgeInsets.symmetric(horizontal: 10, vertical: 14)),
        overlayColor: MaterialStateProperty.all<Color>(
            isDark ? DarkPrimary : LightPrimary.withOpacity(0.3)),
        textStyle:
            MaterialStateProperty.all<TextStyle>(buildTextTheme.titleLarge!),
        shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
          8,
        ))),
        backgroundColor:
            MaterialStateProperty.all(isDark ? DarkSecondary : LightSecondary),
        foregroundColor: MaterialStateProperty.all(
            isDark ? DarkOnSecondary : LightOnSecondary),
      )),
      inputDecorationTheme: InputDecorationTheme(
        border: InputBorder.none,
        hintStyle: TextStyle(color: isDark ? DarkIconColor : LightIconColor),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        labelStyle: TextStyle(color: isDark ? DarkTextColor : LightTextColor),
      ),
    );
  }
}

// *-/-**-
toggleTheme(bool isDark) {
  Get.changeThemeMode(
    isDark ? ThemeMode.dark : ThemeMode.light,
  );
}
