import 'package:flutter/material.dart';

const Color appBlue = Color(0xFF1565C0);
const Color appDarkBlue = Color(0xFF0D3B8C);
const Color appPaleBlue = Color(0xFFF1F6FD);
const Color appYellow = Color(0xFFFFC107);
const Color appTextColor = Color(0xFF1B2A41);

ThemeData buildLightTheme() {
  return ThemeData(
    useMaterial3: true,

    colorScheme: ColorScheme.fromSeed(
      seedColor: appBlue,
      brightness: Brightness.light,
    ).copyWith(
      primary: appBlue,
      onPrimary: Colors.white,
      secondary: appYellow,
      onSecondary: Colors.black,
      secondaryContainer: const Color(0xFFFFE082),
      onSecondaryContainer: Colors.black87,
      surface: Colors.white,
    ),

    scaffoldBackgroundColor: appPaleBlue,

    textTheme: const TextTheme(
      headlineSmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.2,
        color: appDarkBlue,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: appDarkBlue,
      ),
      titleMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: appDarkBlue,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        height: 1.4,
        color: appTextColor,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        height: 1.4,
        color: appTextColor,
      ),
      labelLarge: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.5,
      ),
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: appBlue,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.5,
        color: Colors.white,
      ),
    ),

    cardTheme: CardThemeData(
      color: Colors.white,
      elevation: 2,
      shadowColor: appBlue.withOpacity(0.25),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: appBlue.withOpacity(0.08),
        ),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: appBlue,
        foregroundColor: Colors.white,
        elevation: 3,
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 14,
        ),
        textStyle: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),

    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: appYellow,
        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 14,
        ),
        textStyle: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: appBlue,
        textStyle: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),

    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        foregroundColor: appBlue,
      ),
    ),

    listTileTheme: const ListTileThemeData(
      iconColor: appBlue,
    ),

    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: appBlue,
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: appBlue,
      selectedItemColor: appYellow,
      unselectedItemColor: Colors.white70,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
    ),

    navigationRailTheme: const NavigationRailThemeData(
      backgroundColor: appBlue,
      indicatorColor: appDarkBlue,
      selectedIconTheme: IconThemeData(color: appYellow),
      unselectedIconTheme: IconThemeData(color: Colors.white70),
      selectedLabelTextStyle: TextStyle(
        color: appYellow,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelTextStyle: TextStyle(color: Colors.white70),
    ),

    dividerTheme: DividerThemeData(
      color: appBlue.withOpacity(0.15),
      thickness: 1,
    ),
  );
}