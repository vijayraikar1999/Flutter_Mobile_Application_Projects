import 'package:flutter/material.dart';
import '../constants.dart';

class SessionCard extends StatelessWidget {
  const SessionCard({
    Key key,
    this.sessionNum,
    this.isDone = false,
    this.press,
  }) : super(key: key);

  final int sessionNum;
  final bool isDone;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(13.0),
        child: Container(
          width: constraint.maxWidth / 2 - 10,
          // padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13.0),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 17),
                blurRadius: 23.0,
                spreadRadius: -13,
                color: kShadowColor,
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: press,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Container(
                      height: 42.0,
                      width: 43.0,
                      decoration: BoxDecoration(
                        color: isDone ? kBlueColor : Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: kBlueColor),
                      ),
                      child: Icon(
                        Icons.play_arrow,
                        color: isDone ? Colors.white : kBlueColor,
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      'Session $sessionNum',
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
