import 'package:flutter/material.dart';

class ThemeController {
  static final ValueNotifier<ThemeMode> themeModeNotifier =
      ValueNotifier<ThemeMode>(ThemeMode.light);

  static bool get isDarkMode =>
      themeModeNotifier.value == ThemeMode.dark;

  static void toggleTheme(bool isDark) {
    themeModeNotifier.value = isDark ? ThemeMode.dark : ThemeMode.light;
  }
}

class AppThemes {
  // Exact Design System Tokens from "Botanica Dark" palette
  static const Color primaryGreen = Color(0xFF22C55E);     // #22C55E Primary
  static const Color secondaryGreen = Color(0xFF4EDEA3);   // #4EDEA3 Secondary
  static const Color tertiaryCoral = Color(0xFFFF8B7C);    // #FF8B7C Tertiary
  static const Color darkNeutralBg = Color(0xFF121212);    // #121212 Neutral Scaffold
  static const Color darkCardSurface = Color(0xFF1C1C1E);  // #1C1C1E Dark Cards & Containers
  static const Color darkCardBorder = Color(0xFF2C2C2E);   // #2C2C2E Borders / Dividers
  static const Color darkInputBg = Color(0xFF242426);      // #242426 Input Fields
  static const Color darkCategoryPill = Color(0xFF1B2A20); // #1B2A20 Pill / Badge container
  static const Color darkTextPrimary = Color(0xFFEDEDED);  // Primary text
  static const Color darkTextSecondary = Color(0xFF9E9E9E);// Secondary text

  // Light Theme
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      primaryColor: const Color(0xFF006E2F),
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF006E2F),
        brightness: Brightness.light,
        primary: const Color(0xFF006E2F),
        secondary: const Color(0xFF53B175),
        surface: Colors.white,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFF006E2F)),
        titleTextStyle: TextStyle(color: Color(0xFF006E2F), fontSize: 20),
      ),
      cardColor: Colors.white,
      drawerTheme: const DrawerThemeData(
        backgroundColor: Colors.white,
      ),
    );
  }

  // Dark Theme (Aligned to "Botanica Dark" Design Specs)
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: darkNeutralBg,
      primaryColor: primaryGreen,
      colorScheme: const ColorScheme.dark(
        primary: primaryGreen,
        secondary: secondaryGreen,
        tertiary: tertiaryCoral,
        surface: darkCardSurface,
        surfaceContainerHighest: darkInputBg,
        onSurface: darkTextPrimary,
        onPrimary: Colors.white,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: darkNeutralBg,
        elevation: 0,
        iconTheme: IconThemeData(color: primaryGreen),
        titleTextStyle: TextStyle(
          color: primaryGreen,
          fontSize: 22,
          fontWeight: FontWeight.w900,
        ),
      ),
      cardColor: darkCardSurface,
      dividerColor: darkCardBorder,
      drawerTheme: const DrawerThemeData(
        backgroundColor: Color(0xFF18181A),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: darkNeutralBg,
        selectedItemColor: primaryGreen,
        unselectedItemColor: Color(0xFF8E8E93),
      ),
    );
  }
}
