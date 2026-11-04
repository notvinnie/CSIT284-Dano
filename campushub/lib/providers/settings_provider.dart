import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {

  bool isDarkMode = false;
  bool showDurationInHours = false;

  void toggleDarkMode(bool value) {
    isDarkMode = value;
    notifyListeners();
  }

  void toggleDurationInHours(bool value) {
    showDurationInHours = value;
    notifyListeners();
  }

  String formatDuration(int minutes) {

    if (!showDurationInHours) {
      return '$minutes minutes';
    }

    final hours = minutes / 60;

    final text = hours == hours.roundToDouble()
        ? hours.toStringAsFixed(0)
        : hours.toStringAsFixed(1);

    return '$text ${hours == 1 ? 'hour' : 'hours'}';
  }
}