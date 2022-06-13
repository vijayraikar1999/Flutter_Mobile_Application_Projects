import 'package:facebook_clone_responsive_ui/widgets/responsive.dart';
import 'package:facebook_clone_responsive_ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart';

class Rooms extends StatelessWidget {
  final List<User> onlineUsers;

  const Rooms({
    Key? key,
    required this.onlineUsers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bool isDesktop = Responsive.isDesktop(size);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5.0 : 0.0),
      elevation: isDesktop ? 1.0 : 0.0,
      shape: isDesktop
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            )
          : null,
      child: Container(
        height: 60.0,
        color: Colors.white,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
          itemCount: 1 + onlineUsers.length,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: _createRoomButton(),
              );
            }
            final User user = onlineUsers[index - 1];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ProfileAvatar(
                imageUrl: user.imageUrl,
                isActive: true,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _createRoomButton() {
    return OutlinedButton(
      onPressed: () {},
      style: ButtonStyle(
        side: MaterialStateProperty.all(
          BorderSide(
            width: 3.0,
            color: Colors.blueAccent[100]!,
          ),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
      ),
      child: Row(
        children: const [
          // ShaderMask(
          //   shaderCallback: (rect) =>
          //       Palette.createRoomGradient.createShader(rect),
          //   child: const Icon(
          //     Icons.video_call,
          //     size: 35.0,
          //     color: Colors.white,
          //   ),
          // ),
          Icon(
            Icons.video_call,
            size: 35.0,
            color: Colors.purple,
          ),
          SizedBox(width: 4.0),
          Text('Create\nRoom'),
        ],
      ),
    );
  }
}
