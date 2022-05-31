import 'package:flutter/material.dart';
import 'package:quiz_app_flutter/quiz/controllers/questions_controller.dart';

import 'options_list.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key? key,
    required this.question,
    required this.index,
    required this.controller,
  }) : super(key: key);

  final Map<String, Object> question;
  final int index;
  final QuestionsController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Text(
              '$index / 10',
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 5.0),
          Container(
            // width: double.infinity,
            constraints: const BoxConstraints(
              minHeight: 370.0,
              maxHeight: 370.0,
              minWidth: double.infinity,
            ),
            decoration: BoxDecoration(
              // color: Colors.red,
              borderRadius: BorderRadius.circular(20.0),
              // border: Border.all(
              //   color: const Color(0xffdacc96),
              //   width: 1.0,
              // ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset(
                'assets/images/${question['imageIndex']}.jpg',
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          Text(
            question['question'] as String,
            style: const TextStyle(
              fontSize: 19.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          OptionsList(
            question: question,
            controller: controller,
          ),
        ],
      ),
    );
  }
}
