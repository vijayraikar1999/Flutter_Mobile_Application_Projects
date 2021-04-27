import 'package:flutter/material.dart';

class ButtonsExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Buttons Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () {},
              child: Text('Text Button field'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'Elevated Button field',
              ),
            ),
            OutlinedButton(
              onPressed: () {},
              child: Text(
                'Outlined Button field',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
