import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:campushub/providers/activity_favorites_provider.dart';
import 'package:campushub/providers/settings_provider.dart';
import 'package:campushub/screens/categories_screen.dart';
import 'package:campushub/screens/favorites_screen.dart';
import 'package:campushub/screens/settings_screen.dart';

const Color appBlue = Color(0xFF1565C0);
const Color appDarkBlue = Color(0xFF0D3B8C);
const Color appPaleBlue = Color(0xFFF1F6FD);
const Color appYellow = Color(0xFFFFC107);
const Color appTextColor = Color(0xFF1B2A41);

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

      theme: ThemeData(
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
      ),

      darkTheme: ThemeData.dark(),

      themeMode: settings.isDarkMode ? ThemeMode.dark : ThemeMode.light,

      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {

    final screens = [
      const CategoriesScreen(),
      const FavoritesScreen(),
      const SettingsScreen(),
    ];

    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    if (isLandscape) {
      return Scaffold(
        body: Row(
          children: [

            NavigationRail(
              selectedIndex: selectedIndex,
              labelType: NavigationRailLabelType.all,

              onDestinationSelected: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },

              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.category),
                  label: Text('Categories'),
                ),

                NavigationRailDestination(
                  icon: Icon(Icons.favorite),
                  label: Text('Favorites'),
                ),

                NavigationRailDestination(
                  icon: Icon(Icons.settings),
                  label: Text('Settings'),
                ),
              ],
            ),

            const VerticalDivider(width: 1),

            Expanded(
              child: screens[selectedIndex],
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: screens[selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,

        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}