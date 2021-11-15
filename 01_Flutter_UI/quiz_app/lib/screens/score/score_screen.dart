import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/controllers/question_controller.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController _qnController = Get.put(QuestionController());
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: SvgPicture.asset(
              'assets/icons/bg.svg',
              fit: BoxFit.fill,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Spacer(flex: 3),
              Text(
                'Score',
                style: Theme.of(context).textTheme.headline3!.copyWith(
                      color: kSecondaryColor,
                    ),
                textAlign: TextAlign.center,
              ),
              Spacer(),
              Text(
                '${_qnController.correctAns * 10}/${_qnController.questions.length * 10}',

                style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: kSecondaryColor,
                    ),
                textAlign: TextAlign.center,
              ),
              Spacer(flex: 3),
            ],
          ),
        ],
      ),
    );
  }
}
