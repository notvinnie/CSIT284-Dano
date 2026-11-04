import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:campushub/providers/activity_favorites_provider.dart';
import 'package:campushub/providers/settings_provider.dart';
import 'package:campushub/screens/home_screen.dart';
import 'package:campushub/theme/app_theme.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ActivityFavoritesProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SettingsProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final settings = context.watch<SettingsProvider>();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CampusHub',

      theme: buildLightTheme(),

      darkTheme: ThemeData.dark(),

      themeMode: settings.isDarkMode ? ThemeMode.dark : ThemeMode.light,

      home: const HomeScreen(),
    );
  }
}