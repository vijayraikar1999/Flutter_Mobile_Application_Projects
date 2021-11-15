import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:quiz_app/controllers/question_controller.dart';

import '../../../constants.dart';

class Option extends StatelessWidget {
  final String text;
  final int index;
  final VoidCallback press;

  const Option({
    Key? key,
    required this.text,
    required this.index,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
        init: QuestionController(),
        builder: (qnController) {
          Color getTheRightColor() {
            if (qnController.isAnswered) {
              if (index == qnController.correctAns) {
                return kGreenColor;
              } else if (index == qnController.selectedAns &&
                  qnController.selectedAns != qnController.correctAns) {
                return kRedColor;
              }
            }
            return kGrayColor;
          }

          Color rightColor = getTheRightColor();

          IconData getRightIcon() =>
              rightColor == kGreenColor ? Icons.done : Icons.close;

          return InkWell(
            onTap: press,
            child: Container(
              margin: const EdgeInsets.only(top: kDefaultPadding),
              padding: const EdgeInsets.all(kDefaultPadding),
              decoration: BoxDecoration(
                border: Border.all(color: rightColor),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${index + 1} $text',
                    style: TextStyle(
                      color: rightColor,
                      fontSize: 16.0,
                    ),
                  ),
                  Container(
                    height: 26.0,
                    width: 26.0,
                    decoration: BoxDecoration(
                      color: rightColor == kGrayColor
                          ? Colors.transparent
                          : rightColor,
                      borderRadius: BorderRadius.circular(50.0),
                      border: Border.all(color: getTheRightColor()),
                    ),
                    child: rightColor == kGrayColor
                        ? null
                        : Icon(
                            getRightIcon(),
                            color: Colors.white,
                            size: 16.0,
                          ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
