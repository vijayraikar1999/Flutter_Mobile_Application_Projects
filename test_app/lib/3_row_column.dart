import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RowColumnExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Row Example'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              color: Colors.red,
              child: RowElement(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
              ),
            ),
            Container(
              color: Colors.red,
              child: RowElement(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
            ),
            Container(
              color: Colors.red,
              child: RowElement(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RowElement extends StatelessWidget {
  RowElement({this.mainAxisAlignment});

  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Container(
          margin: EdgeInsets.all(12.0),
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.green,
          ),
          child: Text(
            'Child A',
            style: TextStyle(
              color: Colors.yellow,
              fontSize: 25.0,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(12.0),
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.green,
          ),
          child: Text(
            'Child B',
            style: TextStyle(
              color: Colors.yellow,
              fontSize: 25.0,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(12.0),
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.green,
          ),
          child: Text(
            'Child C',
            style: TextStyle(
              color: Colors.yellow,
              fontSize: 25.0,
            ),
          ),
        ),
      ],
    );
  }
}
