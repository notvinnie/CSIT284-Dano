import 'package:flutter/material.dart';
import '../widgets/home_button.dart';

class ResultsScreen extends StatelessWidget {
  final int totalScore;
  final VoidCallback onRestart;

  const ResultsScreen({
    super.key,
    required this.totalScore,
    required this.onRestart,
  });

  String get classification {
    if (totalScore >= 16) return 'Excellent Wellness Habits';
    if (totalScore >= 10) return 'Moderate Wellness Habits';
    return 'Needs Improvement';
  }

  String get recommendation {
    if (totalScore >= 16) {
      return 'Good job! KEEP IT LOCKED IN!';
    }
    if (totalScore >= 10) {
      return 'You are doing well. Small improvements in sleep or activity can help.';
    }
    return 'Oh no thats concerning, go seek professional help.';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Results'),
      ),
      floatingActionButton: const HomeButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 96),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500),
              child: Card(
                elevation: 1,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Your Wellness Score',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '$totalScore',
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      const SizedBox(height: 16),
                      const Divider(),
                      const SizedBox(height: 16),
                      Text(
                        classification,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        recommendation,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: onRestart,
                          icon: Image.asset(
                            'assets/images/restart.png',
                            width: 24,
                            height: 24,
                          ),
                          label: const Text('Restart'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}