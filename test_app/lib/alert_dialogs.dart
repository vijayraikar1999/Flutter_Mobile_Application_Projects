import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertDialogsExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Dialog Example'),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(
                        'Simple Alert',
                      ),
                      content: Text('This is an alert message.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('OK'),
                        )
                      ],
                    );
                  },
                );
              },
              child: Text('Show Alert'),
            ),
          ],
        ),
      ),
    );
  }
}
