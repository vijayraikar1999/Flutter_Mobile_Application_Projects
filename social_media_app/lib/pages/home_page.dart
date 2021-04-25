import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/models/friends.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF251F1F),
        elevation: 0,
        title: Text(
          'TimeLine',
          style: TextStyle(fontSize: 25, fontFamily: 'Eater'),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
            iconSize: 35,
          ),
        ],
      ),
      backgroundColor: Color(0xFF251F1F),
      body: Column(
        children: [
          Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: favorite.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 15.0,
                    vertical: 10.0,
                  ),
                  height: 100,
                  width: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFF3A3740),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(
                          0.0,
                          4.0,
                        ),
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(5),
                        height: 60.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            width: 3.0,
                            color: Color(0xFFfe8057),
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              image: AssetImage(favorite[index].imageUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          bottom: 5.0,
                        ),
                        height: 60.00,
                        child: RotatedBox(
                          quarterTurns: 3,
                          child: Text(
                            favorite[index].name,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white70,
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        color: Color(0xFFfe8057).withOpacity(0.5),
                        height: 6.0,
                        indent: 5.0,
                        endIndent: 5.0,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          _buildPost(),
        ],
      ),
    );
  }
}

_buildPost() {
  return Container(
    margin: EdgeInsets.all(
      15.0,
    ),
    height: 400.0,
    color: Colors.white,
    child: Column(
      children: [
        Row(
          children: [],
        ),
      ],
    ),
  );
}
