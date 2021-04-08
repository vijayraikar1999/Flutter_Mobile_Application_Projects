import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContainerWidgetExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Container Example'),
      ),
      body: Container(
        width: double.infinity,
        height: 150.0,
        // color: Colors.green,
        margin: EdgeInsets.all(25),
        padding: EdgeInsets.all(35),
        alignment: Alignment.center,
        transform: Matrix4.rotationZ(0.1),
        decoration: BoxDecoration(
          color: Colors.green,
          border: Border.all(color: Colors.black, width: 4.0),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              // color: Colors.green,
              offset: Offset(
                6.0,
                6.0,
              ),
            ),
          ],
        ),
        child: Text(
          'Hello! I am in the container widget!!',
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
