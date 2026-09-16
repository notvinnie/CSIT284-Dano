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
                style: const TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        onSelectAnswer(question.answers[0]);
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 52, 6, 112),
                      ),
                      child: Text(
                        question.answers[0],
                        textAlign: TextAlign.center,
                        softWrap: true,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        onSelectAnswer(question.answers[1]);
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 52, 6, 112),
                      ),
                      child: Text(
                        question.answers[1],
                        textAlign: TextAlign.center,
                        softWrap: true,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        onSelectAnswer(question.answers[2]);
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 52, 6, 112),
                      ),
                      child: Text(
                        question.answers[2],
                        textAlign: TextAlign.center,
                        softWrap: true,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        onSelectAnswer(question.answers[3]);
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 52, 6, 112),
                      ),
                      child: Text(
                        question.answers[3],
                        textAlign: TextAlign.center,
                        softWrap: true,
                        style: const TextStyle(color: Colors.white),
                      ),
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
