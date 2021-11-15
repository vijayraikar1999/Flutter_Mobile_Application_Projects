import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:quiz_app/models/Questions.dart';

// We use get package for our state management.

class QuestionController extends GetxController
    with SingleGetTickerProviderMixin {
  // Let's animate our progress bar.

  late AnimationController _animationController;
  late Animation _animation;

  // so that we an access our animation outside
  Animation get animation => this._animation;

  late PageController _pageController;
  PageController get pageController => this._pageController;

  List<Question> _questions = sample_data
      .map(
        (question) => Question(
          id: question['id'],
          question: question['question'],
          answer: question['answer_index'],
          options: question['options'],
        ),
      )
      .toList();

  List<Question> get questions => this._questions;

  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;

  late int _correctAns;
  int get correctAns => this._correctAns;

  late int _selectedAns;
  int get selectedAns => this._selectedAns;

  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => this._questionNumber;

  int _numOfCorrectAns = 0;
  int get numOfCorrectAns => this._numOfCorrectAns;
  // called immediately after the widget is allocated memory
  @override
  void onInit() {
    // Our animation duration is 60 seconds
    // so our plan is to fill the progress bar within 60s
    _animationController = AnimationController(
      duration: Duration(seconds: 60),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        // update like setState
        update();
      });

    // start our animation
    // Once 60s is completed go to next question.
    _animationController.forward().whenComplete(nextQuestion);

    _pageController = PageController();

    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    _animationController.dispose();
    _pageController.dispose();
  }

  void checkAns(Question question, int selectedIndex) {
    // because once the use press any option then it will run
    _isAnswered = true;
    _correctAns = question.answer;
    _selectedAns = selectedIndex;

    if (_correctAns == _selectedAns) _numOfCorrectAns++;
    // It will stop the counter
    _animationController.stop();
    update();

    // Once use select an answer, after 3s it will go to the next qn.
    Future.delayed(Duration(seconds: 3), () {
      nextQuestion();
    });
  }

  void nextQuestion() {
    if (_questionNumber.value != _questions.length) {
      _isAnswered = false;
      _pageController.nextPage(
          duration: Duration(milliseconds: 250), curve: Curves.ease);

      // Reset the counter
      _animationController.reset();

      // Then start again
      // Once timer is finished go to the next question.
      _animationController.forward().whenComplete(nextQuestion);
    }
  }

  void updateTheQnNum(int index) {
    _questionNumber.value = index + 1;
  }
}
