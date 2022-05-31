import 'package:flutter/material.dart';

class QuestionsController with ChangeNotifier {
  int numOfClicks;
  int numOfCorrectAns;

  QuestionsController({
    required this.numOfClicks,
    required this.numOfCorrectAns,
  });

  // When 'notifyListeners' is called, it will invoke
  // any callbacks that have been registered with an instance of this object
  // 'addListener'.

  void increaseClicks() {
    this.numOfClicks++;
    notifyListeners();
  }

  void increaseCorrectAns() {
    this.numOfCorrectAns++;
    notifyListeners();
  }
}
