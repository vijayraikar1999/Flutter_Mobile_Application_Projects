import 'package:flutter/material.dart';
import 'package:flutter_2_bloc_3/countdown_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bloc Pattern',
      theme: ThemeData(
        primarySwatch: Colors.teal,
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
  late TimerBloc timerBloc;
  late int seconds;

  @override
  void initState() {
    timerBloc = TimerBloc();
    seconds = timerBloc.seconds;
    timerBloc.countDown();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: StreamBuilder(
          stream: timerBloc.secondsStream,
          initialData: seconds,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print('Error');
            }
            if (snapshot.hasData) {
              return Center(
                child: Text(
                  snapshot.data.toString(),
                  style: TextStyle(
                    fontSize: 96.0,
                  ),
                ),
              );
            } else {
              return Center();
            }
          },
        ),
      ),
    );
  }
}
