import 'package:flutter/material.dart';
import 'package:quiz_app_flutter/data/questions.dart';
import 'package:quiz_app_flutter/quiz/components/question_card.dart';
import 'package:quiz_app_flutter/quiz/controllers/questions_controller.dart';
import 'package:quiz_app_flutter/quiz/score/score_screen.dart';

class QuestionsList extends StatelessWidget {
  const QuestionsList({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final QuestionsController controller;

  @override
  Widget build(BuildContext context) {
    int i = 1;

    return SingleChildScrollView(
      child: Column(
        children: [
          ...questions
              .map(
                (question) => QuestionCard(
                  question: question,
                  index: i++,
                  controller: controller,
                ),
              )
              .toList(),
          const SizedBox(height: 10.0),
          ElevatedButton(
            onPressed: () => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => ScoreScreen(
                  score: controller.numOfCorrectAns,
                ),
              ),
              (route) => false,
            ),
            child: const Text(
              'See your score',
            ),
          ),
          const SizedBox(height: 25.0),
        ],
      ),
    );
  }
}
