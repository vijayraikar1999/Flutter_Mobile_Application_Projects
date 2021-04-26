import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social_media_app/models/friends.dart';
import 'package:social_media_app/models/post.dart';

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
      body: SingleChildScrollView(
        child: Column(
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
            _buildPost(0),
            _buildPost(1),
            _buildPost(2),
            _buildPost(3),
            _buildPost(4),
          ],
        ),
      ),
    );
  }
}

_buildPost(int index) {
  return Container(
    margin: EdgeInsets.all(
      15.0,
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.all(5),
              height: 70.0,
              width: 70.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
                border: Border.all(
                  width: 3.0,
                  color: Color(0xFFfe8057).withOpacity(0.5),
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.0),
                  image: DecorationImage(
                    image: AssetImage(posts[index].friend.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  posts[index].friend.name,
                  style: TextStyle(
                      color: Colors.white54, fontSize: 16, letterSpacing: 1.2),
                ),
              ),
            ),
            Text(
              posts[index].timePosted,
              style: TextStyle(
                color: Colors.white54,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(
            top: 10.0,
          ),
          height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            image: DecorationImage(
              image: AssetImage(posts[index].imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: 50.0,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.mode_comment,
                      color: Colors.white54,
                      size: 30.0,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      posts[index].comments,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white54,
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      '|',
                      style: TextStyle(
                        fontSize: 35.0,
                        color: Colors.white54,
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Icon(
                      Icons.share,
                      color: Colors.white54,
                      size: 30.0,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      posts[index].comments,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white54,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      posts[index].comments,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white54,
                      ),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Icon(
                      Icons.thumb_up,
                      color: Colors.white54,
                      size: 30.0,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: Text(
              posts[index].description,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.white54,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
