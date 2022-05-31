import 'package:flutter/material.dart';
import 'package:quiz_app_flutter/quiz/quiz_screen.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({
    Key? key,
    required this.score,
  }) : super(key: key);

  final int score;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 2),
          Center(
            child: Text(
              '$score/10',
              style: const TextStyle(fontSize: 50.0),
            ),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const QuizScreen(),
              ),
            ),
            child: const Text('Play again!'),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
