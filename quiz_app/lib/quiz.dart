import 'package:flutter/material.dart';
import 'quiz_question.dart';
import 'questions_screen.dart';

const questions = [
  Quiztion('What are the main building blocks of Flutter UIs?', [
    'Widgets',
    'Components',
    'Blocks',
    'Functions',
  ]),

  Quiztion('What language does Flutter use?', [
    'Dart',
    'Java',
    'C++',
    'Python',
  ]),

  Quiztion('What is a widget in Flutter?', [
    'A building block of the UI',
    'A database',
    'A programming language',
    'A file',
  ]),

  Quiztion('Which widget can change its state?', [
    'StatefulWidget',
    'StatelessWidget',
    'Text',
    'Container',
  ]),

  Quiztion('Which widget is used when the UI does not need to change?', [
    'StatelessWidget',
    'StatefulWidget',
    'Scaffold',
    'MaterialApp',
  ]),

  Quiztion('What does setState() do?', [
    'Updates the UI',
    'Deletes the UI',
    'Closes the app',
    'Creates a widget',
  ]),
];

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  int questionNumber = 0;
  int score = 0;

  void answerQuestion(String answer) {
    if (answer == questions[questionNumber].answers[0]) {
      score++;
    }

    setState(() {
      questionNumber++;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (questionNumber == questions.length) {
      return Scaffold(
        body: Center(
          child: Text(
            'Score: $score / 6',
            style: const TextStyle(fontSize: 30),
          ),
        ),
      );
    }

    return QuestionsScreen(
      question: questions[questionNumber],
      onSelectAnswer: answerQuestion,
    );
  }
}
