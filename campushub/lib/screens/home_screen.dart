import 'package:flutter/material.dart';

import 'package:campushub/screens/categories_screen.dart';
import 'package:campushub/screens/favorites_screen.dart';
import 'package:campushub/screens/settings_screen.dart';

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