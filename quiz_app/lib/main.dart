import 'package:flutter/material.dart';
import 'startscreen.dart';
import 'quiz.dart';

int score = 0;

void main() {
  runApp(
    MaterialApp(
      home: Builder(
        builder: (context) {
          return Scaffold(
            body: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.deepPurple, Colors.purple],
                ),
              ),
              child: StartScreen(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Quiz()),
                );
              }),
            ),
          );
        },
      ),
    ),
  );
}
