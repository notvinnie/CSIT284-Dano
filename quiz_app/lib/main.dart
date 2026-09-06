import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.purple],
            ),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/logo.png', width: 200),

                const SizedBox(height: 30),

                const Text(
                  'Learn Flutter the fun way!',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),

                const SizedBox(height: 20),

                Builder(
                  builder: (context) {
                    return TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Quiz()),
                        );
                      },
                      child: const Text(
                        'Start Quiz',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

class Quiz extends StatelessWidget {
  const Quiz({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Colors.deepPurple, Colors.purple]),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //question
              const Text(
                'Question 1: yaba?',
                style: TextStyle(fontSize: 20, color: Colors.black),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 30),

              //ans1
              TextButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => const Quiz2()),
                  // );
                },
                child: const Text('daba', style: TextStyle(color: Colors.white)),
              ),

              //ans2
              TextButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => const Quiz2()),
                  // );
                },
                child: const Text('doo', style: TextStyle(color: Colors.white)),
              ),

              //ans3
              TextButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => const Quiz2()),
                  // );
                },
                child: const Text('daba dee', style: TextStyle(color: Colors.white)),
              ),

              //ans4
              TextButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => const Quiz2()),
                  // );
                },
                child: const Text('daba daba', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// copy&paste the quiz1 up top and change it to quiz2