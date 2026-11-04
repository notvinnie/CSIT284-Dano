import 'package:flutter/material.dart';

import 'package:campushub/data/dummy_data.dart';
import 'package:campushub/models/activity_category.dart';
import 'package:campushub/screens/activities_screen.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void openCategory(BuildContext context, ActivityCategory category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return ActivitiesScreen(
            category: category,
          );
        },
      ),
    );
  }

  Widget buildCategoryCard(BuildContext context, ActivityCategory category) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: category.color,
        ),

        title: Text(category.title),

        trailing: const Icon(Icons.arrow_forward_ios),

        onTap: () {
          openCategory(context, category);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity Categories'),
      ),

      body: OrientationBuilder(
        builder: (context, orientation) {

          if (orientation == Orientation.portrait) {
            return ListView.builder(
              itemCount: availableCategories.length,

              itemBuilder: (context, index) {
                final category = availableCategories[index];

                return buildCategoryCard(context, category);
              },
            );
          }

          return GridView.builder(
            padding: const EdgeInsets.all(10),

            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),

            itemCount: availableCategories.length,

            itemBuilder: (context, index) {
              final category = availableCategories[index];

              return buildCategoryCard(context, category);
            },
          );
        },
      ),
    );
  }
}