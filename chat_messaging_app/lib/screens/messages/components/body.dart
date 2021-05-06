import 'package:chat_messaging_app/constants.dart';
import 'package:flutter/material.dart';

import 'chat_input_field.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        ChatInputField(),
      ],
    );
  }
}
