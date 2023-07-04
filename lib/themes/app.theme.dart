import 'package:demo/utils/constants/app.dimensions.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static const themeColor = Color.fromARGB(255, 2, 195, 142);
  static const themeLightColor = Color.fromARGB(255, 220, 248, 198);
  static const themeDarkColor = Color.fromARGB(255, 18, 140, 126);
  static const themeAccentColor = Color.fromARGB(255, 37, 211, 102);
  static const themeHighlightColor = Color.fromARGB(255, 52, 183, 241);
  static const themeTextColor = Color.fromARGB(255, 250, 250, 250);
  static const themeInactiveTextColor = Color.fromARGB(255, 211, 211, 225);
  static const themePrimaryTextColor = Color.fromARGB(255, 7, 94, 84);
  static const themePrimaryIconColor = Color.fromARGB(255, 7, 94, 84);
  static const themeSecondaryTextColor = Color.fromARGB(255, 0, 0, 0);
  static const themeInActiveIndicatorColor = Color.fromARGB(120, 0, 0, 0);
  static const themeBackgroundColor = Color.fromARGB(255, 0, 0, 0);
  static const themeDividerColor = Color.fromARGB(50, 0, 0, 0);
  static const themeBorderColor = Color.fromARGB(100, 250, 250, 250);
  static const themeSuccessColor = Colors.green;
  static const themeAppbarColor = themeColor;
  static const themeErrorColor = Colors.red;

  static const myColorScheme = ColorScheme(
    primary: themeColor,
    secondary: themeAccentColor,
    surface: Colors.black,
    background: themeBackgroundColor,
    error: Colors.red,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.black,
    onBackground: Colors.black,
    onError: Colors.white,
    brightness: Brightness.light,
  );

  static final darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: myColorScheme,
    primaryColor: themeColor,
    textTheme: const TextTheme(
      bodySmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: themeTextColor,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: themeTextColor,
      ),
      bodyLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: themeTextColor,
      ),
      titleSmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: themeTextColor,
      ),
      titleMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: themeTextColor,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: themeTextColor,
      ),
      labelSmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: themeTextColor,
      ),
      labelMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: themeTextColor,
      ),
      labelLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: themeTextColor,
      ),
      headlineSmall: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w500,
        color: themeTextColor,
      ),
      headlineMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: themeTextColor,
      ),
      headlineLarge: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.w500,
        color: themeTextColor,
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: themeAppbarColor,
      elevation: 2,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.themeColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimension.kRadius - 6.0),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        visualDensity: VisualDensity.compact,
      ),
    ),
    dividerColor: themeDividerColor,
    dividerTheme: const DividerThemeData(
      color: themeDividerColor,
      thickness: 1,
    ),
  );
}
