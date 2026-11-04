import 'package:flutter/material.dart';

import 'package:campushub/models/activity.dart';
import 'package:campushub/widgets/adaptive_network_image.dart';
import 'package:campushub/widgets/animated_favorite_button.dart';

class ActivityGridCard extends StatelessWidget {
  const ActivityGridCard({
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
      clipBehavior: Clip.antiAlias,

      child: InkWell(
        onTap: onTap,

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
                          '$durationText • ${activity.skillLevel.name}',
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
                    onPressed: onFavoritePressed,
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