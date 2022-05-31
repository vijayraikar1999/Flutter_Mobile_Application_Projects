import 'package:flutter/material.dart';
import 'package:quiz_app_flutter/quiz/controllers/questions_controller.dart';

import 'components/questions_list.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionsController controller = QuestionsController(
      numOfClicks: 0,
      numOfCorrectAns: 0,
    );
    controller.addListener(() {});
    return Scaffold(
      appBar: AppBar(
        title: const Text('Marvel Quiz'),
      ),
      // backgroundColor: Colors.grey,
      body: QuestionsList(
        controller: controller,
      ),
    );
  }
}
