import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class GamePageProvider extends ChangeNotifier {
  final Dio _dio = Dio();
  BuildContext context;
  final _maxQuestions = 10;
  List? questions;

  GamePageProvider({required this.context}) {
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
  }
}
