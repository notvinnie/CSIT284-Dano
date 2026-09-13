import 'package:flutter/material.dart';
import 'quiz_question.dart';

class QuestionsScreen extends StatelessWidget {
  const QuestionsScreen({
    super.key,
    required this.question,
    required this.onSelectAnswer,
  });

  final Quiztion question;
  final void Function(String answer) onSelectAnswer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Colors.deepPurple, Colors.purple]),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                question.question,
                style: const TextStyle(fontSize: 20, color: Colors.black),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      onSelectAnswer(question.answers[0]);
                    },
                    child: Text(
                      question.answers[0],
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),

                  TextButton(
                    onPressed: () {
                      onSelectAnswer(question.answers[1]);
                    },
                    child: Text(
                      question.answers[1],
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      onSelectAnswer(question.answers[2]);
                    },
                    child: Text(
                      question.answers[2],
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),

                  TextButton(
                    onPressed: () {
                      onSelectAnswer(question.answers[3]);
                    },
                    child: Text(
                      question.answers[3],
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
