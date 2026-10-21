import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals/routes.dart';
import 'package:meals/screens/about.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/tabs.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 131, 57, 0),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: const TabsScreen(),
      routes: {
        AppRoutes.about: (ctx) => const AboutScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == AppRoutes.filters) {
          final currentFilters = settings.arguments as Map<Filter, bool>;
          return MaterialPageRoute<Map<Filter, bool>>(
            builder: (ctx) => FiltersScreen(currentFilters: currentFilters),
          );
        }
        return null;
      },
    );
  }
}