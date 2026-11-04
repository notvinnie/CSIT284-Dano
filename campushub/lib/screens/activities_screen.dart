
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:campushub/data/dummy_data.dart';
//import 'package:campushub/models/activity.dart';
import 'package:campushub/models/activity_category.dart';
import 'package:campushub/providers/activity_favorites_provider.dart';
import 'package:campushub/screens/activity_detail_screen.dart';

class ActivitiesScreen extends StatelessWidget {
  const ActivitiesScreen({
    super.key,
    required this.category,
  });

  final ActivityCategory category;

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

          : Consumer<ActivityFavoritesProvider>(
              builder: (context, favoritesProvider, child) {

                return ListView.builder(
                  itemCount: filteredActivities.length,

                  itemBuilder: (context, index) {
                    final activity = filteredActivities[index];

                    final isFavorite =
                        favoritesProvider.isFavorite(activity);

                    return Card(
                      margin: const EdgeInsets.all(10),

                      child: ListTile(
                        contentPadding: const EdgeInsets.all(10),

                        leading: Image.network(
                          activity.imageUrl,
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                        ),

                        title: Text(activity.title),

                        subtitle: Text(
                          'Duration: ${activity.duration} minutes\n'
                          'Skill Level: ${activity.skillLevel.name}',
                        ),

                        isThreeLine: true,

                        trailing: IconButton(
                          icon: Icon(
                            isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: isFavorite
                                ? Colors.red
                                : Colors.grey,
                          ),

                          onPressed: () {
                            favoritesProvider.toggleFavorite(activity);
                          },
                        ),

                        onTap: () {
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
                        },
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
