import 'dart:async';

class TimerBloc {
  int seconds = 60;

  StreamController _secondsStreamController = StreamController();

  Stream get secondsStream =>
      _secondsStreamController.stream.asBroadcastStream();
  StreamSink get secondsSink => _secondsStreamController.sink;

  Future decreaseSeconds() async {
    await Future.delayed(const Duration(seconds: 1));
    seconds--;
    secondsSink.add(seconds);
  }

  int returnSeconds(int seconds) {
    return seconds;
  }

  countDown() async {
    for (var i = seconds; i > 0; i--) {
      await decreaseSeconds();
      returnSeconds(seconds);
    }
  }

  void dispose() {
    _secondsStreamController.close();
  }
}
