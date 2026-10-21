import 'package:flutter/material.dart';
import '../data/questions.dart';
import '../widgets/answer_button.dart';
import '../widgets/home_button.dart';
import '../widgets/question_display.dart';
import 'result_screen.dart';

class AssessmentScreen extends StatefulWidget {
  const AssessmentScreen({super.key});

  @override
  State<AssessmentScreen> createState() => _AssessmentScreenState();
}

class _AssessmentScreenState extends State<AssessmentScreen> {
  int questionIndex = 0;
  int totalScore = 0;

  bool get isFinished => questionIndex >= questions.length;

  void answerQuestion(int score) {
    setState(() {
      totalScore += score;
      questionIndex++;
    });
  }

  void restart() {
    setState(() {
      questionIndex = 0;
      totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isFinished) {
      return ResultsScreen(
        totalScore: totalScore,
        onRestart: restart,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Wellness Assessment'),
      ),
      floatingActionButton: const HomeButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 96),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500),
              child: _buildQuestion(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildQuestion() {
    final current = questions[questionIndex];

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Question ${questionIndex + 1} of ${questions.length}',
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: LinearProgressIndicator(
            value: (questionIndex + 1) / questions.length,
            minHeight: 8,
            backgroundColor: Colors.white,
          ),
        ),
        const SizedBox(height: 16),
        QuestionDisplay(question: current.question),
        const SizedBox(height: 16),
        ...current.answers.map(
          (answer) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: AnswerButton(
              text: answer['text'] as String,
              onTap: () => answerQuestion(answer['score'] as int),
            ),
          ),
        ),
      ],
    );
  }
}