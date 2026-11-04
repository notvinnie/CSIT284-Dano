
import 'package:flutter/material.dart';

import 'package:campushub/data/dummy_data.dart';
import 'package:campushub/screens/activities_screen.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity Categories'),
      ),

      body: ListView.builder(
        itemCount: availableCategories.length,

        itemBuilder: (context, index) {
          final category = availableCategories[index];

          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: category.color,
              ),

              title: Text(category.title),

              trailing: const Icon(Icons.arrow_forward_ios),

              onTap: () {
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
              },
            ),
          );
        },
      ),
    );
  }
}
