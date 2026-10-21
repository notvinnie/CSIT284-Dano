import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const CampusWellnessApp());
}

class CampusWellnessApp extends StatelessWidget {
  const CampusWellnessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Campus Wellness Tracker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 19, 148, 223),
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color.fromARGB(255, 138, 137, 170),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}