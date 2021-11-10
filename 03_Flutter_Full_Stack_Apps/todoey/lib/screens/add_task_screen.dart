import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AddTaskScreen extends StatelessWidget {
  final Function addTaskCallback;

  const AddTaskScreen({Key? key, required this.addTaskCallback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late String newTaskTitle;

    return Container(
      color: const Color(0xFF757575),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Add Task',
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 28.0,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              TextField(
                autofocus: true,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(),
                onChanged: (value) {
                  newTaskTitle = value;
                },
              ),
              const SizedBox(height: 15.0),
              ElevatedButton(
                onPressed: () {
                  addTaskCallback(newTaskTitle);
                },
                child: const Text(
                  'Add',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
