import 'package:flutter/material.dart';
import 'quiz_question.dart';
import 'questions_screen.dart';

const questions = [
  Quiztion('What are the main building blocks of Flutter UIs?', [
    'Widgets',
    'Components',
    'Blocks',
    'Functions',
  ], correctAnswer: 'Widgets'),

  Quiztion('How are FLutter UIs built?', [
    'By combining widgets in a visual editor',
    'By using XCode for IOS and Android Studio for Android',
    'By combining widgets in code',
    'By defining widgets in a configuration file',
  ], correctAnswer: 'By combining widgets in code'),

  Quiztion('What is the purpose of a StatefulWidget?', [
    'Render UI that does not depend on data',
    'Update data as UI changes',
    'Ignore data changes',
    'Update UI as data changes',
  ], correctAnswer: 'Update UI as data changes'),

  Quiztion(
    'Which widget should you try more often: Stateless Widget or StatefulWidget?',
    [
      'StatefulWidget',
      'StatelessWidget',
      'None of the above',
      'Both are equally good',
    ],
    correctAnswer: 'StatelessWidget',
  ),

  Quiztion('What happens when you change data in a StatelessWidget?', [
    'The closes StatefulWidget is updated',
    'The UI is updated',
    'Any nested StatefulWidget is updated',
    'The UI is not updated',
  ], correctAnswer: 'The UI is not updated'),

  Quiztion('How should you update data inside of StatefulWidgets?', [
    'By calling setState()',
    'By calling updateUI()',
    'By calling updateData()',
    'By calling updateState()',
  ], correctAnswer: 'By calling setState()'),
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
    if (answer == questions[questionNumber].correctAnswer) {
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
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.purple],
            ),
          ),
          child: Center(
            child: Text(
              'You answered $score out of 6 questions correctly!',
              style: const TextStyle(
                fontSize: 30,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
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
