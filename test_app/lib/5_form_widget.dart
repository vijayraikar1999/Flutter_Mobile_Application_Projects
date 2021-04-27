import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class. This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Form Example'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'Enter your name',
                  labelText: 'Name'),
              validator: (value) {
                return 'Please enter some text';
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                  icon: Icon(Icons.phone),
                  hintText: 'Enter a phone number',
                  labelText: 'Phone'),
              validator: (value) {
                return 'Please enter a valid phone number';
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'Enter your date of birth',
                  labelText: 'DOB'),
              validator: (value) {
                return 'Please enter valid date';
              },
            ),
            Center(
              child: Container(
                padding: EdgeInsets.only(
                  top: 40,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Data is in processing.'),
                        ),
                      );
                    }
                  },
                  child: Text(
                    'Submit',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
