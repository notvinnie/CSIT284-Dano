
import 'package:flutter/material.dart';

import 'package:campushub/models/activity.dart';

class ActivityFavoritesProvider extends ChangeNotifier {

  List<Activity> favoriteActivities = [];

  // Add or remove favorite
  void toggleFavorite(Activity activity) {

    if (favoriteActivities.contains(activity)) {
      favoriteActivities.remove(activity);
    } else {
      favoriteActivities.add(activity);
    }

    notifyListeners();
  }

  // Add favorite
  void addFavorite(Activity activity) {

    if (!favoriteActivities.contains(activity)) {
      favoriteActivities.add(activity);
      notifyListeners();
    }
  }

  // Remove favorite
  void removeFavorite(Activity activity) {

    favoriteActivities.remove(activity);

    notifyListeners();
  }

  // Check favorite status
  bool isFavorite(Activity activity) {
    return favoriteActivities.contains(activity);
  }

  // Retrieve favorite list
  List<Activity> getFavorites() {
    return favoriteActivities;
  }
}
