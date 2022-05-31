import 'package:flutter/material.dart';
import 'package:quiz_app_flutter/data/constants.dart';
import 'package:quiz_app_flutter/quiz/controllers/questions_controller.dart';

class Option extends StatelessWidget {
  const Option({
    Key? key,
    required this.option,
    required this.isTrue,
    required this.press,
    required this.isClicked,
    required this.index,
    required this.wrongIndex,
    required this.controller,
  }) : super(key: key);

  final String option;
  final bool isTrue;
  final void Function(int) press;
  final bool isClicked;
  final int index;
  final int wrongIndex;
  final QuestionsController controller;

  @override
  Widget build(BuildContext context) {
    Color color = (isClicked && isTrue)
        ? kGreenColor
        : (isClicked && wrongIndex == index)
            ? kOptionRedColor
            : kGrayColor2;
    Color textColor = (isClicked && isTrue)
        ? kGreenColor
        : (isClicked && wrongIndex == index)
            ? kOptionRedColor
            : Colors.black;
    IconData icon = (isClicked && isTrue) ? Icons.done : Icons.close;

    return GestureDetector(
      onTap: () {
        if (isClicked == false) {
          controller.increaseClicks();
          print('Number of clicks: ${controller.numOfClicks}');
          int wrongIndex = index;
          if (isTrue) {
            controller.increaseCorrectAns();
            print('Number of correct answers: ${controller.numOfCorrectAns}');
            wrongIndex = -1;
          }
          press(wrongIndex);
        }
      },
      child: Container(
        margin: const EdgeInsets.only(top: 13.0),
        padding: const EdgeInsets.all(13.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          border: Border.all(color: color),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              option,
              style: TextStyle(
                fontSize: 16.0,
                color: textColor,
              ),
            ),
            Container(
              height: 26.0,
              width: 26.0,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(50.0),
                border: Border.all(
                  color: Colors.black54,
                ),
              ),
              child: color == kGrayColor2
                  ? null
                  : Icon(
                      icon,
                      color: Colors.black54,
                      size: 20.0,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
