
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:campushub/models/activity.dart';
import 'package:campushub/providers/activity_favorites_provider.dart';

class ActivityDetailScreen extends StatelessWidget {
  const ActivityDetailScreen({
    super.key,
    required this.activity,
  });

  final Activity activity;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity Details'),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Image.network(
              activity.imageUrl,
              width: double.infinity,
              height: 220,
              fit: BoxFit.cover,
            ),

            Padding(
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
                  Text('${activity.duration} minutes'),

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

                      return SizedBox(
                        width: double.infinity,

                        child: ElevatedButton.icon(
                          onPressed: () {
                            favoritesProvider.toggleFavorite(activity);
                          },

                          icon: Icon(
                            isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                          ),

                          label: Text(
                            isFavorite
                                ? 'Favorited'
                                : 'Favorite',
                          ),
                        ),
                      );
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
}
