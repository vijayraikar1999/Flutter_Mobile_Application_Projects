import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class RaisedButtonExample extends StatefulWidget {
  @override
  _RaisedButtonExampleState createState() => _RaisedButtonExampleState();
}

class _RaisedButtonExampleState extends State<RaisedButtonExample> {
  String msg = 'Flutter RaisedButton Example';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter RaisedButton Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              msg,
              style: TextStyle(fontSize: 30.0, fontStyle: FontStyle.italic),
            ),
            RaisedButton(
              color: Colors.red,
              textColor: Colors.yellow,
              padding: EdgeInsets.all(8.0),
              splashColor: Colors.grey,
              child: Text(
                'Click here',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                setState(() {
                  if (msg.startsWith('F')) {
                    msg = 'We heave learned Flutter RaisedButton Example';
                  } else {
                    msg = 'Flutter RaisedButton Example';
                  }
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
