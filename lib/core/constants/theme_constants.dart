import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AppColors {
  static const Color primary = Color(0xFF0A84FF);
  static const Color accent = Color(0xFFFF9500);
  static const Color background = Color(0xFFFFFFFF);
  static const Color textPrimary = Color(0xFF1C1C1E);
  static const Color textSecondary = Color(0xFF8E8E93);
}

class AppTheme {
  static ThemeData materialTheme() {
    return ThemeData(
      colorScheme: ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.accent,
        surface: AppColors.background,
        onPrimary: AppColors.background,
        onSecondary: AppColors.background,
        onSurface: AppColors.textPrimary,
      ),
      scaffoldBackgroundColor: AppColors.background,
      appBarTheme: const AppBarTheme(
        color: AppColors.primary,
        iconTheme: IconThemeData(color: AppColors.background),
        titleTextStyle: TextStyle(
          color: AppColors.background,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      textTheme: const TextTheme(
        // Large, prominent headings
        displayLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimary,
        ),
        displayMedium: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
        displaySmall: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
        // Smaller headings, typical app bar titles or section headers
        headlineMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
        headlineSmall: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: AppColors.textPrimary,
        ),
        titleLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.textPrimary,
        ),
        titleMedium: TextStyle(fontSize: 16, color: AppColors.textSecondary),
        titleSmall: TextStyle(fontSize: 14, color: AppColors.textSecondary),
        bodyLarge: TextStyle(fontSize: 14, color: AppColors.textPrimary),
        bodyMedium: TextStyle(fontSize: 14, color: AppColors.textSecondary),
        // Buttons
        labelLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.background,
        ),
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: AppColors.primary,
        textTheme: ButtonTextTheme.primary,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: AppColors.background,
          backgroundColor: AppColors.primary,
          textStyle: TextStyle(fontWeight: FontWeight.bold),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          textStyle: TextStyle(fontWeight: FontWeight.bold),
          side: BorderSide(color: AppColors.primary),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
        ),
      ),
    );
  }

  /// Cupertino Theme for iOS-specific widgets and styling.
  static CupertinoThemeData cupertinoTheme() {
    return CupertinoThemeData(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.background,
      barBackgroundColor: AppColors.background,
      textTheme: const CupertinoTextThemeData(
        // Default text style
        textStyle: TextStyle(color: AppColors.textPrimary),
        // Action (e.g., for buttons in navigation bars, dialogs, etc.)
        actionTextStyle: TextStyle(color: AppColors.accent, fontSize: 17.0),
        // Standard navigation bar title
        navTitleTextStyle: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimary,
        ),
        // Large title style (e.g., for large nav bars in iOS)
        navLargeTitleTextStyle: TextStyle(
          fontSize: 32.0,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimary,
        ),
        // Navigation bar action text style (e.g., "Edit", "Done" in top bar)
        navActionTextStyle: TextStyle(
          fontSize: 17.0,
          fontWeight: FontWeight.w600,
          color: AppColors.primary,
        ),
      ),
    );
  }
}
