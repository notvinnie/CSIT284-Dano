import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:campushub/models/activity.dart';
import 'package:campushub/providers/activity_favorites_provider.dart';
import 'package:campushub/providers/settings_provider.dart';
import 'package:campushub/widgets/adaptive_network_image.dart';
import 'package:campushub/widgets/animated_favorite_bar.dart';

class ActivityDetailScreen extends StatelessWidget {
  const ActivityDetailScreen({
    super.key,
    required this.activity,
  });

  final Activity activity;

  Widget buildDetails() {
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

              final isFavorite =
                  favoritesProvider.isFavorite(activity);

              return AnimatedFavoriteBar(
                isFavorite: isFavorite,

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

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity Details'),
      ),

      body: OrientationBuilder(
        builder: (context, orientation) {

          if (orientation == Orientation.portrait) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  AdaptiveNetworkImage(
                    url: activity.imageUrl,
                    width: double.infinity,
                    height: 220,
                  ),

                  buildDetails(),
                ],
              ),
            );
          }

          return Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: [

              Expanded(
                flex: 2,
                child: AdaptiveNetworkImage(
                  url: activity.imageUrl,
                ),
              ),

              Expanded(
                flex: 3,
                child: SingleChildScrollView(
                  child: buildDetails(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}