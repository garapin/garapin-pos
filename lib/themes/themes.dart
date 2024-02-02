import 'package:armory/engine/engine.dart';
import 'package:armory/engine/engine.dart';
import 'package:flutter/material.dart';

part 'colors.dart';

part 'fonts.dart';

class AppTheme {
  ThemeData theme(AppColorData appColor) {
    return ThemeData(
      useMaterial3: false,
      brightness: Brightness.light,
      colorScheme: ColorScheme.light(
        primary: appColor.primary,
        secondary: appColor.secondary,
        error: appColor.error,
      ),
      primaryColor: appColor.primary,
      scaffoldBackgroundColor: appColor.background,
      textTheme: TextTheme(
        displayLarge: const TextStyle(color: Colors.white),
        displayMedium: TextStyle(color: appColor.special),
        displaySmall: TextStyle(color: appColor.error),
        headlineMedium: TextStyle(color: appColor.success),
        labelLarge: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        bodySmall: const TextStyle(fontSize: 12, color: Colors.black87),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: appColor.primary,
          foregroundColor: Colors.white,
        ),
      ),
      iconTheme: IconThemeData(color: Colors.black.withOpacity(0.5)),
      // appBarTheme: const AppBarTheme(titleTextStyle: TextStyle(fontSize: 16)),
      cardTheme: const CardTheme(elevation: 5),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: appColor.bottomNavigation,
        selectedItemColor: appColor.primary,
      ),
      tabBarTheme: TabBarTheme(
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(width: 2, color: appColor.primary),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: appColor.primary,
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}
