import 'package:flutter/material.dart';
import 'package:expense_tracker/widget/expenses.dart';

const kNavy = Color(0xFF0B1F4B);
const kRoyalBlue = Color(0xFF1D4ED8);
const kSunYellow = Color(0xFFFFC72C);
const kPaleYellow = Color(0xFFFFF3C4);
const kSkyBackground = Color(0xFFEAF1FF);

final kColorScheme = ColorScheme.fromSeed(seedColor: kRoyalBlue).copyWith(
  primary: kRoyalBlue,
  onPrimary: Colors.white,
  primaryContainer: kSunYellow,
  onPrimaryContainer: kNavy,
  secondary: kSunYellow,
  onSecondary: kNavy,
  secondaryContainer: kPaleYellow,
  onSecondaryContainer: kNavy,
  surface: kSkyBackground,
  onSurface: kNavy,
);

final kDarkColorScheme =
    ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: kRoyalBlue,
    ).copyWith(
      primary: kSunYellow,
      onPrimary: kNavy,
      primaryContainer: kSunYellow,
      onPrimaryContainer: kNavy,
      secondary: const Color(0xFF6EA8FF),
      onSecondary: kNavy,
      secondaryContainer: const Color(0xFF16336E),
      onSecondaryContainer: Colors.white,
      surface: const Color(0xFF08142E),
      onSurface: Colors.white,
    );

void main() {
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkColorScheme,
        scaffoldBackgroundColor: kDarkColorScheme.surface,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: kSunYellow, width: 2),
          ),
        ),
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kNavy,
          foregroundColor: kSunYellow,
          centerTitle: true,
        ),
        cardTheme: CardThemeData().copyWith(
          color: kDarkColorScheme.secondaryContainer,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
            side: BorderSide(color: kSunYellow.withValues(alpha: 0.35)),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        bottomSheetTheme: const BottomSheetThemeData().copyWith(
          backgroundColor: const Color(0xFF0E2457),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.primaryContainer,
            foregroundColor: kDarkColorScheme.onPrimaryContainer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: kDarkColorScheme.secondary,
          ),
        ),
        snackBarTheme: const SnackBarThemeData().copyWith(
          backgroundColor: kSunYellow,
          contentTextStyle: const TextStyle(color: kNavy),
          actionTextColor: kRoyalBlue,
        ),
      ),
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        scaffoldBackgroundColor: kSkyBackground,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: kRoyalBlue, width: 2),
          ),
        ),
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
          centerTitle: true,
        ),
        cardTheme: CardThemeData().copyWith(
          color: kColorScheme.secondaryContainer,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
            side: BorderSide(
              color: kSunYellow.withValues(alpha: 0.9),
              width: 1.5,
            ),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        bottomSheetTheme: const BottomSheetThemeData().copyWith(
          backgroundColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
            foregroundColor: kColorScheme.onPrimaryContainer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: kColorScheme.primary),
        ),
        snackBarTheme: const SnackBarThemeData().copyWith(
          backgroundColor: kNavy,
          contentTextStyle: const TextStyle(color: Colors.white),
          actionTextColor: kSunYellow,
        ),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            color: kColorScheme.onSecondaryContainer,
            fontSize: 16,
          ),
        ),
      ),
      // themeMode: ThemeMode.system, // default
      home: const Expenses(),
    ),
  );
  // });
}
