import 'package:flutter/material.dart';
import 'package:quiz_app_flutter/quiz/components/option.dart';
import 'package:quiz_app_flutter/quiz/controllers/questions_controller.dart';

class OptionsList extends StatefulWidget {
  const OptionsList({
    Key? key,
    required this.question,
    required this.controller,
  }) : super(key: key);

  final Map<String, Object> question;
  final QuestionsController controller;

  @override
  State<OptionsList> createState() => _OptionsListState();
}

class _OptionsListState extends State<OptionsList> {
  bool isClicked = false;
  int wrongIndex = -1;

  void verifyAns(int index) {
    setState(() {
      isClicked = true;
      wrongIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    int i = 1;
    return Column(
      children: (widget.question['options'] as List)
          .map(
            (optionMap) => Option(
              option: optionMap['option'] as String,
              isTrue: optionMap['is_true'],
              press: verifyAns,
              isClicked: isClicked,
              index: i++,
              wrongIndex: wrongIndex,
              controller: widget.controller,
            ),
          )
          .toList(),
    );
  }
}
