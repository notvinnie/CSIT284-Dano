import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:campushub/data/dummy_data.dart';
import 'package:campushub/models/activity.dart';
import 'package:campushub/models/activity_category.dart';
import 'package:campushub/providers/activity_favorites_provider.dart';
import 'package:campushub/providers/settings_provider.dart';
import 'package:campushub/screens/activity_detail_screen.dart';
import 'package:campushub/widgets/activity_grid_card.dart';
import 'package:campushub/widgets/activity_list_card.dart';

class ActivitiesScreen extends StatelessWidget {
  const ActivitiesScreen({
    super.key,
    required this.category,
  });

  final ActivityCategory category;

  void openDetail(BuildContext context, Activity activity) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return ActivityDetailScreen(
            activity: activity,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    final filteredActivities = dummyActivities.where((activity) {
      return activity.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
        backgroundColor: category.color,
      ),

      body: filteredActivities.isEmpty

          ? const Center(
              child: Text(
                'No activities available in this category.',
              ),
            )

          : Consumer2<ActivityFavoritesProvider, SettingsProvider>(
              builder: (context, favoritesProvider, settings, child) {

                return OrientationBuilder(
                  builder: (context, orientation) {

                    if (orientation == Orientation.portrait) {
                      return ListView.builder(
                        itemCount: filteredActivities.length,

                        itemBuilder: (context, index) {
                          final activity = filteredActivities[index];

                          return ActivityListCard(
                            activity: activity,
                            isFavorite: favoritesProvider.isFavorite(activity),
                            durationText:
                                settings.formatDuration(activity.duration),
                            onTap: () {
                              openDetail(context, activity);
                            },
                            onFavoritePressed: () {
                              favoritesProvider.toggleFavorite(activity);
                            },
                          );
                        },
                      );
                    }

                    return GridView.builder(
                      padding: const EdgeInsets.all(10),

                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 0.85,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),

                      itemCount: filteredActivities.length,

                      itemBuilder: (context, index) {
                        final activity = filteredActivities[index];

                        return ActivityGridCard(
                          activity: activity,
                          isFavorite: favoritesProvider.isFavorite(activity),
                          durationText:
                              settings.formatDuration(activity.duration),
                          onTap: () {
                            openDetail(context, activity);
                          },
                          onFavoritePressed: () {
                            favoritesProvider.toggleFavorite(activity);
                          },
                        );
                      },
                    );
                  },
                );
              },
            ),
    );
  }
}