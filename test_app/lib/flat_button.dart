import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlatButtonExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter FlatButton Example'),
      ),
      body: Center(
        child: Column(
          children: [
            ButtonContainer(
              color: Colors.green,
              text: 'Sign Up',
              textColor: Colors.black,
            ),
            ButtonContainer(
              color: Colors.lightBlueAccent,
              text: 'Sign In',
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonContainer extends StatelessWidget {
  ButtonContainer({this.color, this.text, this.textColor});

  final Color color;
  final String text;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(25),
      child: FlatButton(
        color: color,
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 20.0,
          ),
        ),
        onPressed: () {},
      ),
    );
  }
}
