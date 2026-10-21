import '../models/question.dart';

final List<Question> questions = [
  Question(
    question: 'How many hours do you sleep daily?',
    answers: [
      {'text': 'Less than 4 hours', 'score': 1},
      {'text': '4–6 hours', 'score': 2},
      {'text': '7–8 hours', 'score': 4},
      {'text': 'More than 8 hours', 'score': 3},
    ],
  ),
  Question(
    question: 'How often do you exercise per week?',
    answers: [
      {'text': 'Never', 'score': 1},
      {'text': '1–2 times', 'score': 2},
      {'text': '3–4 times', 'score': 3},
      {'text': '5 or more times', 'score': 4},
    ],
  ),
  Question(
    question: 'How would you rate your stress level?',
    answers: [
      {'text': 'Very high', 'score': 1},
      {'text': 'High', 'score': 2},
      {'text': 'Moderate', 'score': 3},
      {'text': 'Low', 'score': 4},
    ],
  ),
  Question(
    question: 'How many glasses of water do you drink daily?',
    answers: [
      {'text': '0–2', 'score': 1},
      {'text': '3–4', 'score': 2},
      {'text': '5–7', 'score': 3},
      {'text': '8 or more', 'score': 4},
    ],
  ),
  Question(
    question: 'How often do you eat balanced meals?',
    answers: [
      {'text': 'Rarely', 'score': 1},
      {'text': 'Sometimes', 'score': 2},
      {'text': 'Most days', 'score': 3},
      {'text': 'Every day', 'score': 4},
    ],
  ),
];