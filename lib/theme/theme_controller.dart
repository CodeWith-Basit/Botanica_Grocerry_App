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

  // Dark Theme matched precisely to design mockup:
  // - Deep obsidian/black scaffold: #0F1210
  // - Rounded dark container cards: #191E1A / #1D231E
  // - Vibrant neon-green / emerald accents: #22C55E / #34D399
  // - Category circle/pill dark tints: #152219, #251F1C, #182420, etc.
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color(0xFF0F1210),
      primaryColor: const Color(0xFF22C55E),
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFF22C55E),
        secondary: Color(0xFF34D399),
        surface: Color(0xFF191E1A),
        surfaceContainerHighest: Color(0xFF232B25),
        onSurface: Color(0xFFEDEDED),
        onPrimary: Colors.white,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF0F1210),
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFF22C55E)),
        titleTextStyle: TextStyle(
          color: Color(0xFF22C55E),
          fontSize: 22,
          fontWeight: FontWeight.w900,
        ),
      ),
      cardColor: const Color(0xFF191E1A),
      drawerTheme: const DrawerThemeData(
        backgroundColor: Color(0xFF151916),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xFF0F1210),
        selectedItemColor: Color(0xFF22C55E),
        unselectedItemColor: Color(0xFF9CA3AF),
      ),
    );
  }
}
