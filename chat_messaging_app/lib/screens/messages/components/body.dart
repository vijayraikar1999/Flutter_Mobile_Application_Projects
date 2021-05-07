import 'package:chat_messaging_app/models/ChatMessage.dart';
import 'package:flutter/material.dart';
import 'chat_input_field.dart';
import 'message.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: demoChatMessages.length,
            itemBuilder: (context, index) {
              return Message(
                message: demoChatMessages[index],
              );
            },
          ),
        ),
        ChatInputField(),
      ],
    );
  }
}
