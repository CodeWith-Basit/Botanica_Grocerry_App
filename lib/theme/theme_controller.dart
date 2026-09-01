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

  // Dark Theme
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color(0xFF121512),
      primaryColor: const Color(0xFF22C55E),
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFF22C55E),
        secondary: Color(0xFF10B981),
        surface: Color(0xFF1E241F),
        surfaceContainerHighest: Color(0xFF273029),
        onSurface: Color(0xFFE5E7EB),
        onPrimary: Colors.white,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF121512),
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFF22C55E)),
        titleTextStyle: TextStyle(color: Color(0xFF22C55E), fontSize: 20),
      ),
      cardColor: const Color(0xFF1E241F),
      drawerTheme: const DrawerThemeData(
        backgroundColor: Color(0xFF1E241F),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xFF1E241F),
        selectedItemColor: Color(0xFF22C55E),
        unselectedItemColor: Color(0xFF9CA3AF),
      ),
    );
  }
}
