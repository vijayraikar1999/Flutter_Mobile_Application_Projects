import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notable/models/note.dart';
import 'package:notable/utilities/constants.dart';

class AddNoteScreen extends StatelessWidget {
  static const String id = 'add_note_screen';
  AddNoteScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();

  void _summit(BuildContext context) {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      // handle submission
      final notes = Hive.box('notes');
      final note = Note(
        title: _titleController.text.trim(),
        body: _bodyController.text.trim(),
        date: DateTime.now(),
      );
      notes.add(note);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'New Note',
          style: TextStyle(fontFamily: 'Satisfy'),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  cursorColor: kYellowColor,
                  controller: _titleController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Title',
                  ),
                  validator: (value) => value != null && value.trim().length > 0
                      ? null
                      : 'Field cannot be empty',
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: _bodyController,
                  cursorColor: kYellowColor,
                  maxLines: 5,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Body',
                  ),
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 500.0),
                  width: double.infinity,
                  height: 50.0,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(kYellowColor),
                      foregroundColor: MaterialStateProperty.all(kDarkGrey),
                    ),
                    onPressed: () => _summit(context),
                    child: const Text('ADD NOTE'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
