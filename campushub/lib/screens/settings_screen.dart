import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:campushub/providers/settings_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),

      body: Consumer<SettingsProvider>(
        builder: (context, settings, child) {

          return ListView(
            children: [

              ListTile(
                leading: const Icon(Icons.dark_mode),
                title: const Text('Dark Mode'),
                subtitle: const Text('Switch between light and dark theme'),

                trailing: Switch.adaptive(
                  value: settings.isDarkMode,

                  onChanged: (value) {
                    settings.toggleDarkMode(value);
                  },
                ),
              ),

              ListTile(
                leading: const Icon(Icons.timer),
                title: const Text('Show Duration in Hours'),
                subtitle: const Text('Display activity length in hours'),

                trailing: Switch.adaptive(
                  value: settings.showDurationInHours,

                  onChanged: (value) {
                    settings.toggleDurationInHours(value);
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}