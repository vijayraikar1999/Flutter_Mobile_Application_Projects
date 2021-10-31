import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_2_bloc_1/stream.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stream',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: StreamHomePage(),
    );
  }
}

class StreamHomePage extends StatefulWidget {
  const StreamHomePage({Key? key}) : super(key: key);

  @override
  _StreamHomePageState createState() => _StreamHomePageState();
}

class _StreamHomePageState extends State<StreamHomePage> {
  late Color bgColor;
  late ColorStream colorStream;

  int lastNumber = 0;
  late StreamController numberStreamController;
  late NumberStream numberStream;

  late StreamTransformer streamTransformer;

  late StreamSubscription streamSubscription;
  late StreamSubscription streamSubscription2;
  String values = '';

  @override
  void initState() {
    numberStream = NumberStream();
    numberStreamController = numberStream.streamController;
    Stream stream = numberStreamController.stream.asBroadcastStream();

    streamSubscription = stream.listen((event) {
      setState(() {
        values += event.toString() + ' - ';
      });
    });

    streamSubscription2 = stream.listen((event) {
      setState(() {
        values += event.toString() + ' - ';
      });
    });

    streamSubscription.onError((error) {
      setState(() {
        lastNumber = -1;
      });
    });

    streamSubscription.onDone(() {
      print('OnDone was called');
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stream'),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              values,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.grey),
              ),
              onPressed: () => addRandomNumber(),
              child: Text('New Random Number'),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.grey),
              ),
              onPressed: () => stopStream(),
              child: Text('Stop Stream'),
            ),
          ],
        ),
      ),
    );
  }

  changeColor() async {
    colorStream.getColors().listen((eventColor) {
      setState(() {
        bgColor = eventColor;
      });
    });
  }

  void addRandomNumber() {
    Random random = Random();
    int myNum = random.nextInt(10);

    if (numberStreamController.isClosed) {
      setState(() {
        values = (-1).toString();
      });
    } else {
      numberStream.addNumberToSink(myNum);
      // numberStream.addError();
    }
  }

  void stopStream() {
    numberStreamController.close();
  }
}
