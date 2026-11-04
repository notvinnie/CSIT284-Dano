import 'package:flutter/material.dart';

import 'package:campushub/models/activity.dart';
import 'package:campushub/widgets/activity_details_section.dart';
import 'package:campushub/widgets/adaptive_network_image.dart';

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

                  ActivityDetailsSection(activity: activity),
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
                  child: ActivityDetailsSection(activity: activity),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}