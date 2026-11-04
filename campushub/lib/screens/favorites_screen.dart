
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:campushub/providers/activity_favorites_provider.dart';
import 'package:campushub/screens/activity_detail_screen.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Favorites'),
      ),

      body: Consumer<ActivityFavoritesProvider>(
        builder: (context, favoritesProvider, child) {

          final favoriteActivities =
              favoritesProvider.getFavorites();

          return favoriteActivities.isEmpty

              ? const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Icon(
                        Icons.favorite_border,
                        size: 60,
                        color: Colors.grey,
                      ),

                      SizedBox(height: 15),

                      Text(
                        'No favorite activities yet.\n'
                        'Start exploring activities!',
                        textAlign: TextAlign.center,

                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                )

              : ListView.builder(
                  itemCount: favoriteActivities.length,

                  itemBuilder: (context, index) {
                    final activity = favoriteActivities[index];

                    return Card(
                      margin: const EdgeInsets.all(10),

                      child: ListTile(
                        leading: Image.network(
                          activity.imageUrl,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),

                        title: Text(activity.title),

                        subtitle: Text(
                          '${activity.duration} minutes',
                        ),

                        trailing: IconButton(
                          icon: const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),

                          onPressed: () {
                            favoritesProvider.removeFavorite(activity);
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
