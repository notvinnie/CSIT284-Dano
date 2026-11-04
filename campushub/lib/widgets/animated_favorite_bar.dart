import 'package:flutter/material.dart';

class AnimatedFavoriteBar extends StatelessWidget {
  const AnimatedFavoriteBar({
    super.key,
    required this.isFavorite,
    required this.onPressed,
  });

  final bool isFavorite;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,

        width: double.infinity,
        height: isFavorite ? 60 : 50,

        decoration: BoxDecoration(
          color: isFavorite
              ? Colors.red
              : Theme.of(context).colorScheme.primary,

          borderRadius: BorderRadius.circular(
            isFavorite ? 30 : 8,
          ),

          boxShadow: [
            BoxShadow(
              color: isFavorite
                  ? Colors.red.withOpacity(0.4)
                  : Colors.black26,
              blurRadius: isFavorite ? 12 : 4,
              offset: const Offset(0, 3),
            ),
          ],
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Icon(
              isFavorite
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: Colors.white,
            ),

            const SizedBox(width: 8),

            Text(
              isFavorite
                  ? 'Favorited'
                  : 'Favorite',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}