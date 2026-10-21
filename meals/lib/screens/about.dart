import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    const features = [
      'Browse meals by category',
      'View ingredients and cooking steps',
      'Save your favorite meals',
      'Filter by gluten-free, lactose-free, vegetarian or vegan',
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('About')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Icon(
                Icons.fastfood,
                size: 80,
                color: colorScheme.primary,
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Text(
                'Cooking Up!',
                style: textTheme.headlineMedium!.copyWith(
                  color: colorScheme.onSurface,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: Text(
                'Version 1.0.0',
                style: textTheme.bodyMedium!.copyWith(
                  color: colorScheme.onSurface.withValues(alpha: 0.7),
                ),
              ),
            ),
            const SizedBox(height: 32),
            Text(
              'About this app',
              style: textTheme.titleLarge!.copyWith(
                color: colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Cooking Up! is a meals app built with Flutter as part of a '
              'mobile development course. It demonstrates multi-screen '
              'navigation, passing data between screens, and returning '
              'data when navigating back.',
              style: textTheme.bodyLarge!.copyWith(
                color: colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 28),
            Text(
              'Features',
              style: textTheme.titleLarge!.copyWith(
                color: colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            for (final feature in features)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.check_circle,
                      size: 20,
                      color: colorScheme.tertiary,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        feature,
                        style: textTheme.bodyLarge!.copyWith(
                          color: colorScheme.onSurface,
                        ),
                      ),
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