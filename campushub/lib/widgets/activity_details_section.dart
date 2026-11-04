import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:campushub/models/activity.dart';
import 'package:campushub/providers/activity_favorites_provider.dart';
import 'package:campushub/providers/settings_provider.dart';
import 'package:campushub/widgets/animated_favorite_bar.dart';

class ActivityDetailsSection extends StatelessWidget {
  const ActivityDetailsSection({
    super.key,
    required this.activity,
  });

  final Activity activity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          Text(
            activity.title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 15),

          const Text('Description'),
          Text(activity.description),

          const SizedBox(height: 15),

          const Text('Venue'),
          Text(activity.venue),

          const SizedBox(height: 15),

          const Text('Duration'),

          Consumer<SettingsProvider>(
            builder: (context, settings, child) {
              return Text(settings.formatDuration(activity.duration));
            },
          ),

          const SizedBox(height: 15),

          const Text('Skill Level'),
          Text(activity.skillLevel.name),

          const SizedBox(height: 20),

          const Text(
            'Requirements',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          ...activity.requirements.map((requirement) {
            return ListTile(
              leading: const Icon(Icons.check_circle),
              title: Text(requirement),
            );
          }),

          const SizedBox(height: 15),

          const Text(
            'Benefits',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          ...activity.benefits.map((benefit) {
            return ListTile(
              leading: const Icon(Icons.star),
              title: Text(benefit),
            );
          }),

          const SizedBox(height: 20),

          Consumer<ActivityFavoritesProvider>(
            builder: (context, favoritesProvider, child) {

              return AnimatedFavoriteBar(
                isFavorite: favoritesProvider.isFavorite(activity),

                onPressed: () {
                  favoritesProvider.toggleFavorite(activity);
                },
              );
            },
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}