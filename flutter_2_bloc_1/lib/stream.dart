import 'dart:async';

import 'package:flutter/material.dart';

class ColorStream {
  late Stream colorStream;
  Stream<Color> getColors() async* {
    final List<Color> colors = [
      Colors.blueGrey,
      Colors.amber,
      Colors.deepPurple,
      Colors.lightBlue,
      Colors.teal,
    ];

    yield* Stream.periodic(Duration(seconds: 1), (int t) {
      int index = t % 5;
      return colors[index];
    });
  }
}

class NumberStream {
  StreamController<int> streamController = StreamController<int>();

  addNumberToSink(int newNumber) {
    streamController.sink.add(newNumber);
  }

  addError() {
    streamController.sink.addError('error');
  }

  close() {
    streamController.close();
  }
}
