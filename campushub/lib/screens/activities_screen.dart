import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:campushub/data/dummy_data.dart';
import 'package:campushub/models/activity.dart';
import 'package:campushub/models/activity_category.dart';
import 'package:campushub/providers/activity_favorites_provider.dart';
import 'package:campushub/providers/settings_provider.dart';
import 'package:campushub/screens/activity_detail_screen.dart';
import 'package:campushub/widgets/adaptive_network_image.dart';
import 'package:campushub/widgets/animated_favorite_button.dart';

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

  Widget buildListCard(
    BuildContext context,
    Activity activity,
    ActivityFavoritesProvider favoritesProvider,
    SettingsProvider settings,
  ) {
    final isFavorite = favoritesProvider.isFavorite(activity);

    return Card(
      margin: const EdgeInsets.all(10),

      child: ListTile(
        contentPadding: const EdgeInsets.all(10),

        leading: AdaptiveNetworkImage(
          url: activity.imageUrl,
          width: 70,
          height: 70,
        ),

        title: Text(activity.title),

        subtitle: Text(
          'Duration: ${settings.formatDuration(activity.duration)}\n'
          'Skill Level: ${activity.skillLevel.name}',
        ),

        isThreeLine: true,

        trailing: AnimatedFavoriteButton(
          isFavorite: isFavorite,

          onPressed: () {
            favoritesProvider.toggleFavorite(activity);
          },
        ),

        onTap: () {
          openDetail(context, activity);
        },
      ),
    );
  }

  Widget buildGridCard(
    BuildContext context,
    Activity activity,
    ActivityFavoritesProvider favoritesProvider,
    SettingsProvider settings,
  ) {
    final isFavorite = favoritesProvider.isFavorite(activity);

    return Card(
      clipBehavior: Clip.antiAlias,

      child: InkWell(
        onTap: () {
          openDetail(context, activity);
        },

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Expanded(
              child: AdaptiveNetworkImage(
                url: activity.imageUrl,
                width: double.infinity,
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(10, 8, 4, 4),

              child: Row(
                children: [

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text(
                          activity.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 4),

                        Text(
                          '${settings.formatDuration(activity.duration)}'
                          ' • ${activity.skillLevel.name}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),

                  AnimatedFavoriteButton(
                    isFavorite: isFavorite,

                    onPressed: () {
                      favoritesProvider.toggleFavorite(activity);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
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

                          return buildListCard(
                            context,
                            activity,
                            favoritesProvider,
                            settings,
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

                        return buildGridCard(
                          context,
                          activity,
                          favoritesProvider,
                          settings,
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