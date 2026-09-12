import 'package:flutter/material.dart';

int score = 0;

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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //question
              const Text(
                'Question 1: What are the main Building Blocks of Flutter?',
                style: TextStyle(fontSize: 20, color: Colors.black),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 30),

              //ans1 and ans2
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ans1 - correct
                  TextButton(
                    onPressed: () {
                      score++;

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Quiz2()),
                      );
                    },
                    child: const Text(
                      'daba',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),

                  // ans2
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Quiz2()),
                      );
                    },
                    child: const Text(
                      'doo',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),

              // ans3 and ans4
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ans3
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Quiz2()),
                      );
                    },
                    child: const Text(
                      'daba dee',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),

                  // ans4
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Quiz2()),
                      );
                    },
                    child: const Text(
                      'daba daba',
                      style: TextStyle(color: Colors.white),
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

class Quiz2 extends StatelessWidget {
  const Quiz2({super.key});

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
              //question
              const Text(
                'Question 1: yaba?',
                style: TextStyle(fontSize: 20, color: Colors.black),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 30),

              //ans1 and ans2
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ans1
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Quiz2()),
                      );
                    },
                    child: const Text(
                      'daba',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),

                  // ans2 - correct
                  TextButton(
                    onPressed: () {
                      score++;

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Quiz2()),
                      );
                    },
                    child: const Text(
                      'doo',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),

              // ans3 and ans4
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ans3
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Quiz2()),
                      );
                    },
                    child: const Text(
                      'daba dee',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),

                  // ans4
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Quiz2()),
                      );
                    },
                    child: const Text(
                      'daba daba',
                      style: TextStyle(color: Colors.white),
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

// CODE IS MESSY GONNA HAVE TO CLEAN IT UP SOONER OR LATER, BUT FOR NOW IT WORKS SO UH....