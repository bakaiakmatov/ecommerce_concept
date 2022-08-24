import 'package:flutter/material.dart';
import 'app_colors.dart';

ThemeData mainTheme() {
  final outlineButton = OutlinedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.green[50]),
    ),
  );

  return ThemeData(
    scaffoldBackgroundColor: AppColors.backgroundWhite,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.backgroundWhite,
      elevation: 0,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.backgroundWhite,
      elevation: 4,
    ),
    textTheme: const TextTheme(),
    outlinedButtonTheme: outlineButton,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
