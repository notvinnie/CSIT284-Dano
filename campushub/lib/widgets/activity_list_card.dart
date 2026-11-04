import 'package:flutter/material.dart';

import 'package:campushub/models/activity.dart';
import 'package:campushub/widgets/adaptive_network_image.dart';
import 'package:campushub/widgets/animated_favorite_button.dart';

class ActivityListCard extends StatelessWidget {
  const ActivityListCard({
    super.key,
    required this.activity,
    required this.isFavorite,
    required this.durationText,
    required this.onTap,
    required this.onFavoritePressed,
  });

  final Activity activity;
  final bool isFavorite;
  final String durationText;
  final VoidCallback onTap;
  final VoidCallback onFavoritePressed;

  @override
  Widget build(BuildContext context) {
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
          'Duration: $durationText\n'
          'Skill Level: ${activity.skillLevel.name}',
        ),

        isThreeLine: true,

        trailing: AnimatedFavoriteButton(
          isFavorite: isFavorite,
          onPressed: onFavoritePressed,
        ),

        onTap: onTap,
      ),
    );
  }
}