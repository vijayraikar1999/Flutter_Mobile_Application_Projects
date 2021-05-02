import 'package:flutter/material.dart';

class GesturesExamples extends StatefulWidget {
  @override
  _GesturesExamplesState createState() => _GesturesExamplesState();
}

class _GesturesExamplesState extends State<GesturesExamples> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gesture Flutter Example'),
      ),
      body: Center(
        child: InkWell(
          onTap: () {
            print('Clicked');
          },
          child: Container(
            height: 50.0,
            width: 100.0,
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.cyan, width: 3),
              borderRadius: BorderRadius.circular(
                15.0,
              ),
              // color: Colors.greenAccent,
            ),
            child: Center(
              child: Text(
                'Click me',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
