import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class GamePageProvider extends ChangeNotifier {
  final Dio _dio = Dio();
  BuildContext context;
  final _maxQuestions = 10;
  List? questions;
  int _currentQuestionCount = 0;
  int _correctCount = 0;
  final String difficultyLevel;

  GamePageProvider({
    required this.context,
    required this.difficultyLevel,
  }) {
    _dio.options.baseUrl = 'https://opentdb.com/api.php';
    _getQuestionsFromAPI();
  }

  Future<void> _getQuestionsFromAPI() async {
    var _response = await _dio.get(
      '',
      queryParameters: {
        'amount': 10,
        'type': 'boolean',
        'difficulty': 'easy',
      },
    );
    var _data = jsonDecode(_response.toString());
    questions = _data['results'];
    notifyListeners();
  }

  String getCurrentQuestionText() {
    return questions![_currentQuestionCount]['question'];
  }

  void answerQuestion(String _answer) async {
    bool isCorrect =
        questions![_currentQuestionCount]['correct_answer'] == _answer;

    _correctCount += isCorrect ? 1 : 0;

    _currentQuestionCount++;
    showDialog(
        context: context,
        builder: (_context) {
          return AlertDialog(
            backgroundColor: isCorrect ? Colors.green : Colors.red,
            title: Icon(
              isCorrect ? Icons.check_circle : Icons.cancel_sharp,
              color: Colors.white,
            ),
          );
        });
    await Future.delayed(
      const Duration(
        seconds: 1,
      ),
    );
    Navigator.pop(context);
    if (_currentQuestionCount == _maxQuestions) {
      endGame();
    } else {
      notifyListeners();
    }
  }

  Future<void> endGame() async {
    showDialog(
      context: context,
      builder: (_context) {
        return AlertDialog(
          backgroundColor: Colors.blue,
          title: const Text(
            'End Game!',
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.white,
            ),
          ),
          content: Text(
            'Score: $_correctCount/$_maxQuestions',
          ),
        );
      },
    );
    await Future.delayed(
      const Duration(seconds: 3),
    );
    Navigator.pop(context);
    Navigator.pop(context);
  }
}
